# Merit-Products

[![Documentation](https://img.shields.io/badge/docs-online-blue)](https://merit-products.readthedocs.io/en/latest/)
[![License](https://img.shields.io/badge/license-Apache%202.0-green)](LICENSE-APACHE)

**Merit-Products** is a documentation and example repository for Merit hardware products. This repository contains user guides, technical references, and example code for all supported products.

---

* [中文版](README_CN.md)

---

## Repository Structure

```text
Merit-Products/
├── docs/                      # Sphinx documentation
│   ├── _static/               # Static assets (images, CSS)
│   ├── build/                 # Build output (HTML, not committed)
│   ├── source/                # Documentation source files
│   │   ├── en/                # English documentation
│   │   │   ├── conf.py        # Sphinx configuration
│   │   │   ├── index.rst      # Main index
│   │   │   └── products/      # Product documentation
│   │   │       ├── lsm6dso/   # LSM6DSO-6DoF module
│   │   │       │   ├── intro.md
│   │   │       │   └── specs.md
│   │   │       └── imu10a/    # IMU10A module
│   │   │           ├── intro.md
│   │   │           └── specs.md
│   │   └── zh_CN/             # Simplified Chinese documentation
│   │       ├── conf.py
│   │       ├── index.rst
│   │       └── products/
│   │           ├── lsm6dso/
│   │           └── imu10a/
│   ├── Makefile               # Build automation (Linux/macOS)
│   ├── make.bat               # Build automation (Windows)
│   └── requirements.txt       # Python dependencies
├── examples/                  # Example firmware/software projects
│   └── <product-name>/
└── tools/                     # Utility scripts
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

### Build Documentation

```bash
cd docs

# Build both languages
make html

# Or build individually
make html-en    # English only
make html-zh    # Chinese only
```

The built HTML will be located in `docs/build/html/en/` or `docs/build/html/zh_CN/`.

---

## Products Covered

| Product Name       | Category          | Docs (EN)                                   | Docs (中文)　　　　　　　　　　　　　　　　　　|
| --------------------| -------------------| ---------------------------------------------| ------------------------------------------------|
| LSM6DSO-6DoF       | 6DoF IMU Module   | [EN](docs/source/en/products/lsm6dso/)      | [中文](docs/source/zh_CN/products/lsm6dso/)     |
| IMU10A             | 10-Axis IMU Module| [EN](docs/source/en/products/imu10a/)       | [中文](docs/source/zh_CN/products/imu10a/)      |

> Add your products to this table as you create their documentation.

---

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting pull requests.

---

## License

* Source code in `examples/`: [Apache License 2.0](LICENSE-APACHE)
* Documentation in `docs/`: [Creative Commons Attribution-ShareAlike 4.0](LICENSE-CC-BY-SA)
