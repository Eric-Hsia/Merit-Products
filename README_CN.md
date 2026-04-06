# Merit产品

[![文档](https://img.shields.io/badge/文档-在线-blue)](https://merit-products.readthedocs.io/zh_CN/latest/)
[![许可证](https://img.shields.io/badge/许可证-Apache%202.0-green)](LICENSE-APACHE)

**Merit-Products** 是 Merit公司硬件产品的文档与示例代码仓库，包含所有受支持产品的用户指南、技术参考文档和示例固件/软件代码。

---

* [English Version](README.md)

---

## 仓库结构

```text
Merit-Products/
├── docs/                      # Sphinx 文档
│   ├── _static/               # 静态资源（图片、CSS）
│   ├── build/                 # 构建输出（HTML，不提交到 git）
│   ├── source/                # 文档源文件
│   │   ├── en/                # 英文文档
│   │   │   ├── conf.py        # Sphinx 配置
│   │   │   ├── index.rst      # 主索引
│   │   │   └── products/      # 产品文档
│   │   │       ├── lsm6dso/   # LSM6DSO-6DoF 模块
│   │   │       │   ├── intro.md
│   │   │       │   └── specs.md
│   │   │       └── imu10a/    # IMU10A 模块
│   │   │           ├── intro.md
│   │   │           └── specs.md
│   │   └── zh_CN/             # 中文简体文档
│   │       ├── conf.py
│   │       ├── index.rst
│   │       └── products/
│   │           ├── lsm6dso/
│   │           └── imu10a/
│   ├── Makefile               # 构建脚本（Linux/macOS）
│   ├── make.bat               # 构建脚本（Windows）
│   └── requirements.txt       # Python 依赖
├── examples/                  # 示例固件/软件项目
│   └── <产品名称>/
└── tools/                     # 工具脚本
    └── ci/
```

---

## 快速开始

### 前提条件

* Python 3.8+
* Sphinx 及相关依赖包

### 安装文档依赖

```bash
pip install -r docs/requirements.txt
```

### 构建文档

```bash
cd docs

# 编译中英文
make html

# 或单独编译
make html-en    # 仅英文
make html-zh    # 仅中文
```

构建完成后，HTML 文件位于 `docs/build/html/en/` 或 `docs/build/html/zh_CN/` 目录中。

---

## 产品列表

| 产品名称　　　　　 | 分类　　　　　　　 | 英文文档　　　　　　　　　　　　　　　　　　　| 中文文档　　　　　　　　　　　　　　　　　 　　　 |
| --------------------| --------------------| -----------------------------------------------| --------------------------------------------------|
| LSM6DSO-6DoF       | 六轴 IMU 模块　　　| [EN](docs/source/en/products/lsm6dso/)        | [中文](docs/source/zh_CN/products/lsm6dso/)       |
| IMU10A　　　　　　 | 十轴惯性测量模块　 | [EN](docs/source/en/products/imu10a/)         | [中文](docs/source/zh_CN/products/imu10a/)        |

> 创建新产品文档后，请将其添加到上表中。

---

## 贡献指南

提交 Pull Request 前请阅读 [CONTRIBUTING.md](CONTRIBUTING.md)。

---

## 许可证

* `examples/` 中的源代码：[Apache License 2.0](LICENSE-APACHE)
* `docs/` 中的文档：[Creative Commons Attribution-ShareAlike 4.0](LICENSE-CC-BY-SA)
