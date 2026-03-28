/*
 * SPDX-FileCopyrightText: 2024 Merit Technology Co., Ltd.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

/**
 * @file main.c
 * @brief Merit-Product-Alpha factory demo — entry point
 *
 * This example demonstrates basic peripheral initialization and a
 * simple blink loop to verify board functionality.
 */

#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

/* LED GPIO — update to match your board schematic */
#define BLINK_GPIO  2

void app_main(void)
{
    printf("Merit-Product-Alpha Factory Demo\n");
    printf("Blinking GPIO %d at 1 Hz\n", BLINK_GPIO);

    /* TODO: Add board-specific GPIO init here */

    while (1) {
        /* TODO: Toggle LED */
        printf("tick\n");
        vTaskDelay(pdMS_TO_TICKS(500));
        printf("tock\n");
        vTaskDelay(pdMS_TO_TICKS(500));
    }
}
