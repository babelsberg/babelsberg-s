TARGET=.
MANIFEST=$(TARGET)/offline.appcache
FILES=../lib/squeak.js ../vm.js ../jit.js ../plugins/*.js index.html demo.css demo.js icon.png \
	../lib/lz-string.js ../lib/addtohomescreen.css ../lib/addtohomescreen.js ../lib/gh-fork-ribbon.css
EXTRA='http://www.lively-kernel.org/babelsberg/BabelsbergS.image'

$(MANIFEST): Makefile $(FILES)
	@rm -f $@
	@echo "CACHE MANIFEST" > $@
	@stat --format='# %z' `ls -t $(FILES) | head -n1` | tee -a $@
	@for f in $(FILES) $(EXTRA); do echo $$f >> $@ ; done
