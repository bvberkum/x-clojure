default: all
	
include templates.mk


/ := ./

$/%.html: $/%.md
	pandoc $< -t html > $@

$/%.md: $/%.txt
	@{ echo 'cat <<EOM' ; echo "$$ReadMe_md" ; echo 'EOM' ; } |  ENV=./.package.sh sh -i - > $@ ;

#$/%.rst: $/%.txt
#	@{ echo 'cat <<EOM' ; echo "$$ReadMe_rst" ; echo 'EOM' ; } |  ENV=./.package.sh sh -i - > $@ ;

$/ReadMe-fig1.gv: templates.mk
	@{ echo 'cat <<EOM' ; echo "$$FIG1_DIGRAPH" ; echo 'EOM' ; } |  ENV=./.package.sh sh -i - > $@ ;


$/.git/hooks/pre-commit: templates.mk
	@echo "$$pre_commit" > $@ ;
	@chmod +x $@ ;
	
	
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

TRGT = .git/hooks/pre-commit

$(DOCS) $(ASSETS): Makefile templates.mk .package.sh

doc: $(DOCS) $(ASSETS)
all: $(TRGT) $(DOCS) $(ASSETS)
