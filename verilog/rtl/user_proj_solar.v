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
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,

    // IOs
    input  [23:0] io_in,
    output [11:0] io_out,
    output [11:0] io_oeb

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
    .voltage(io_in[11:0]),    // Connect analog_io to voltage
    .current(io_in[23:12]),   // Connect analog_io to current
    .temperature({12{1'b0}}),  // Connect analog_io to temperature
    .voltage_display(voltage_display),  // Connect display signals
    .current_display(current_display),
    .power_display(power_display),
    .temperature_display(temperature_display),
    .efficiency_display(efficiency_display)
);

// Define the select_signal
reg [4:0] select_signal;
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

assign io_out[11:0] = mux5to1_out;
assign select_signal = 5'b1;

// Connect the OEB signals to the correct pins on the FPGA or other device.
// assign io_oeb[13] = select_signal[4];
// assign io_oeb[12] = select_signal[3];
// assign io_oeb[11] = select_signal[2];
// assign io_oeb[10] = select_signal[1];
// assign io_oeb[9] = select_signal[0];
assign io_oeb[8:0] = 9'b0;
assign io_oeb[11:9] = ~select_signal[2:0];

endmodule

module mux_5to1 (
    // Inputs to the MUX
	input clk,
	input rst,
    input [4:0] select,       // 3-bit input to select the desired signal
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
        5'b00001: mux_out_reg <= voltage_display;
        5'b00010: mux_out_reg <= current_display;
        5'b00100: mux_out_reg <= power_display;
        5'b01000: mux_out_reg <= temperature_display;
        5'b10000: mux_out_reg <= efficiency_display;
        default: mux_out_reg <= voltage_display;  // Default case (can be modified as needed)
    endcase
	end
end
	
	assign mux = mux_out_reg;

endmodule  // mux_5to1

