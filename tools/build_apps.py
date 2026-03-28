#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# SPDX-FileCopyrightText: 2024 Merit Technology Co., Ltd.
# SPDX-License-Identifier: Apache-2.0
#
"""
build_apps.py — Batch build helper for Merit-Products examples.

Usage:
    python tools/build_apps.py [--target <target>] [--app <app_path>]

Examples:
    # Build all apps
    python tools/build_apps.py

    # Build a specific app
    python tools/build_apps.py --app examples/merit-product-alpha/factory_demo
"""

import argparse
import os
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def find_apps(root: Path):
    """Recursively find all CMakeLists.txt that look like top-level apps."""
    apps = []
    for cmakelists in root.glob('examples/**/CMakeLists.txt'):
        # Only pick up top-level CMakeLists inside an example folder (depth == 3)
        rel = cmakelists.relative_to(root)
        parts = rel.parts
        if len(parts) == 3:  # examples/<product>/<example>/CMakeLists.txt
            apps.append(cmakelists.parent)
    return sorted(apps)


def build_app(app_path: Path, target: str) -> bool:
    print(f'\n>>> Building {app_path.relative_to(ROOT)} (target={target})')
    try:
        subprocess.run(
            ['idf.py', f'-DIDF_TARGET={target}', 'build'],
            cwd=app_path,
            check=True,
        )
        return True
    except subprocess.CalledProcessError as e:
        print(f'  ERROR: Build failed with return code {e.returncode}', file=sys.stderr)
        return False


def main():
    parser = argparse.ArgumentParser(description='Batch build Merit-Products examples.')
    parser.add_argument('--target', default='esp32', help='IDF target chip (default: esp32)')
    parser.add_argument('--app', default=None, help='Path to a specific app to build')
    args = parser.parse_args()

    if args.app:
        apps = [ROOT / args.app]
    else:
        apps = find_apps(ROOT)

    if not apps:
        print('No apps found.')
        return

    results = {}
    for app in apps:
        results[app] = build_app(app, args.target)

    print('\n' + '=' * 60)
    print('Build Summary')
    print('=' * 60)
    for app, ok in results.items():
        status = 'PASS' if ok else 'FAIL'
        print(f'  [{status}] {app.relative_to(ROOT)}')

    failed = [a for a, ok in results.items() if not ok]
    if failed:
        sys.exit(1)


if __name__ == '__main__':
    main()
