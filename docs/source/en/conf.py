# -*- coding: utf-8 -*-
#
# Merit-Products English Documentation Configuration
#

import os
import sys
import datetime

# -- Path setup --------------------------------------------------------------
sys.path.insert(0, os.path.abspath('../../..'))

# -- Project information -----------------------------------------------------
current_year = datetime.datetime.now().year
project = 'Merit-Products'
copyright = f'2020 - {current_year}, Merit Technology Co., Ltd.'
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
language = 'en'

# i18n / gettext configuration
# Translation files are located in docs/source/locales/
locale_dirs = ['../locales']
gettext_compact = False  # Keep .po files separate for each source file
gettext_uuid = True      # Add UUIDs to msgids for stable references
gettext_location = True  # Add location comments to .po files

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
html_logo = '../../_static/merit-logo.png'

html_theme_options = {
    'navigation_depth': 4,
    'collapse_navigation': False,
    'sticky_navigation': True,
    'includehidden': True,
    'titles_only': False,
    'logo_only': False,
}

html_context = {
    'github_user': 'Eric-Hsia',
    'github_repo': 'Merit-Products',
    'github_version': 'main',
    'conf_py_path': '/docs/source/en/',
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
    ('index', 'merit-products.tex', 'Merit-Products Documentation',
     'Merit Technology', 'manual'),
]
latex_logo = '../../_static/merit-logo.svg'

# -- Link check settings -----------------------------------------------------
linkcheck_anchors = False
linkcheck_ignore = [
    r'https://github\.com/Eric-Hsia/Merit-Products/tree/.*',
    r'https://github\.com/Eric-Hsia/Merit-Products/blob/.*',
]
