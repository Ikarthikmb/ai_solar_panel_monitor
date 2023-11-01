module adc (
  input clk,
  input reset,

  // Inputs from the sensors
  input [11:0] voltage_in,
  input [11:0] current_in,
  input [11:0] temperature_in,

  // Outputs to the display
  output [11:0] voltage_out,
  output [11:0] current_out,
  output [11:0] temperature_out
);

  // Internal registers
  reg [11:0] voltage_reg;
  reg [11:0] current_reg;
  reg [11:0] temperature_reg;

  // Always block to convert the analog inputs to digital signals
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      voltage_reg <= 0;
      current_reg <= 0;
      temperature_reg <= 0;
    end else begin
      voltage_reg <= voltage_in;
      current_reg <= current_in;
      temperature_reg <= temperature_in;
    end
  end

  // Assign the digital outputs
  assign voltage_out = voltage_reg;
  assign current_out = current_reg;
  assign temperature_out = temperature_reg;

endmodule

