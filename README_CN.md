# Merit产品

[![文档](https://img.shields.io/badge/文档-在线-blue)](https://merit-products.readthedocs.io)
[![许可证](https://img.shields.io/badge/许可证-Apache%202.0-green)](LICENSE-APACHE)

**Merit-Products** 是 Merit公司硬件产品的文档与示例代码仓库，包含所有受支持产品的用户指南、技术参考文档和示例固件/软件代码。

---

* [English Version](README.md)

---

## 仓库结构

```text
Merit-Products/
├── docs/                  # Sphinx 文档源文件
│   ├── _static/           # 静态资源（各产品图片）
│   ├── en/                # 英文文档
│   │   ├── conf.py
│   │   ├── index.rst
│   │   ├── Makefile
│   │   └── <产品名称>/
│   ├── zh_CN/             # 中文简体文档
│   │   ├── conf.py
│   │   ├── index.rst
│   │   ├── Makefile
│   │   └── <产品名称>/
│   ├── conf_common.py     # Sphinx 公共配置
│   └── requirements.txt   # Python 文档依赖
├── examples/              # 示例固件/软件项目
│   └── <产品名称>/
└── tools/                 # 工具脚本
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

### 构建英文文档

```bash
cd docs/en
make html
```

### 构建中文文档

```bash
cd docs/zh_CN
make html
```

构建完成后，HTML 文件位于 `docs/en/_build/html/` 或 `docs/zh_CN/_build/html/` 目录中。

---

## 产品列表

| 产品名称　　　　　 | 分类　　　　　　 | 英文文档　　　　　　　　　　| 中文文档　　　　　　　　　　　　 |
| --------------------| ------------------| -----------------------------| ----------------------------------|
| merit-lsm6dso-6DoF | 6轴传感器模块　　| [EN](docs/en/lsm6dso-6DoF/) | [中文](docs/zh_CN/lsm6dso-6DoF/) |
| merit-IMU10A　　　 | 10轴惯性测量模块 | [EN](docs/en/IMU10A/)　　　 | [中文](docs/zh_CN/IMU10A/)　　　 |

> 创建新产品文档后，请将其添加到上表中。

---

## 贡献指南

提交 Pull Request 前请阅读 [CONTRIBUTING.md](CONTRIBUTING.md)。

---

## 许可证

* `examples/` 中的源代码：[Apache License 2.0](LICENSE-APACHE)
* `docs/` 中的文档：[Creative Commons Attribution-ShareAlike 4.0](LICENSE-CC-BY-SA)
