# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    = -q
SPHINXBUILD   = python -msphinx
SPHINXPROJ    = acis_viols_tracking
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

.PHONY: deploy
deploy: track html
	rm -rf /proj/web-cxc-dmz/htdocs/acis/acis_viols_tracking
	cp -rf build/html /proj/web-cxc-dmz/htdocs/acis/acis_viols_tracking

.PHONY: track
track: 
	python track_viols.py 2016

.PHONY: all_clean
all_clean: clean source_clean

.PHONY: source_clean
source_clean:
	rm -rf source/_static/*.png
	rm -rf source/20*
	rm -rf source/index.rst

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)