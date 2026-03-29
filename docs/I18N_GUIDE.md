# Sphinx i18n / gettext 翻译工作流指南

本文档介绍如何使用 Sphinx 的国际化（i18n）功能管理 Merit-Products 文档的多语言翻译。

## 目录结构

```
docs/source/
├── en/                          # 英文源文档（主语言）
│   ├── conf.py
│   ├── index.rst
n│   └── products/
├── locales/                     # 翻译文件目录
│   ├── en/LC_MESSAGES/          # 提取的模板 (.pot)
│   └── zh_CN/LC_MESSAGES/       # 中文翻译 (.po/.mo)
└── zh_CN/                       # 中文文档（可选，与 i18n 二选一）
```

## 工作流程概览

```
编辑英文文档 → 提取模板 → 更新翻译 → 编译 → 构建中文文档
```

## 安装依赖

```bash
pip install -r docs/requirements.txt
```

确保安装了 `sphinx-intl`：
```bash
pip install sphinx-intl
```

## 翻译工作流

### 1. 编辑英文文档

直接编辑 `docs/source/en/` 下的文件（.rst 或 .md）。

### 2. 提取翻译模板

当英文文档有更新时，运行：

```bash
python tools/i18n/extract_messages.py
```

或手动：

```bash
cd docs
sphinx-build -b gettext source/en source/locales/
```

这会生成 `.pot` 模板文件在 `docs/source/locales/en/LC_MESSAGES/`。

### 3. 更新中文翻译文件

```bash
python tools/i18n/update_translations.py
```

或手动：

```bash
cd docs
sphinx-intl update -p source/locales/en/LC_MESSAGES -l zh_CN -d source/locales
```

这会创建/更新 `.po` 文件在 `docs/source/locales/zh_CN/LC_MESSAGES/`。

### 4. 编辑翻译

使用 PO 编辑器（如 Poedit、VS Code 插件）或直接编辑 `.po` 文件：

```po
#: ../../source/en/products/lsm6dso/intro.md:3
msgid "Introduction"
msgstr "产品简介"
```

将 `msgstr` 填写为对应的中文翻译。

### 5. 编译翻译

```bash
python tools/i18n/compile_translations.py
```

或手动：

```bash
cd docs
sphinx-intl build -d source/locales
```

这会生成 `.mo` 二进制文件。

### 6. 构建中文文档

```bash
cd docs
make html-zh
```

或使用 i18n 模式构建：

```bash
cd docs
sphinx-build -b html -D language=zh_CN source/en build/html/zh_CN
```

## 快速参考命令

| 操作 | 命令 |
|------|------|
| 提取模板 | `python tools/i18n/extract_messages.py` |
| 更新翻译 | `python tools/i18n/update_translations.py` |
| 编译翻译 | `python tools/i18n/compile_translations.py` |
| 构建中文 | `cd docs && make html-zh` |

## Windows 批处理程序（推荐）

对于 Windows 用户，我们提供了便捷的批处理脚本：

### 交互式菜单（推荐新手使用）

```bash
cd tools/i18n
i18n-menu.bat
```

这将显示一个交互式菜单：

```
╔══════════════════════════════════════════════════════════════╗
║         Sphinx i18n Translation Workflow                     ║
╚══════════════════════════════════════════════════════════════╝

  [1] Extract translation templates    (从英文文档提取翻译模板)
  [2] Update Chinese translations      (更新中文翻译文件)
  [3] Compile translations             (编译翻译文件)
  [4] Build Chinese documentation      (构建中文文档)
  [5] Build English documentation      (构建英文文档)
  [6] Build both languages             (构建双语文档)
  [7] Start preview server             (启动预览服务器)
  [8] Clean build files                (清理构建文件)
  [9] Show translation status          (显示翻译状态)
  [0] Full workflow (with prompts)     (完整工作流)
  [Q] Quit                             (退出)
```

### 命令行版本（适合自动化）

```bash
cd tools/i18n

# 显示帮助
i18n.bat help

# 常用命令
i18n.bat extract     # 提取翻译模板
i18n.bat update      # 更新中文翻译文件
i18n.bat compile     # 编译翻译文件
i18n.bat build-zh    # 构建中文文档
i18n.bat build-en    # 构建英文文档
i18n.bat build-all   # 构建双语
i18n.bat serve       # 启动预览服务器 (localhost:8080)
i18n.bat clean       # 清理构建文件
i18n.bat status      # 显示翻译状态
i18n.bat full        # 完整工作流（带提示）
```

## 翻译工具推荐

### PO 文件编辑器

1. **Poedit** (跨平台 GUI) - https://poedit.net/
2. **VS Code 插件**: "gettext" 或 "PO Editor"
3. **OmegaT** (专业 CAT 工具)

### 机器翻译辅助

可以使用以下工具预翻译，再人工校对：

- DeepL API
- Google Translate API
- OpenAI GPT API

## 注意事项

1. **Markdown 支持**: Sphinx i18n 通过 MyST Parser 支持 Markdown，但提取的 msgid 可能包含 Markdown 标记。

2. **代码块**: 代码块内的文本通常也会被提取，建议保留原文或根据上下文决定是否翻译注释。

3. **链接**: Markdown 链接语法 `[text](url)` 中的 `text` 会被提取，`url` 不会。

4. **Front matter**: YAML front matter 中的字段也会被提取为可翻译文本。

## 与独立中文文档的对比

| 方案 | 优点 | 缺点 |
|------|------|------|
| **i18n/gettext** | 翻译与源码分离，更新方便；支持翻译记忆 | 需要学习 PO 文件格式；Markdown 支持有限 |
| **独立 zh_CN/** | 完全控制；Markdown 原生支持 | 需要手动同步两份文档 |

当前项目同时支持两种方式，你可以根据需求选择：

- 使用 `docs/source/zh_CN/` 存放独立中文文档
- 或使用 `docs/source/locales/zh_CN/` 存放 PO 翻译文件

## 参考文档

- [Sphinx i18n Documentation](https://www.sphinx-doc.org/en/master/usage/advanced/intl.html)
- [sphinx-intl Documentation](https://sphinx-intl.readthedocs.io/)
- [GNU gettext Manual](https://www.gnu.org/software/gettext/manual/)
