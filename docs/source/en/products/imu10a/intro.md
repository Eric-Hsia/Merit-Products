# Introduction

## Overview

The **IMU10A** is a comprehensive 10-axis inertial measurement unit, integrating accelerometer, gyroscope, magnetometer, and barometer in a single module. This all-in-one solution is perfect for advanced motion sensing and navigation applications.

## Features

### Accelerometer
- 3-axis measurement
- ±2/±4/±8/±16 g full-scale range
- Ultra-low noise performance

### Gyroscope
- 3-axis angular rate measurement
- ±250/±500/±1000/±2000 dps full-scale range
- High stability over temperature

### Magnetometer
- 3-axis magnetic field sensing
- Wide dynamic range
- Digital compass capability

### Barometer
- Pressure range: 300-1100 hPa
- Altitude resolution: ±1 meter
- Temperature compensated

## Applications

- **Drone/UAV navigation**: Complete attitude and heading reference system (AHRS)
- **Robotics**: Precise orientation and motion tracking
- **Virtual Reality**: Immersive head tracking
- **Wearable Fitness**: Activity recognition and step counting
- **Industrial Monitoring**: Vibration analysis and tilt sensing

## Quick Start

```python
import merit_imu10a

# Initialize sensor
imu = merit_imu10a.IMU10A()
imu.begin()

# Read all sensor data
accel = imu.read_accelerometer()  # (x, y, z) in g
gyro = imu.read_gyroscope()       # (x, y, z) in dps
mag = imu.read_magnetometer()     # (x, y, z) in µT
pressure = imu.read_pressure()    # in hPa

print(f"Acceleration: {accel}")
print(f"Gyroscope: {gyro}")
print(f"Magnetometer: {mag}")
print(f"Pressure: {pressure} hPa")
```

For detailed specifications, see [Specifications](specs.md).
