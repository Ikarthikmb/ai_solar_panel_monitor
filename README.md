# Solar Panel Monitor 
*Caravel User Project*

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

This RTL block implements an AI-powered solar panel monitor. It takes the voltage, current, and temperature readings from the solar panel as inputs, and calculates the power and efficiency of the solar panel. The results are then displayed on an external display.

| Pin | Size (bits) | Description |
|---|---|---|
| `voltage` | 12 | Solar panel voltage input |
| `current` | 12 | Solar panel current input |
| `temperature` | 12 | Solar panel temperature input |
| `clk` | 1 | Clock signal |
| `reset` | 1 | Reset signal |
| `voltage_display` | 12 | Digital voltage display output |
| `current_display` | 12 | Digital current display output |
| `power_display` | 12 | Digital power display output |
| `temperature_display` | 12 | Digital temperature display output |
| `efficiency_display` | 12 | Digital efficiency display output |


### Usage

To use the AI solar panel monitor, simply connect the voltage, current, and temperature sensors from the solar panel to the corresponding inputs of the block. Then, connect the external display to the outputs of the display module.

The block will then automatically start monitoring the solar panel and displaying the results on the external display.

### Features

* AI-powered power and efficiency calculation
* Easy to use
* Comprehensive display of solar panel information

### Applications

* Solar panel monitoring systems
* Energy management systems
* Renewable energy systems

