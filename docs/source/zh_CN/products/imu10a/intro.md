# 产品简介

## 概述

**IMU10A** 是一款全面的十轴惯性测量单元，在单个模块中集成了加速度计、陀螺仪、磁力计和气压计。这款一体化解决方案非常适合高级运动传感和导航应用。

## 主要特性

### 加速度计
- 三轴测量
- ±2/±4/±8/±16 g 全量程范围
- 超低噪声性能

### 陀螺仪
- 三轴角速度测量
- ±250/±500/±1000/±2000 dps 全量程范围
- 温度范围内高稳定性

### 磁力计
- 三轴磁场感应
- 宽动态范围
- 数字罗盘功能

### 气压计
- 压力范围：300-1100 hPa
- 海拔分辨率：±1 米
- 温度补偿

## 应用领域

- **无人机/无人飞行器导航**：完整的姿态和航向参考系统（AHRS）
- **机器人**：精确的方向和运动追踪
- **虚拟现实**：沉浸式头部追踪
- **可穿戴健身**：活动识别和计步
- **工业监测**：振动分析和倾斜感应

## 快速开始

```python
import merit_imu10a

# 初始化传感器
imu = merit_imu10a.IMU10A()
imu.begin()

# 读取所有传感器数据
accel = imu.read_accelerometer()  # (x, y, z) 单位：g
gyro = imu.read_gyroscope()       # (x, y, z) 单位：dps
mag = imu.read_magnetometer()     # (x, y, z) 单位：µT
pressure = imu.read_pressure()    # 单位：hPa

print(f"加速度: {accel}")
print(f"陀螺仪: {gyro}")
print(f"磁力计: {mag}")
print(f"气压: {pressure} hPa")
```

详细规格请参考 [规格参数](specs.md)。
