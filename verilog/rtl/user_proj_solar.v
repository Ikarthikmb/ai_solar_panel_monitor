// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module user_proj_solar (
`ifdef USE_POWER_PINS
    inout vccd1,  // User area 1 1.8V supply
    inout vssd1,  // User area 1 digital ground
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,

	// Analog 
    inout [`MPRJ_IO_PADS-10:0] analog_io
);

    wire [11:0] voltage_display;
    wire [11:0] current_display;
    wire [11:0] power_display;
    wire [11:0] temperature_display;
    wire [11:0] efficiency_display;

// Instantiate ai_solar_panel_monitor
ai_solar_panel_monitor solar_monitor (
    .clk(wb_clk_i),     // Use the Wishbone clock for solar_monitor
    .reset(wb_rst_i),   // Use the Wishbone reset for solar_monitor
    .voltage(analog_io[11:0]),    // Connect analog_io to voltage
    .current({{7{1'b0}},analog_io[16:12]}),   // Connect analog_io to current
    .temperature({12{1'b0}}),  // Connect analog_io to temperature
    .voltage_display(voltage_display),  // Connect display signals
    .current_display(current_display),
    .power_display(power_display),
    .temperature_display(temperature_display),
    .efficiency_display(efficiency_display)
);

// Define the select_signal
reg [2:0] select_signal;
wire [11:0] mux5to1_out;
mux_5to1 display_mux (
	.clk(wb_clk_i),
	.rst(wb_rst_i),
    .select(select_signal),  // Provide the select signal to choose the desired display
    .voltage_display(voltage_display),
    .current_display(current_display),
    .power_display(power_display),
    .temperature_display(temperature_display),
    .efficiency_display(efficiency_display),
    .mux(mux5to1_out)
);

assign analog_io[28:17] = mux5to1_out;
assign select_signal = 3'b1;

endmodule

module mux_5to1 (
    // Inputs to the MUX
	input clk,
	input rst,
    input [2:0] select,       // 3-bit input to select the desired signal
    input [11:0] voltage_display,
    input [11:0] current_display,
    input [11:0] power_display,
    input [11:0] temperature_display,
    input [11:0] efficiency_display,
    
    // Output signal
    output [11:0] mux  // Output of the MUX
);

    reg [11:0] mux_out_reg;  // Output of the MUX

always @(posedge clk or posedge rst) begin
	if (rst) 
		mux_out_reg <= 12'b0;
	else begin case (select)
        3'b000: mux_out_reg <= voltage_display;
        3'b001: mux_out_reg <= current_display;
        3'b010: mux_out_reg <= power_display;
        3'b011: mux_out_reg <= temperature_display;
        3'b100: mux_out_reg <= efficiency_display;
        default: mux_out_reg <= voltage_display;  // Default case (can be modified as needed)
    endcase
	end
end
	
	assign mux = mux_out_reg;

endmodule  // mux_5to1

