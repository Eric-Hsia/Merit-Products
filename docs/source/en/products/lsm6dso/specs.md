# Specifications

## Electrical Characteristics

| Parameter | Value | Unit |
|-----------|-------|------|
| Supply Voltage (VDD) | 1.71 - 3.6 | V |
| Supply Voltage (VDDIO) | 1.62 - 3.6 | V |
| Operating Current (High Performance) | 0.55 | mA |
| Operating Current (Low Power) | 4 | µA |
| Temperature Range | -40 to +85 | °C |

## Accelerometer Specifications

| Parameter | Value |
|-----------|-------|
| Full-Scale Range | ±2, ±4, ±8, ±16 g |
| Sensitivity | 0.061, 0.122, 0.244, 0.488 mg/LSB |
| Output Data Rate | 1.6 Hz - 6.66 kHz |
| Noise Density | 70 µg/√Hz |

## Gyroscope Specifications

| Parameter | Value |
|-----------|-------|
| Full-Scale Range | ±125, ±250, ±500, ±1000, ±2000 dps |
| Sensitivity | 4.375, 8.75, 17.50, 35.0, 70.0 mdps/LSB |
| Output Data Rate | 12.5 Hz - 6.66 kHz |
| Noise Density | 4.0 mdps/√Hz |

## Mechanical Dimensions

- **Package**: LGA-14
- **Dimensions**: 2.5mm × 3.0mm × 0.83mm
- **Weight**: ~10 mg

## Pin Configuration

| Pin | Name | Function |
|-----|------|----------|
| 1 | VDDIO | Digital I/O supply |
| 2 | SCL | I²C clock / SPI SCK |
| 3 | SDA | I²C data / SPI SDI |
| 4 | SDO | SPI data out / I²C address select |
| 5 | CS | SPI chip select |
| 6 | INT1 | Interrupt 1 |
| 7 | INT2 | Interrupt 2 |
| 8 | GND | Ground |
| 9 | VDD | Power supply |

## Communication Interface

### I²C Mode
- **Address**: 0x6A (SDO=GND) or 0x6B (SDO=VDDIO)
- **Speed**: Standard (100 kHz), Fast (400 kHz), Fast+ (1 MHz)

### SPI Mode
- **Mode**: 0 (CPOL=0, CPHA=0) or 3 (CPOL=1, CPHA=1)
- **Speed**: Up to 10 MHz
