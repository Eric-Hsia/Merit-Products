# Specifications

## General Specifications

| Parameter | Value |
|-----------|-------|
| Supply Voltage | 3.3V ± 5% |
| Operating Current | 5 mA (typical) |
| Sleep Current | 10 µA |
| Operating Temperature | -40°C to +85°C |
| Storage Temperature | -40°C to +125°C |
| Interface | I²C (400 kHz) / SPI (8 MHz) |

## Accelerometer

| Parameter | Specification |
|-----------|---------------|
| Axes | 3 (X, Y, Z) |
| Full-Scale Range | ±2g, ±4g, ±8g, ±16g |
| Resolution | 16-bit |
| Sensitivity | 0.98 mg/LSB (±2g) |
| Output Data Rate | 12.5 Hz - 4 kHz |
| Noise Density | 180 µg/√Hz |

## Gyroscope

| Parameter | Specification |
|-----------|---------------|
| Axes | 3 (Roll, Pitch, Yaw) |
| Full-Scale Range | ±250, ±500, ±1000, ±2000 dps |
| Resolution | 16-bit |
| Sensitivity | 8.75 mdps/LSB (±250 dps) |
| Output Data Rate | 12.5 Hz - 4 kHz |
| Noise Density | 0.007 dps/√Hz |

## Magnetometer

| Parameter | Specification |
|-----------|---------------|
| Axes | 3 (X, Y, Z) |
| Full-Scale Range | ±4800 µT |
| Resolution | 16-bit |
| Sensitivity | 0.15 µT/LSB |
| Output Data Rate | 10 Hz - 100 Hz |

## Barometer

| Parameter | Specification |
|-----------|---------------|
| Pressure Range | 300 - 1100 hPa |
| Absolute Accuracy | ±1 hPa |
| Relative Accuracy | ±0.12 hPa |
| Temperature Coefficient | ±0.5 Pa/K |
| Output Data Rate | Up to 75 Hz |

## Physical Dimensions

- **Package**: LGA-24
- **Size**: 5.0mm × 5.0mm × 1.1mm
- **Weight**: ~50 mg

## Pinout

| Pin | Name | Description |
|-----|------|-------------|
| 1 | VCC | 3.3V Power supply |
| 2 | GND | Ground |
| 3 | SCL/SCK | I²C clock / SPI clock |
| 4 | SDA/MOSI | I²C data / SPI MOSI |
| 5 | MISO | SPI MISO (I²C: NC) |
| 6 | CS | Chip select (I²C: NC) |
| 7 | INT1 | Interrupt pin 1 |
| 8 | INT2 | Interrupt pin 2 |

## Communication Protocol

### I²C Interface
- **Address**: 0x68 (default)
- **Clock Speed**: Up to 400 kHz (Fast mode)
- **Data Format**: Little-endian

### SPI Interface
- **Mode**: CPOL=0, CPHA=0 (Mode 0)
- **Clock Speed**: Up to 8 MHz
- **Bit Order**: MSB first

## Calibration

The IMU10A requires calibration for optimal performance:

1. **Accelerometer**: 6-position calibration
2. **Gyroscope**: Static bias calibration
3. **Magnetometer**: Hard/soft iron compensation
4. **Barometer**: Sea-level reference setting

Refer to the calibration guide in the software documentation for detailed procedures.
