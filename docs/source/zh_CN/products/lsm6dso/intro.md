# 产品简介

## 概述

**LSM6DSO-6DoF** 是一款高性能六轴惯性测量单元（IMU）模块，在一个紧凑的封装内集成了三轴加速度计和三轴陀螺仪。

在接口方面，您可以使用 **SPI 或 I2C**，有两个可配置的中断引脚。对于高级应用，您可以通过外部 **I2C/SPI** 端口连接其他设备，用于光学图像稳定。  

为了快速轻松地开始使用，我们将传感器放置在紧凑的扩展板上，带有电压调节和电平转换输入。这样，您就可以放心地将其与 **3V 或 5V**电源/逻辑设备一起使用。

### 数据手册

* [LSM6DSO](https://www.st.com/resource/en/datasheet/lsm6dso.pdf)
* [LSM6DSOX](https://www.st.com/resource/en/datasheet/lsm6dsox.pdf)

### 原理图

> **LSM6DSOX 和 LSM6DSO 的原理图是相同的。**    

![LSM6DSO Module's Schematic](../../../../_static/merit-lsm6dso-6DoF/v2.1/merit-lsm6dso-6DoF-Schematic.png)

### 尺寸图

> **LSM6DSOX 和 LSM6DSO 的尺寸图是相同的。**  

  ![LSM6DSO Module's Dimension](../../../../_static/merit-lsm6dso-6DoF/v2.1/merirt-lsm6dso-6DoF-Assembly-Drawings.png)

## 主要特性

- **三轴加速度计**：±2/±4/±8/±16 g 全量程范围
- **三轴陀螺仪**：±125/±250/±500/±1000/±2000 dps 全量程范围
- **数字输出**：支持 I²C/SPI & MIPI I3C 接口
- **低功耗**：适合电池供电应用
- **紧凑尺寸**：25.4mm × 17.8mm x 5.8mm

## 应用领域

- 运动跟踪和手势检测
- 传感器中心
- 室内导航
- 物联网和连接设备
- 智能省电手持设备
- EIS和OIS相机应用程序
- 振动监测和补偿

## 快速开始

使用 LSM6DSO-6DoF 模块的步骤：

1. 通过 I²C 或 SPI 将模块连接到您的微控制器
2. 安装提供的驱动库
3. 初始化传感器并开始读取数据
4. 通过串口查看输出

详细技术参数请参考 [规格参数](specs.md)。
