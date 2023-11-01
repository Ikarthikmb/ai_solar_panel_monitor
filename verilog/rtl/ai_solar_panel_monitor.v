module ai_solar_panel_monitor (
  input clk,
  input reset,

  // Inputs from the sensors
  input [11:0] voltage,
  input [11:0] current,
  input [11:0] temperature,

  // Outputs to the display
  output [11:0] voltage_display,
  output [11:0] current_display,
  output [11:0] power_display,
  output [11:0] temperature_display,
  output [11:0] efficiency_display
);

  wire [11:0] adc_voltage_out;
  wire [11:0] adc_current_out;
  wire [11:0] adc_temperature_out;
  wire [11:0] mc_power_out;
  wire [11:0] mc_temperature_out;
  wire [11:0] mc_efficiency_out;

  wire [11:0] voltage_display_out;
  wire [11:0] current_display_out;
  wire [11:0] power_display_out;
  wire [11:0] temperature_display_out;
  wire [11:0] efficiency_display_out;

  // ADC module
  adc adc_module (
    .clk(clk),
    .reset(reset),
    .voltage_in(voltage),
    .current_in(current),
    .temperature_in(temperature),

    .voltage_out(adc_voltage_out),
    .current_out(adc_current_out),
    .temperature_out(adc_temperature_out)
  );

  // Microcontroller module
  microcontroller microcontroller_module (
    .clk(clk),
    .reset(reset),
    .voltage_in(adc_voltage_out),
    .current_in(adc_current_out),
    .temperature_in(adc_temperature_out),

    .power_out(mc_power_out),
    .temperature_out(mc_temperature_out),
    .efficiency_out(mc_efficiency_out)
  );

  // Display module
  display display_module (
    .clk(clk),
    .reset(reset),

    .voltage_in(adc_voltage_out),
    .current_in(adc_current_out),
    .power_in(mc_power_out),
    .temperature_in(mc_temperature_out),
    .efficiency_in(mc_efficiency_out),

	.voltage_display(voltage_display_out),
	.current_display(current_display_out),
	.power_display(power_display_out),
	.temperature_display(temperature_display_out),
	.efficiency_display(efficiency_display_out)
  );

  assign voltage_display = voltage_display_out;
  assign current_display = current_display_out;
  assign power_display = power_display_out;
  assign temperature_display = temperature_display_out;
  assign efficiency_display = efficiency_display_out;

endmodule

