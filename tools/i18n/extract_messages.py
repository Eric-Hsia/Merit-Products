#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Extract translatable messages from Sphinx documentation.

This script extracts all translatable text from the English source files
and generates .pot (Portable Object Template) files in the locales directory.

Usage:
    python tools/i18n/extract_messages.py

The extracted templates will be placed in:
    docs/source/locales/en/LC_MESSAGES/

After extraction, use update_translations.py to create/update .po files for Chinese.
"""

import os
import sys
import subprocess
import shutil

# Configuration
DOCS_DIR = os.path.join(os.path.dirname(__file__), '..', '..', 'docs')
SOURCE_DIR = os.path.join(DOCS_DIR, 'source', 'en')
LOCALES_DIR = os.path.join(DOCS_DIR, 'source', 'locales')

def main():
    """Extract translatable messages from Sphinx documentation."""
    print("=" * 60)
    print("Sphinx i18n: Extract Translatable Messages")
    print("=" * 60)
    
    # Ensure we're in the docs directory
    os.chdir(DOCS_DIR)
    
    # Clean previous extraction
    pot_dir = os.path.join(LOCALES_DIR, 'en', 'LC_MESSAGES')
    if os.path.exists(pot_dir):
        print(f"\nCleaning previous extraction: {pot_dir}")
        shutil.rmtree(pot_dir)
    
    # Run sphinx-build with gettext builder
    print("\nExtracting translatable messages...")
    print(f"Source: {SOURCE_DIR}")
    print(f"Output: {LOCALES_DIR}")
    print()
    
    cmd = [
        'sphinx-build',
        '-b', 'gettext',           # Use gettext builder
        '-d', 'build/doctrees',    # Doctrees cache
        SOURCE_DIR,                # Source directory
        LOCALES_DIR                # Output directory
    ]
    
    try:
        result = subprocess.run(cmd, check=True, capture_output=False)
        print("\n" + "=" * 60)
        print("Extraction completed successfully!")
        print("=" * 60)
        print(f"\nTemplate files (.pot) are located in:")
        print(f"  {pot_dir}")
        print("\nNext steps:")
        print("  1. Run: python tools/i18n/update_translations.py")
        print("  2. Edit .po files in docs/source/locales/zh_CN/LC_MESSAGES/")
        
    except subprocess.CalledProcessError as e:
        print(f"\nError: Extraction failed with code {e.returncode}", file=sys.stderr)
        return 1
    except FileNotFoundError:
        print("\nError: sphinx-build not found. Please install Sphinx:", file=sys.stderr)
        print("  pip install sphinx", file=sys.stderr)
        return 1
    
    return 0

if __name__ == '__main__':
    sys.exit(main())
