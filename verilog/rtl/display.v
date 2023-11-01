module display (
  input clk,
  input reset,

  input [11:0] voltage_in,
  input [11:0] current_in,
  input [11:0] power_in,
  input [11:0] temperature_in,
  input [11:0] efficiency_in,

  output [11:0] voltage_display,
  output [11:0] current_display,
  output [11:0] power_display,
  output [11:0] temperature_display,
  output [11:0] efficiency_display
);

  // Internal registers
  reg [11:0] voltage_reg;
  reg [11:0] current_reg;
  reg [11:0] power_reg;
  reg [11:0] temperature_reg;
  reg [11:0] efficiency_reg;

  // Always block to latch the input signals
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      voltage_reg <= 0;
      current_reg <= 0;
      power_reg <= 0;
      temperature_reg <= 0;
      efficiency_reg <= 0;
    end else begin
      voltage_reg <= voltage_in;
      current_reg <= current_in;
      power_reg <= power_in;
      temperature_reg <= temperature_in;
      efficiency_reg <= efficiency_in;
    end
  end

  // Assign the output signals
  assign voltage_display = voltage_reg;
  assign current_display = current_reg;
  assign power_display = power_reg;
  assign temperature_display = temperature_reg;
  assign efficiency_display = efficiency_reg;

endmodule

