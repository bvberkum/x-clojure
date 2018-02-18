include templates.mk


/ := ./

$/%.html: $/%.md
	pandoc $< -t html > $@

$/%.md: $/%.txt
	@{ echo 'cat <<EOM' ; echo "$$ReadMe_md" ; echo 'EOM' ; } |  ENV=./.package.sh sh -i - > $@ ;

#$/%.rst: $/%.txt
#	@{ echo 'cat <<EOM' ; echo "$$ReadMe_rst" ; echo 'EOM' ; } |  ENV=./.package.sh sh -i - > $@ ;

$/ReadMe-fig1.gv: templates.mk
	@htd package update
	@{ echo 'cat <<EOM' ; echo "$$FIG1_DIGRAPH" ; echo 'EOM' ; } |  ENV=./.package.sh sh -i - > $@ ;
	
	
$/asset/%.png: $/%.gv
	@mkdir -vp $$(dirname $@)
	dot -Tpng -o$@ $<

$/asset/%.svg: $/%.gv
	@mkdir -vp $$(dirname $@)
	dot -Tsvg -o$@ $<


default: all

DOCS = ReadMe.md ReadMe.html 
ASSETS = asset/ReadMe-fig1.svg

$(DOCS) $(ASSETS): Makefile templates.mk

doc: $(DOCS) $(ASSETS)
all: $(DOCS) $(ASSETS)
