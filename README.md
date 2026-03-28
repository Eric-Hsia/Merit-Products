# Merit-Products

[![Documentation](https://img.shields.io/badge/docs-online-blue)](https://merit-products.readthedocs.io)
[![License](https://img.shields.io/badge/license-Apache%202.0-green)](LICENSE-APACHE)

**Merit-Products** is a documentation and example repository for Merit hardware products. This repository contains user guides, technical references, and example code for all supported products.

---

* [中文版](README_CN.md)

---

## Repository Structure

```text
Merit-Products/
├── docs/                  # Sphinx documentation source
│   ├── _static/           # Static assets (images per product)
│   ├── en/                # English documentation
│   │   ├── conf.py
│   │   ├── index.rst
│   │   ├── Makefile
│   │   └── <product-name>/
│   ├── zh_CN/             # Simplified Chinese documentation
│   │   ├── conf.py
│   │   ├── index.rst
│   │   ├── Makefile
│   │   └── <product-name>/
│   ├── conf_common.py     # Shared Sphinx configuration
│   └── requirements.txt   # Python documentation dependencies
├── examples/              # Example firmware/software projects
│   └── <product-name>/
└── tools/                 # Utility scripts
    └── ci/
```

---

## Getting Started

### Prerequisites

* Python 3.8+
* Sphinx and related packages

### Install Documentation Dependencies

```bash
pip install -r docs/requirements.txt
```

### Build English Documentation

```bash
cd docs/en
make html
```

### Build Chinese Documentation

```bash
cd docs/zh_CN
make html
```

The built HTML will be located in `docs/en/_build/html/` or `docs/zh_CN/_build/html/`.

---

## Products Covered

| Product Name       | Category          | Docs (EN)                   | Docs (中文)　　　　　　　　　　　|
| --------------------| -------------------| -----------------------------| ----------------------------------|
| merit-lsm6dso-6DoF | 6DoF Module       | [EN](docs/en/lsm6dso-6DoF/) | [中文](docs/zh_CN/lsm6dso-6DoF/) |
| merit-IMU10A       | 10Axis IMU Module | [EN](docs/en/IMU10A/)       | [中文](docs/zh_CN/IMU10A/)　　　 |

> Add your products to this table as you create their documentation.

---

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting pull requests.

---

## License

- Source code in `examples/`: [Apache License 2.0](LICENSE-APACHE)
- Documentation in `docs/`: [Creative Commons Attribution-ShareAlike 4.0](LICENSE-CC-BY-SA)
