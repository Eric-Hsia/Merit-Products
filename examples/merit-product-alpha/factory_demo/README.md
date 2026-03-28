# Factory Demo — Merit-Product-Alpha

## Overview

A minimal out-of-box test firmware for Merit-Product-Alpha.
Blinks the onboard LED and prints status messages over UART.

## Hardware Required

- Merit-Product-Alpha × 1
- USB Type-C cable × 1

## How to Build and Flash

```bash
# (Assuming ESP-IDF is installed and sourced)
idf.py build
idf.py -p PORT flash monitor
```

Replace `PORT` with your serial port (e.g., `COM3` on Windows, `/dev/ttyUSB0` on Linux).

## Expected Output

```
Merit-Product-Alpha Factory Demo
Blinking GPIO 2 at 1 Hz
tick
tock
tick
tock
...
```
