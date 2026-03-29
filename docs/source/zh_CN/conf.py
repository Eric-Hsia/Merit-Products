# -*- coding: utf-8 -*-
#
# Merit-Products 中文文档配置
#

import os
import sys
import datetime

# -- Path setup --------------------------------------------------------------
sys.path.insert(0, os.path.abspath('../../..'))

# -- Project information -----------------------------------------------------
current_year = datetime.datetime.now().year
project = 'Merit-Products'
copyright = f'2020 - {current_year}，Merit Technology Co., Ltd. 版权所有'
author = 'Merit Technology'

# -- General configuration ---------------------------------------------------
extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.viewcode',
    'sphinx.ext.githubpages',
    'sphinx_copybutton',
    'myst_parser',
]

# -- Language settings -------------------------------------------------------
language = 'zh_CN'
locale_dirs = ['../locales']
gettext_compact = False
gettext_uuid = True

# -- Source file settings ----------------------------------------------------
source_suffix = {
    '.rst': 'restructuredtext',
    '.md': 'markdown',
}
master_doc = 'index'

# -- Exclude patterns --------------------------------------------------------
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

# -- HTML output options -----------------------------------------------------
html_theme = 'sphinx_rtd_theme'
html_static_path = ['../../_static']
html_logo = '../../_static/merit-logo.svg'

html_theme_options = {
    'navigation_depth': 4,
    'collapse_navigation': False,
    'sticky_navigation': True,
    'includehidden': True,
    'titles_only': False,
}

html_context = {
    'github_user': 'Eric-Hsia',
    'github_repo': 'Merit-Products',
    'github_version': 'main',
    'conf_py_path': '/docs/source/zh_CN/',
    'display_github': True,
}

# -- MyST Parser settings ----------------------------------------------------
myst_enable_extensions = [
    'colon_fence',
    'deflist',
    'html_admonition',
    'html_image',
    'linkify',
    'replacements',
    'smartquotes',
    'substitution',
    'tasklist',
]

# -- Pygments style ----------------------------------------------------------
pygments_style = 'sphinx'

# -- LaTeX output ------------------------------------------------------------
latex_documents = [
    ('index', 'merit-products-cn.tex', 'Merit-Products 文档',
     'Merit Technology', 'manual'),
]
latex_logo = '../../_static/merit-logo.svg'

# -- Link check settings -----------------------------------------------------
linkcheck_anchors = False
linkcheck_ignore = [
    r'https://github\.com/Eric-Hsia/Merit-Products/tree/.*',
    r'https://github\.com/Eric-Hsia/Merit-Products/blob/.*',
]
