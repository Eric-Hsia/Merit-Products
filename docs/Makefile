# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR_EN  = source/en
SOURCEDIR_ZH  = source/zh_CN
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
.PHONY: help clean html html-en html-zh livehtml livehtml-en livehtml-zh

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  html        to make both English and Chinese HTML files"
	@echo "  html-en     to make English HTML files"
	@echo "  html-zh     to make Chinese HTML files"
	@echo "  livehtml    to start auto-rebuild server for English docs"
	@echo "  livehtml-en to start auto-rebuild server for English docs"
	@echo "  livehtml-zh to start auto-rebuild server for Chinese docs"
	@echo "  clean       to remove all build files"

# Build both languages
html: html-en html-zh
	@echo
	@echo "Build finished. Both English and Chinese HTML pages are in $(BUILDDIR)/html/"

# Build English documentation
html-en:
	$(SPHINXBUILD) -b html $(SPHINXOPTS) $(SOURCEDIR_EN) $(BUILDDIR)/html/en
	@echo
	@echo "Build finished. The English HTML pages are in $(BUILDDIR)/html/en."

# Build Chinese documentation
html-zh:
	$(SPHINXBUILD) -b html $(SPHINXOPTS) $(SOURCEDIR_ZH) $(BUILDDIR)/html/zh_CN
	@echo
	@echo "Build finished. The Chinese HTML pages are in $(BUILDDIR)/html/zh_CN."

# Live reload for development (requires sphinx-autobuild)
livehtml: livehtml-en

livehtml-en:
	@echo "Starting live reload server for English docs at http://localhost:8000"
	sphinx-autobuild -b html $(SOURCEDIR_EN) $(BUILDDIR)/html/en --port 8000

livehtml-zh:
	@echo "Starting live reload server for Chinese docs at http://localhost:8001"
	sphinx-autobuild -b html $(SOURCEDIR_ZH) $(BUILDDIR)/html/zh_CN --port 8001

# Clean build directory
clean:
	rm -rf $(BUILDDIR)
	@echo "Build directory cleaned."

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	$(SPHINXBUILD) -M $@ $(SOURCEDIR_EN) $(BUILDDIR) $(SPHINXOPTS) $(O)
