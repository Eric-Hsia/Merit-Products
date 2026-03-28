# Sensor Read Example — Merit-Product-Beta

## Overview

Reads temperature, humidity, and pressure from the Merit-Product-Beta sensor
module over I2C every 2 seconds and prints the results to the serial console.

## Hardware Required

- A host development board with I2C capability
- Merit-Product-Beta module × 1
- Jumper wires

## Wiring

| Host MCU | Merit-Product-Beta |
|---|---|
| 3V3 | VCC |
| GND | GND |
| I2C_SDA (GPIO21) | SDA |
| I2C_SCL (GPIO22) | SCL |

## How to Build and Flash

```bash
idf.py build
idf.py -p PORT flash monitor
```

## Expected Output

```
Merit-Product-Beta Sensor Read Example
Temperature: 25.30 °C  Humidity: 48.20 %  Pressure: 1013.25 hPa
Temperature: 25.32 °C  Humidity: 48.18 %  Pressure: 1013.24 hPa
...
```
