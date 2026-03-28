Merit-Product-Beta 用户指南
============================

:日期: |today|

.. contents::
   :local:
   :depth: 2

简介
----

本指南介绍如何将 Merit-Product-Beta 传感器模块集成到您的应用系统中。

电气特性
--------

.. list-table::
   :widths: 30 20 20 20
   :header-rows: 1

   * - 参数
     - 最小值
     - 典型值
     - 最大值
   * - 供电电压（VCC）
     - 2.7 V
     - 3.3 V
     - 3.6 V
   * - 工作电流
     - —
     - 1.5 mA
     - 3 mA
   * - 睡眠电流
     - —
     - 1 µA
     - 5 µA

引脚图
------

.. figure:: ../../_static/merit-product-beta/merit-product-beta-pinout.png
   :align: center
   :alt: 引脚图
   :width: 70%

   Merit-Product-Beta — 引脚图

.. list-table::
   :widths: 10 15 75
   :header-rows: 1

   * - 引脚
     - 名称
     - 说明
   * - 1
     - VCC
     - 电源（2.7 – 3.6 V）
   * - 2
     - GND
     - 接地
   * - 3
     - SDA
     - I2C 数据线
   * - 4
     - SCL
     - I2C 时钟线
   * - 5
     - INT
     - 中断输出（低电平有效）

与主控 MCU 的接线
-----------------

按下表将模块连接至主控 MCU：

.. code-block:: none

   主控 MCU        Merit-Product-Beta
   ───────────────────────────────────
   3V3        →    VCC
   GND        →    GND
   I2C_SDA    →    SDA
   I2C_SCL    →    SCL
   GPIO_IN    ←    INT（可选）

示例代码
--------

最简示例代码位于 ``examples/merit-product-beta/``。

相关文档
--------

- :doc:`index` — 产品概述
- `GitHub 仓库 <https://github.com/your-org/Merit-Products>`_
