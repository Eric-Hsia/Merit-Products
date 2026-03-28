# Makefile for Sphinx documentation
# This builds both English and Chinese documentation

.PHONY: help html all en zh_CN clean

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html        to make standalone HTML files for both en and zh_CN"
	@echo "  all         same as html"
	@echo "  en          to make standalone HTML files for en only"
	@echo "  zh_CN       to make standalone HTML files for zh_CN only"
	@echo "  clean       to clean build artifacts in all subdirectories"

all: html

html:
	@echo "Building English documentation..."
	@$(MAKE) -C en html
	@echo "Building Chinese documentation..."
	@$(MAKE) -C zh_CN html
	@echo
	@echo "Build finished. The HTML pages are in en/_build/html and zh_CN/_build/html."

en:
	@echo "Building English documentation..."
	@$(MAKE) -C en html
	@echo
	@echo "Build finished. The HTML pages are in en/_build/html."

zh_CN:
	@echo "Building Chinese documentation..."
	@$(MAKE) -C zh_CN html
	@echo
	@echo "Build finished. The HTML pages are in zh_CN/_build/html."

clean:
	@echo "Cleaning English documentation..."
	@$(MAKE) -C en clean
	@echo "Cleaning Chinese documentation..."
	@$(MAKE) -C zh_CN clean
	@echo
	@echo "Clean finished."
