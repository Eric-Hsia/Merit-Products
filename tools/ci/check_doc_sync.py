#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# SPDX-FileCopyrightText: 2024 Merit Technology Co., Ltd.
# SPDX-License-Identifier: Apache-2.0
#
"""
check_doc_sync.py — Verify that en/ and zh_CN/ documentation directories
are kept in sync (same set of .rst files).

Usage:
    python tools/ci/check_doc_sync.py
"""

import sys
from pathlib import Path

DOCS = Path(__file__).resolve().parent.parent.parent / 'docs'
EN   = DOCS / 'en'
ZHCN = DOCS / 'zh_CN'


def collect_rst(base: Path):
    return {p.relative_to(base) for p in base.rglob('*.rst')}


def main():
    en_files   = collect_rst(EN)
    zhcn_files = collect_rst(ZHCN)

    only_en   = en_files - zhcn_files
    only_zhcn = zhcn_files - en_files

    ok = True

    if only_en:
        ok = False
        print('Files present in en/ but missing in zh_CN/:')
        for f in sorted(only_en):
            print(f'  {f}')

    if only_zhcn:
        ok = False
        print('Files present in zh_CN/ but missing in en/:')
        for f in sorted(only_zhcn):
            print(f'  {f}')

    if ok:
        print('en/ and zh_CN/ are in sync.')
    else:
        sys.exit(1)


if __name__ == '__main__':
    main()
