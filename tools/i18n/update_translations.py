#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Update translation files for Chinese (zh_CN).

This script creates or updates .po files for Chinese translations based on
the extracted .pot template files.

Usage:
    python tools/i18n/update_translations.py

This will:
  1. Create docs/source/locales/zh_CN/LC_MESSAGES/ if it doesn't exist
  2. Generate/update .po files from .pot templates
  3. Preserve existing translations

After running this, edit the .po files to add Chinese translations.
"""

import os
import sys
import subprocess

# Configuration
DOCS_DIR = os.path.join(os.path.dirname(__file__), '..', '..', 'docs')
LOCALES_DIR = os.path.join(DOCS_DIR, 'source', 'locales')
# Sphinx gettext builder puts .pot files directly in locales/ (not in en/LC_MESSAGES/)
POT_DIR = LOCALES_DIR

def main():
    """Update Chinese translation files."""
    print("=" * 60)
    print("Sphinx i18n: Update Chinese Translations (zh_CN)")
    print("=" * 60)
    
    # Check if .pot files exist (search recursively)
    pot_files = []
    for root, dirs, files in os.walk(POT_DIR):
        for f in files:
            if f.endswith('.pot'):
                pot_files.append(os.path.join(root, f))
    
    if not pot_files:
        print(f"\nError: No .pot files found in {POT_DIR}", file=sys.stderr)
        print("Please run extract_messages.py first:", file=sys.stderr)
        print("  python tools/i18n/extract_messages.py", file=sys.stderr)
        return 1
    
    print(f"\nFound {len(pot_files)} template files to process.")
    
    # Ensure we're in the docs directory
    os.chdir(DOCS_DIR)
    
    # Update translations using sphinx-intl
    print("\nUpdating Chinese translation files...")
    print(f"Output: {LOCALES_DIR}/zh_CN/LC_MESSAGES/")
    print()
    
    cmd = [
        'sphinx-intl',
        'update',
        '-p', POT_DIR,           # Path to .pot files (root of locales/)
        '-l', 'zh_CN',           # Target language
        '-d', LOCALES_DIR        # Output directory
    ]
    
    try:
        result = subprocess.run(cmd, check=True, capture_output=False)
        print("\n" + "=" * 60)
        print("Update completed successfully!")
        print("=" * 60)
        print(f"\nTranslation files (.po) are located in:")
        print(f"  {LOCALES_DIR}/zh_CN/LC_MESSAGES/")
        print("\nNext steps:")
        print("  1. Edit .po files to add Chinese translations")
        print("  2. Run: python tools/i18n/compile_translations.py")
        print("  3. Build Chinese docs: cd docs && make html-zh")
        
    except subprocess.CalledProcessError as e:
        print(f"\nError: Update failed with code {e.returncode}", file=sys.stderr)
        return 1
    except FileNotFoundError:
        print("\nError: sphinx-intl not found. Please install it:", file=sys.stderr)
        print("  pip install sphinx-intl", file=sys.stderr)
        return 1
    
    return 0

if __name__ == '__main__':
    sys.exit(main())
