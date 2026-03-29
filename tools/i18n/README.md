# i18n 工具脚本

本目录包含用于 Sphinx 国际化（i18n）工作流的辅助脚本。

## 脚本说明

| 脚本 | 用途 |
|------|------|
| `extract_messages.py` | 从英文文档提取可翻译文本，生成 .pot 模板文件 |
| `update_translations.py` | 基于 .pot 模板创建/更新中文 .po 翻译文件 |
| `compile_translations.py` | 将 .po 文件编译为 .mo 二进制文件 |

## 使用流程

```bash
# 1. 英文文档有更新后，提取模板
python tools/i18n/extract_messages.py

# 2. 更新中文翻译文件（会保留已有翻译）
python tools/i18n/update_translations.py

# 3. 编辑 docs/source/locales/zh_CN/LC_MESSAGES/*.po 添加翻译

# 4. 编译翻译文件
python tools/i18n/compile_translations.py

# 5. 构建中文文档
cd docs && make html-zh
```

## 详细文档

参见 `docs/I18N_GUIDE.md`
