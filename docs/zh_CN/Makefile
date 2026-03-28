# Makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
PAPER         =
BUILDDIR      = _build

# User-friendly check for sphinx-build
ifeq ($(shell which $(SPHINXBUILD) >/dev/null 2>&1; echo $$?), 1)
$(error \
	The '$(SPHINXBUILD)' command was not found. \
	Make sure you have Sphinx installed, then set the SPHINXBUILD environment \
	variable to point to the full path of the '$(SPHINXBUILD)' executable. \
	Alternatively you can add the directory with the executable to your PATH. \
	If you don't have Sphinx installed, grab it from https://www.sphinx-doc.org/)
endif

# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) -w sphinx-warning-log.txt .
I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .

.PHONY: help clean html dirhtml singlehtml pickle json htmlhelp qthelp devhelp \
        epub latex latexpdf text man texinfo info gettext changes linkcheck \
        doctest xml pseudoxml

help:
	@echo "请使用 \`make <target>'，其中 <target> 是以下之一："
	@echo "  html        生成独立 HTML 文件"
	@echo "  dirhtml     生成目录形式的 HTML 文件（每目录一个 index.html）"
	@echo "  singlehtml  生成单个大型 HTML 文件"
	@echo "  pickle      生成 pickle 文件"
	@echo "  json        生成 JSON 文件"
	@echo "  latex       生成 LaTeX 文件（可设置 PAPER=a4 或 PAPER=letter）"
	@echo "  latexpdf    生成 LaTeX 文件并通过 pdflatex 编译"
	@echo "  text        生成纯文本文件"
	@echo "  man         生成 man 手册页"
	@echo "  linkcheck   检查所有外部链接的有效性"
	@echo "  doctest     运行文档中嵌入的 doctest（如启用）"

clean:
	rm -rf $(BUILDDIR)/*

html:
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html
	@echo
	@echo "构建完成。HTML 页面位于 $(BUILDDIR)/html。"

dirhtml:
	$(SPHINXBUILD) -b dirhtml $(ALLSPHINXOPTS) $(BUILDDIR)/dirhtml
	@echo
	@echo "构建完成。HTML 页面位于 $(BUILDDIR)/dirhtml。"

singlehtml:
	$(SPHINXBUILD) -b singlehtml $(ALLSPHINXOPTS) $(BUILDDIR)/singlehtml
	@echo
	@echo "构建完成。HTML 页面位于 $(BUILDDIR)/singlehtml。"

pickle:
	$(SPHINXBUILD) -b pickle $(ALLSPHINXOPTS) $(BUILDDIR)/pickle
	@echo
	@echo "构建完成；您现在可以处理 pickle 文件了。"

json:
	$(SPHINXBUILD) -b json $(ALLSPHINXOPTS) $(BUILDDIR)/json
	@echo
	@echo "构建完成；您现在可以处理 JSON 文件了。"

latex:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
	@echo
	@echo "构建完成；LaTeX 文件位于 $(BUILDDIR)/latex。"

latexpdf:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
	@echo "正在通过 pdflatex 编译 LaTeX 文件..."
	$(MAKE) -C $(BUILDDIR)/latex all-pdf
	@echo "pdflatex 完成；PDF 文件位于 $(BUILDDIR)/latex。"

text:
	$(SPHINXBUILD) -b text $(ALLSPHINXOPTS) $(BUILDDIR)/text
	@echo
	@echo "构建完成。文本文件位于 $(BUILDDIR)/text。"

man:
	$(SPHINXBUILD) -b man $(ALLSPHINXOPTS) $(BUILDDIR)/man
	@echo
	@echo "构建完成。man 页面位于 $(BUILDDIR)/man。"

texinfo:
	$(SPHINXBUILD) -b texinfo $(ALLSPHINXOPTS) $(BUILDDIR)/texinfo
	@echo
	@echo "构建完成。Texinfo 文件位于 $(BUILDDIR)/texinfo。"

info:
	$(SPHINXBUILD) -b texinfo $(ALLSPHINXOPTS) $(BUILDDIR)/texinfo
	@echo "通过 makeinfo 处理 Texinfo 文件..."
	make -C $(BUILDDIR)/texinfo info
	@echo "makeinfo 完成；Info 文件位于 $(BUILDDIR)/texinfo。"

gettext:
	$(SPHINXBUILD) -b gettext $(I18NSPHINXOPTS) $(BUILDDIR)/locale
	@echo
	@echo "构建完成。消息目录位于 $(BUILDDIR)/locale。"

changes:
	$(SPHINXBUILD) -b changes $(ALLSPHINXOPTS) $(BUILDDIR)/changes
	@echo
	@echo "概览文件位于 $(BUILDDIR)/changes。"

linkcheck:
	$(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) $(BUILDDIR)/linkcheck
	@echo
	@echo "链接检查完成；请查看上方输出或 $(BUILDDIR)/linkcheck/output.txt。"

doctest:
	$(SPHINXBUILD) -b doctest $(ALLSPHINXOPTS) $(BUILDDIR)/doctest
	@echo "文档 doctest 测试完成，结果位于 $(BUILDDIR)/doctest/output.txt。"

xml:
	$(SPHINXBUILD) -b xml $(ALLSPHINXOPTS) $(BUILDDIR)/xml
	@echo
	@echo "构建完成。XML 文件位于 $(BUILDDIR)/xml。"

pseudoxml:
	$(SPHINXBUILD) -b pseudoxml $(ALLSPHINXOPTS) $(BUILDDIR)/pseudoxml
	@echo
	@echo "构建完成。pseudo-XML 文件位于 $(BUILDDIR)/pseudoxml。"
