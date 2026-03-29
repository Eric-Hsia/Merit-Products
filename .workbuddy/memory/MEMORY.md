# Merit-Products 项目长期记忆

## 项目基本信息

- **GitHub 用户名**：Eric-Hsia
- **仓库名**：Merit-Products
- **默认分支**：main
- **文档平台**：Read the Docs（目标域名 merit-products.readthedocs.io）

## 文档架构（2026-03-29 重构后）

- Sphinx 多语言结构：`docs/source/en/`（英文）+ `docs/source/zh_CN/`（中文简体）
- 静态资源：`docs/_static/`
- 构建输出：`docs/build/`
- 文档格式：Markdown（MyST Parser）为主，RST 用于 toctree 索引

## RTD 发布配置

- 英文主项目：根目录 `.readthedocs.yaml` → `docs/source/en/conf.py`
- 中文翻译项目：`docs/source/zh_CN/.readthedocs.yaml` → `docs/source/zh_CN/conf.py`
  - 需在 RTD 后台 Admin > Advanced Settings 将配置文件路径设为 `docs/source/zh_CN/.readthedocs.yaml`
  - 再在主项目 Admin > Translations 关联中文项目，RTD 自动生成语言切换菜单
