merit-lsm6dso-6DoF User Guide
================================

:Date: |today|

.. contents::
   :local:
   :depth: 2

Introduction
------------

This guide explains how to set up and use the Merit-Product-Alpha development board.

What's in the Box
-----------------

- Merit-Product-Alpha board × 1
- USB Type-C cable × 1
- Quick-start card × 1

Hardware Overview
-----------------

.. figure:: ../../_static/merit-lsm6dso-6DoF/merit-lsm6dso-6DoF-layout.png
   :align: center
   :alt: Hardware layout diagram
   :width: 80%

   merit-lsm6dso-6DoF— Pin Layout

Key Components
~~~~~~~~~~~~~~

.. list-table::
   :widths: 15 15 70
   :header-rows: 1

   * - Ref.
     - Component
     - Description
   * - U1
     - MCU
     - Main microcontroller unit
   * - J1
     - USB-C
     - USB Type-C connector for power and programming
   * - J2
     - GPIO Header
     - 2.54 mm pitch header (2×20 pins)

Pin Descriptions
~~~~~~~~~~~~~~~~

.. list-table::
   :widths: 10 15 75
   :header-rows: 1

   * - Pin #
     - Name
     - Function
   * - 1
     - 3V3
     - 3.3 V power output (max 500 mA)
   * - 2
     - GND
     - Ground
   * - 3
     - GPIO0
     - General-purpose I/O / Boot strapping pin

Getting Started
---------------

1. Connect the board to your PC via the USB Type-C cable.
2. Install the required toolchain (refer to the project README).
3. Build and flash the example firmware from ``examples/merit-product-alpha/``.

Related Documents
-----------------

- :doc:`index` — Product overview
- `GitHub Repository <https://github.com/your-org/Merit-Products>`_
