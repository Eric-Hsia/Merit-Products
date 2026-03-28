# _static Directory

This directory contains all static assets (images, CSS, JS, etc.) shared across
all documentation languages.

## Structure

```text
_static/
├── merit-logo.svg                    # Project logo (used in HTML sidebar)
├── merit-products-cover.pdf          # PDF cover image (used in LaTeX output)
├── css/
│   └── custom.css                    # Optional custom CSS overrides
├── js/
│   └── docs_version.js               # Version selector (optional)
├── merit-lsm6dso-6DoF/              # Images for Merit-Product-Alpha
│   ├── merit-lsm6dso-6DoF-front.png
│   └── merit-lsm6dso-6DoF-layout.png
└── merit-IMU10A/               # Images for Merit-Product-Beta
    ├── merit-IMU10A-front.png
    └── merit-IMU10A-pinout.png
```

## Naming Convention

- Each product gets its own subdirectory named exactly after the product slug
  (lowercase, hyphenated), e.g. `merit-product-alpha/`
- Images should be descriptive: `<product-slug>-<view>.png`
  e.g. `merit-product-alpha-front.png`, `merit-product-alpha-layout.png`
- Supported formats: `.png`, `.jpg`, `.svg`, `.gif`
- Recommended max width: 1200 px; use `.png` for screenshots, `.svg` for diagrams

## Referencing Images in RST

```rst
.. figure:: ../../_static/merit-lsm6dso-6DoF/merit-lsm6dso-6DoF-front.png
   :align: center
   :alt: Front view
   :width: 60%

   Caption text here
```

> The `../../_static/` relative path works from both `en/<product>/` and
> `zh_CN/<product>/` directories.
