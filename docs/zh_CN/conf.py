# -*- coding: utf-8 -*-
#
# 中文（简体）Sphinx 配置文件
#
# 从 ../conf_common.py 导入通用配置

import sys
import os
import datetime

sys.path.insert(0, os.path.abspath('../'))
from conf_common import *  # noqa: F401, F403  # pyright: ignore[reportImplicitRelativeImport]

# ── 语言与项目信息 ─────────────────────────────────────────────────────────────
current_year = datetime.datetime.now().year

project = u'Merit-Products'
copyright = u'2020 - {}，Merit Technology Co., Ltd. 版权所有'.format(current_year)
author = u'Merit Technology'
pdf_title = u'Merit产品文档'

# Sphinx 语言标签
language = 'zh_CN'

# ── GitHub 源码链接（覆盖 conf_common 默认值）─────────────────────────────────
html_context.update({
    'conf_py_path': '/docs/zh_CN/',
    'github_version': 'master',
})


# ── LaTeX 输出 ─────────────────────────────────────────────────────────────────
latex_documents = [
    ('index', 'merit-products-cn.tex', u'Merit-Products 文档',
     u'Merit Technology', 'manual'),
]
