==============================
merit-lsm6dso-6DoF 用户指南
==============================

:日期: |today|

.. contents::
   :local:
   :depth: 2

简介
----

本指南介绍如何设置和使用 Merit-Product-Alpha 开发板。

包装清单
--------

- Merit-Product-Alpha 开发板 × 1
- USB Type-C 数据线 × 1
- 快速入门卡 × 1

硬件概览
--------

.. figure:: ../../_static/merit-product-alpha/merit-product-alpha-layout.png
   :align: center
   :alt: 硬件布局图
   :width: 80%

   Merit-Product-Alpha — 引脚布局图

主要元件
~~~~~~~~

.. list-table::
   :widths: 15 15 70
   :header-rows: 1

   * - 位号
     - 元件
     - 说明
   * - U1
     - MCU
     - 主控微控制器
   * - J1
     - USB-C
     - USB Type-C 接口（供电与烧录）
   * - J2
     - GPIO 排针
     - 2.54 mm 间距排针（2×20 引脚）

引脚说明
~~~~~~~~

.. list-table::
   :widths: 10 15 75
   :header-rows: 1

   * - 引脚编号
     - 名称
     - 功能
   * - 1
     - 3V3
     - 3.3 V 电源输出（最大 500 mA）
   * - 2
     - GND
     - 接地
   * - 3
     - GPIO0
     - 通用 I/O / Boot 配置引脚

快速上手
--------

1. 使用 USB Type-C 数据线将开发板连接至电脑。
2. 安装所需工具链（参考项目 README）。
3. 从 ``examples/merit-product-alpha/`` 编译并烧录示例固件。

相关文档
--------

- :doc:`index` — 产品概述
- `GitHub 仓库 <https://github.com/your-org/Merit-Products>`_
