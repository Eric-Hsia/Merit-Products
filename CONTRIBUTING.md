# Contributing to Merit-Products

Thank you for your interest in contributing to this project! Please follow the guidelines below.

## How to Contribute

1. **Fork** the repository.
2. **Create a branch** for your feature or fix: `git checkout -b feature/your-feature-name`
3. **Commit your changes** with clear messages.
4. **Open a Pull Request** and describe what you changed and why.

## Documentation Contributions

- English docs go under `docs/en/<product-name>/`
- Chinese docs go under `docs/zh_CN/<product-name>/`
- Both language versions should be kept in sync.
- Images for a product should be stored under `docs/_static/<product-name>/`

### Building Docs Locally

```bash
pip install -r docs/requirements.txt
cd docs/en && make html
# or
cd docs/zh_CN && make html
```

## Code Contributions

- All example code lives under `examples/<product-name>/`
- Follow the existing code style.
- Add a `README.md` inside each example directory.

## Reporting Issues

Please open a GitHub Issue with a clear description, steps to reproduce, and relevant logs or screenshots.
