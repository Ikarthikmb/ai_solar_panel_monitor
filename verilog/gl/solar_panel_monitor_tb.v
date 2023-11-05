module solar_panel_monitor_tb;

  // Clock generator
  reg clk=0;
  reg reset;
  always #5 clk = ~clk;

  // Inputs to the solar_panel_monitor module
  reg [11:0] voltage;
  reg [11:0] current;
  reg [11:0] temperature;

  // Outputs from the solar_panel_monitor module
  wire [11:0] voltage_display;
  wire [11:0] current_display;
  wire [11:0] power_display;
  wire [11:0] temperature_display;
  wire [11:0] efficiency_display;

  // Solar panel monitor module instance
  ai_solar_panel_monitor solar_panel_monitor_module (
    .clk(clk),
    .reset(reset),

    .voltage(voltage),
    .current(current),
    .temperature(temperature),

    .voltage_display(voltage_display),
    .current_display(current_display),
    .power_display(power_display),
    .temperature_display(temperature_display),
    .efficiency_display(efficiency_display)
  );

  initial begin
    reset = 1;
    #1 reset = 0;
  end

  always @(posedge clk) begin
    // Apply test cases to the solar_panel_monitor module
    // Test case 1:
    voltage = 1200;
    current = 500;
    temperature = 250;
    #10;

    // Test case 2:
    voltage = 1400;
    current = 600;
    temperature = 250;
    #10;

    // Test case 3:
    voltage = 1600;
    current = 700;
    temperature = 250;
    #10;
  end

  reg [11:0] expected_voltage_display;
  reg [11:0] expected_current_display;
  reg [11:0] expected_power_display;
  reg [11:0] expected_temperature_display;
  reg [11:0] expected_efficiency_display;
  
  /*
  always @(posedge clk) begin
  	if (~reset) begin
		// Calculate the expected output signals
		expected_voltage_display = voltage;
		expected_current_display = current;
		expected_power_display = voltage * current;
		expected_temperature_display = temperature;
		expected_efficiency_display = expected_power_display / voltage;
	
		// Monitor the input and output signals
		$monitor("Voltage: %d, Current: %d, Temperature: %d", voltage, current, temperature);
		$monitor("Voltage display: %d, Current display: %d", voltage_display, current_display);
		$monitor("Power display: %d, Temperature display: %d, Efficiency display: %d", power_display, temperature_display, efficiency_display);
		$monitor("Expected voltage display: %d, Expected current display: %d", expected_voltage_display, expected_current_display);
		$monitor("Expected power display: %d, Expected temperature display: %d, Expected efficiency display: %d", expected_power_display, expected_temperature_display, expected_efficiency_display);
	
		// Check the output signals of the solar_panel_monitor module
		if (voltage_display != expected_voltage_display) begin
		$display("Error: Voltage display is incorrect");
		end
	
		if (current_display != expected_current_display) begin
		$display("Error: Current display is incorrect");
		end
	
		if (power_display != expected_power_display) begin
		$display("Error: Power display is incorrect");
		end
	
		if (temperature_display != expected_temperature_display) begin
		$display("Error: Temperature display is incorrect");
		end
	
		if (efficiency_display != expected_efficiency_display) begin
		$display("Error: Efficiency display is incorrect");
		end
	end
  end
  */

  initial begin
  	$display("clk\treset\tvolt\tcnt\ttemp\tvolt_o\tcnt_o\tpwr_o\ttemp_o\teff_o");
  	$monitor(clk,"\t", reset,"\t", voltage,"\t", current,"\t", temperature,"\t", voltage_display,"\t", current_display,"\t", power_display,"\t", temperature_display,"\t", efficiency_display);
  end

  initial begin
    $dumpfile("solar_panel_monitor_tb.vcd");
    $dumpvars(0, solar_panel_monitor_tb);
	#200 $finish;
  end

endmodule

