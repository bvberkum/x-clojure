.PHONY: default doc all

default: all
	
include templates.mk

sh-template = { echo 'cat <<EOM' ; echo "$$$(1)" ; echo 'EOM' ; } |  ENV=./.package.sh sh -i -


/ := ./

$/%.html: $/%.md
	pandoc $< -t html > $@

$/%.md: $/%.txt
	@$(call sh-template,ReadMe_md) > $@

#$/%.rst: $/%.txt
#	@$(call sh-template,ReadMe_rst) > $@

$/ReadMe-fig1.gv:
	@$(call sh-template,FIG1_DIGRAPH) > $@


$/.git/hooks/pre-commit:
	@$(call sh-template,pre_commit) > $@
	
	
$/asset/%.png: $/%.gv
	@mkdir -vp $$(dirname $@)
	dot -Tpng -o$@ $<

$/asset/%.svg: $/%.gv
	@mkdir -vp $$(dirname $@)
	dot -Tsvg -o$@ $<


$/.package.sh: $/package.yml
	@htd package update


DOCS = ReadMe.md ReadMe.html 
ASSETS = asset/ReadMe-fig1.svg

doc: $(DOCS) $(ASSETS)

TRGT = .git/hooks/pre-commit $(ASSETS) $(DOCS)

$(TRGT): Makefile templates.mk .package.sh

all: $(TRGT)
