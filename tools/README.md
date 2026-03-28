# Tools

This directory contains utility scripts for the Merit-Products project.

## Top-level Scripts

| Script | Description |
|---|---|
| `build_apps.py` | Batch-build all (or a specific) example app |

### build_apps.py

```bash
# Build all examples for the default target (esp32)
python tools/build_apps.py

# Build all examples for a specific target
python tools/build_apps.py --target esp32s3

# Build a single app
python tools/build_apps.py --app examples/merit-product-alpha/factory_demo
```

## CI Scripts (`ci/`)

| Script | Description |
|---|---|
| `check_readme_links.py` | Check all README hyperlinks are reachable |
| `check_doc_sync.py` | Verify en/ and zh_CN/ docs directories are in sync |
