###############################################################################
# Created by write_sdc
# Wed Nov  1 17:21:29 2023
###############################################################################
current_design user_proj_solar
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 25.0000 [get_ports {wb_clk_i}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_clock_latency -source -min 4.6500 [get_clocks {clk}]
set_clock_latency -source -max 5.5700 [get_clocks {clk}]
set_input_delay 12.5000 -clock [get_clocks {clk}] -add_delay [get_ports {wb_rst_i}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.1900 [get_ports {analog_io[28]}]
set_load -pin_load 0.1900 [get_ports {analog_io[27]}]
set_load -pin_load 0.1900 [get_ports {analog_io[26]}]
set_load -pin_load 0.1900 [get_ports {analog_io[25]}]
set_load -pin_load 0.1900 [get_ports {analog_io[24]}]
set_load -pin_load 0.1900 [get_ports {analog_io[23]}]
set_load -pin_load 0.1900 [get_ports {analog_io[22]}]
set_load -pin_load 0.1900 [get_ports {analog_io[21]}]
set_load -pin_load 0.1900 [get_ports {analog_io[20]}]
set_load -pin_load 0.1900 [get_ports {analog_io[19]}]
set_load -pin_load 0.1900 [get_ports {analog_io[18]}]
set_load -pin_load 0.1900 [get_ports {analog_io[17]}]
set_load -pin_load 0.1900 [get_ports {analog_io[16]}]
set_load -pin_load 0.1900 [get_ports {analog_io[15]}]
set_load -pin_load 0.1900 [get_ports {analog_io[14]}]
set_load -pin_load 0.1900 [get_ports {analog_io[13]}]
set_load -pin_load 0.1900 [get_ports {analog_io[12]}]
set_load -pin_load 0.1900 [get_ports {analog_io[11]}]
set_load -pin_load 0.1900 [get_ports {analog_io[10]}]
set_load -pin_load 0.1900 [get_ports {analog_io[9]}]
set_load -pin_load 0.1900 [get_ports {analog_io[8]}]
set_load -pin_load 0.1900 [get_ports {analog_io[7]}]
set_load -pin_load 0.1900 [get_ports {analog_io[6]}]
set_load -pin_load 0.1900 [get_ports {analog_io[5]}]
set_load -pin_load 0.1900 [get_ports {analog_io[4]}]
set_load -pin_load 0.1900 [get_ports {analog_io[3]}]
set_load -pin_load 0.1900 [get_ports {analog_io[2]}]
set_load -pin_load 0.1900 [get_ports {analog_io[1]}]
set_load -pin_load 0.1900 [get_ports {analog_io[0]}]
set_input_transition 0.6100 [get_ports {wb_clk_i}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 1.0000 [current_design]
set_max_fanout 16.0000 [current_design]
