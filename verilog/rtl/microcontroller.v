module microcontroller (
  input clk,
  input reset,

  input [11:0] voltage_in,
  input [11:0] current_in,
  input [11:0] temperature_in,

  output [11:0] power_out,
  output [11:0] temperature_out,
  output [11:0] efficiency_out
);

  // Internal registers
  reg [11:0] power_reg;
  reg [11:0] temperature_reg;
  reg [11:0] efficiency_reg;

  // Always block to calculate the power, temperature, and efficiency
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      power_reg <= 0;
      temperature_reg <= 0;
      efficiency_reg <= 0;
    end else begin
      power_reg <= voltage_in * current_in;
      temperature_reg <= temperature_in;
      efficiency_reg <= power_reg / voltage_in;
    end
  end

  // Assign the output signals
  assign power_out = power_reg;
  assign temperature_out = temperature_reg;
  assign efficiency_out = efficiency_reg;

endmodule

