# Documentation Build Guide

This directory contains the Sphinx source files for Merit-Products documentation.

## Directory Layout

```
docs/
├── _static/           # Static assets shared across all languages
│   └── <product>/     # Per-product images and media
├── en/                # English documentation source
│   ├── conf.py
│   ├── index.rst
│   ├── Makefile
│   └── <product-name>/
│       ├── index.rst
│       └── user_guide.rst
├── zh_CN/             # Simplified Chinese documentation source
│   ├── conf.py
│   ├── index.rst
│   ├── Makefile
│   └── <product-name>/
│       ├── index.rst
│       └── user_guide.rst
├── conf_common.py     # Shared Sphinx configuration
└── requirements.txt   # Python dependencies
```

## Build Instructions

### 1. Install dependencies

```bash
pip install -r requirements.txt
```

### 2. Build HTML

```bash
# English
cd en && make html

# Chinese
cd zh_CN && make html
```

### 3. View locally

Open `en/_build/html/index.html` or `zh_CN/_build/html/index.html` in your browser.

## Adding a New Product

1. Create `en/<your-product>/index.rst` and `en/<your-product>/user_guide.rst`
2. Create `zh_CN/<your-product>/index.rst` and `zh_CN/<your-product>/user_guide.rst`
3. Add a `toctree` entry in `en/index.rst` and `zh_CN/index.rst`
4. Place product images under `_static/<your-product>/`
