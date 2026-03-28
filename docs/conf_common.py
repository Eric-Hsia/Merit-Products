# -*- coding: utf-8 -*-
#
# Common (non-language-specific) configuration for Sphinx
#
# This file is imported from a language-specific conf.py (i.e. en/conf.py or
# zh_CN/conf.py)

import sys
import os

# Path setup — add parent docs/ dir so en/conf.py and zh_CN/conf.py can import this
sys.path.insert(0, os.path.abspath(os.path.dirname(__file__)))

# ── Sphinx extensions ──────────────────────────────────────────────────────────
extensions = [   
    'sphinx.ext.autodoc',
    'sphinx.ext.viewcode',
    'sphinx.ext.githubpages',
    'sphinx_copybutton',        # adds copy-button to code blocks
    'myst_parser',
]

# ── Project metadata ───────────────────────────────────────────────────────────
github_user = 'your-org'
github_repo = 'Merit-Products'
project_homepage = 'https://github.com/your-org/Merit-Products'

# Supported documentation languages
languages = ['en', 'zh_CN']

# ── HTML output options ────────────────────────────────────────────────────────
# Theme — use the classic RTD theme (install: pip install sphinx-rtd-theme)
html_theme = 'sphinx_rtd_theme'

# Logo: place your logo SVG/PNG at docs/_static/merit-logo.svg
html_logo = '../_static/merit-logo.svg'

# Static files (CSS/JS/images) are copied AFTER built-in static files.
# Path is relative to the language conf.py location.
html_static_path = ['../_static']

# Custom CSS (optional — create docs/_static/css/custom.css if needed)
# html_css_files = ['css/custom.css']


# ── Theme options ──────────────────────────────────────────────────────────────
html_theme_options = {
    'navigation_depth': 4,
    'collapse_navigation': False,
    'sticky_navigation': True,
    'includehidden': True,
    'titles_only': False,
}

# html_context is available for sphinx-rtd-theme's GitHub integration
html_context = {
    'github_user': github_user,
    'github_repo': github_repo,
    'github_version': 'master',
    'conf_py_path': '/docs/en/',   # updated per-language conf.py
    'display_github': True,
}

# ── Source & build settings ────────────────────────────────────────────────────
# File extension for source documents
source_suffix = {
    '.rst': 'restructuredtext',
    '.md': 'markdown'
}

# The master toctree document
master_doc = 'index'

# Patterns to ignore
exclude_patterns = ['_build', 'README.md', 'Thumbs.db', '.DS_Store']

# Pygments syntax highlighting
pygments_style = 'sphinx'

# ── LaTeX / PDF output ─────────────────────────────────────────────────────────
latex_logo = '../_static/merit-logo.svg'
pdf_file_prefix = 'merit-products'

# ── Link check settings ────────────────────────────────────────────────────────
linkcheck_anchors = False
linkcheck_ignore = [
    r'https://github\.com/your-org/Merit-Products/tree/.*',
    r'https://github\.com/your-org/Merit-Products/blob/.*',
]

# ── Miscellaneous ──────────────────────────────────────────────────────────────
# Add any extra Sphinx settings below as needed.
