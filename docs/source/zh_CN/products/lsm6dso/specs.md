<h1 align="center">LSM6DSOX 规格参数</h1>

## 引脚图

![LSM6DSOX Pinout Diagram](../../../../_static/merit-lsm6dso-6DoF/v2.1/merit-lsm6dso-6DoF-Pinout-Diagram.png.png)

## 电气特性

| 参数 | 数值 | 单位 |
|------|------|------|
| 供电电压 (VDD) | 1.71 - 3.6 | V |
| 数字 I/O 电压 (VDDIO) | 1.62 - 3.6 | V |
| 工作电流 (高性能模式) | 0.55 | mA |
| 工作电流 (低功耗模式) | 4 | µA |
| 温度范围 | -40 至 +85 | °C |

## 加速度计规格

| 参数 | 数值 |
|------|------|
| 全量程范围 | ±2, ±4, ±8, ±16 g |
| 灵敏度 | 0.061, 0.122, 0.244, 0.488 mg/LSB |
| 输出数据速率 | 1.6 Hz - 6.66 kHz |
| 噪声密度 | 70 µg/√Hz |

## 陀螺仪规格

| 参数 | 数值 |
|------|------|
| 全量程范围 | ±125, ±250, ±500, ±1000, ±2000 dps |
| 灵敏度 | 4.375, 8.75, 17.50, 35.0, 70.0 mdps/LSB |
| 输出数据速率 | 12.5 Hz - 6.66 kHz |
| 噪声密度 | 4.0 mdps/√Hz |

## 机械尺寸

- **封装类型**：LGA-14
- **尺寸**：2.5mm × 3.0mm × 0.83mm
- **重量**：约 10 mg

## 引脚配置

| 引脚 |   名称  |                              功能描述                             |
|:---:|:-------:|:-----------------------------------------------------------------:|
|  1  |   VIN   |                          Power Input, 3-5V                         |
|  2  |   3.3V  |               3.3V output from the voltage regulator              |
|  3  |   GND   |                 common ground for power and logic                 |
|  4  |   SDA   |                            I2C data pin                           |
|  5  |   SCL   |                           I2C clock pin                           |
|  6  |   SDO   |          1. SPI serial data output 2. I2C I2C Address pin         |
|  7  |   IN1   |               Programmable interrupt in I²C and SPI               |
|  8  |   IN2   |                      Programmable interrupt 2                     |
|  9  |    CS   |                      Chip Select pin for SPI                      |
|  10 |   GND   |                 common ground for power and logic                 |
|  11 | OCS_AUX | Pins for advanced users to connect the LSM6DSOX to another sensor |
|  12 | SDO_AUX | Pins for advanced users to connect the LSM6DSOX to another sensor |
|  13 |   SDx   | Pins for advanced users to connect the LSM6DSOX to another sensor |
|  14 |   SCx   | Pins for advanced users to connect the LSM6DSOX to another sensor |

## 通信接口

### I²C 模式

- **地址**：0x6A (SDO=GND) 或 0x6B (SDO=VDDIO)
- **速度**：标准模式 (100 kHz)、快速模式 (400 kHz)、快速+模式 (1 MHz)

### SPI 模式

- **模式**：0 (CPOL=0, CPHA=0) 或 3 (CPOL=1, CPHA=1)
- **速度**：最高 10 MHz
