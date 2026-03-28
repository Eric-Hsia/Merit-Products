#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# SPDX-FileCopyrightText: 2024 Merit Technology Co., Ltd.
# SPDX-License-Identifier: Apache-2.0
#
"""
check_readme_links.py — Verify that all hyperlinks in README files are reachable.

Usage:
    python tools/ci/check_readme_links.py
"""

import re
import sys
from pathlib import Path

import urllib.request
import urllib.error

ROOT = Path(__file__).resolve().parent.parent.parent
URL_PATTERN = re.compile(r'\[.*?\]\((https?://[^\)]+)\)')


def check_link(url: str) -> bool:
    try:
        req = urllib.request.Request(url, method='HEAD',
                                     headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req, timeout=10):
            return True
    except Exception:
        return False


def main():
    readmes = list(ROOT.rglob('README*.md'))
    errors = []

    for readme in readmes:
        text = readme.read_text(encoding='utf-8', errors='ignore')
        urls = URL_PATTERN.findall(text)
        for url in urls:
            if not check_link(url):
                errors.append((readme.relative_to(ROOT), url))
                print(f'  BROKEN: {url}  ({readme.relative_to(ROOT)})')

    if errors:
        print(f'\n{len(errors)} broken link(s) found.')
        sys.exit(1)
    else:
        print('All links OK.')


if __name__ == '__main__':
    main()
