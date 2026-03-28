/*
 * SPDX-FileCopyrightText: 2024 Merit Technology Co., Ltd.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

/**
 * @file main.c
 * @brief Merit-Product-Beta sensor read example
 *
 * Reads temperature, humidity, and pressure from the Merit-Product-Beta
 * module over I2C and prints the results over UART.
 */

#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

/* I2C configuration — update to match your wiring */
#define I2C_MASTER_SCL_IO   22
#define I2C_MASTER_SDA_IO   21
#define I2C_MASTER_FREQ_HZ  100000

void app_main(void)
{
    printf("Merit-Product-Beta Sensor Read Example\n");

    /* TODO: Initialize I2C master */
    /* TODO: Initialize sensor driver */

    while (1) {
        float temperature = 0.0f;
        float humidity    = 0.0f;
        float pressure    = 0.0f;

        /* TODO: Read sensor data */

        printf("Temperature: %.2f °C  Humidity: %.2f %%  Pressure: %.2f hPa\n",
               temperature, humidity, pressure);

        vTaskDelay(pdMS_TO_TICKS(2000));
    }
}
