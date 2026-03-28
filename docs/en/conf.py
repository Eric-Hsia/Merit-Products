# -*- coding: utf-8 -*-
#
# English Language Sphinx config file
#
# Imports shared settings from ../conf_common.py

import sys
import os
import datetime

# Allow importing conf_common from the parent docs/ directory
sys.path.insert(0, os.path.abspath('../'))
from conf_common import *  # noqa: F401, F403  # pyright: ignore[reportImplicitRelativeImport]

# ── Language & project info ────────────────────────────────────────────────────
current_year = datetime.datetime.now().year

project = u'Merit-Products'
copyright = u'2020 - {}, Merit Technology Co., Ltd.'.format(current_year)
author = u'Merit Technology'
pdf_title = u'Merit-Products Documentation'

# Sphinx language tag
language = 'en'

# ── GitHub source link (override conf_common defaults for this language) ───────
html_context.update({
    'conf_py_path': '/docs/en/',
    'github_version': 'master',
})

# ── LaTeX output ───────────────────────────────────────────────────────────────
latex_documents = [
    ('index', 'merit-products.tex', u'Merit-Products Documentation',
     u'Merit Technology', 'manual'),
]
