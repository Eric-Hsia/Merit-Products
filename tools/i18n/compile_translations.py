#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Compile translation files (.po to .mo).

This script compiles the translated .po files into binary .mo files
that Sphinx uses at build time.

Usage:
    python tools/i18n/compile_translations.py

This will compile:
    docs/source/locales/zh_CN/LC_MESSAGES/*.po
  → docs/source/locales/zh_CN/LC_MESSAGES/*.mo
"""

import os
import sys
import subprocess

# Configuration
DOCS_DIR = os.path.join(os.path.dirname(__file__), '..', '..', 'docs')
LOCALES_DIR = os.path.join(DOCS_DIR, 'source', 'locales')

def main():
    """Compile translation files."""
    print("=" * 60)
    print("Sphinx i18n: Compile Translations")
    print("=" * 60)
    
    # Ensure we're in the docs directory
    os.chdir(DOCS_DIR)
    
    # Compile translations using sphinx-intl
    print("\nCompiling .po files to .mo files...")
    print(f"Source: {LOCALES_DIR}")
    print()
    
    cmd = [
        'sphinx-intl',
        'build',
        '-d', LOCALES_DIR        # Directory containing locales
    ]
    
    try:
        result = subprocess.run(cmd, check=True, capture_output=False)
        print("\n" + "=" * 60)
        print("Compilation completed successfully!")
        print("=" * 60)
        print(f"\nCompiled .mo files are located in:")
        print(f"  {LOCALES_DIR}/zh_CN/LC_MESSAGES/")
        print("\nYou can now build the Chinese documentation:")
        print("  cd docs && make html-zh")
        
    except subprocess.CalledProcessError as e:
        print(f"\nError: Compilation failed with code {e.returncode}", file=sys.stderr)
        return 1
    except FileNotFoundError:
        print("\nError: sphinx-intl not found. Please install it:", file=sys.stderr)
        print("  pip install sphinx-intl", file=sys.stderr)
        return 1
    
    return 0

if __name__ == '__main__':
    sys.exit(main())
