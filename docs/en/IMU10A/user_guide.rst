Merit-Product-Beta User Guide
==============================

:Date: |today|

.. contents::
   :local:
   :depth: 2

Introduction
------------

This guide provides detailed instructions for integrating and using the Merit-Product-Beta
sensor module in your application.

Electrical Characteristics
--------------------------

.. list-table::
   :widths: 30 20 20 20
   :header-rows: 1

   * - Parameter
     - Min
     - Typical
     - Max
   * - Supply Voltage (VCC)
     - 2.7 V
     - 3.3 V
     - 3.6 V
   * - Supply Current (active)
     - —
     - 1.5 mA
     - 3 mA
   * - Supply Current (sleep)
     - —
     - 1 µA
     - 5 µA

Pinout
------

.. figure:: ../../_static/merit-product-beta/merit-product-beta-pinout.png
   :align: center
   :alt: Pinout diagram
   :width: 70%

   Merit-Product-Beta — Pinout Diagram

.. list-table::
   :widths: 10 15 75
   :header-rows: 1

   * - Pin
     - Name
     - Description
   * - 1
     - VCC
     - Power supply (2.7 – 3.6 V)
   * - 2
     - GND
     - Ground
   * - 3
     - SDA
     - I2C data line
   * - 4
     - SCL
     - I2C clock line
   * - 5
     - INT
     - Interrupt output (active low)

Wiring to a Host MCU
--------------------

Connect the module to your host MCU as follows:

.. code-block:: none

   Host MCU        Merit-Product-Beta
   ─────────────────────────────────
   3V3        →    VCC
   GND        →    GND
   I2C_SDA    →    SDA
   I2C_SCL    →    SCL
   GPIO_IN    ←    INT (optional)

Example Code
------------

A minimal example is available under ``examples/merit-product-beta/``.

Related Documents
-----------------

- :doc:`index` — Product overview
- `GitHub Repository <https://github.com/your-org/Merit-Products>`_
