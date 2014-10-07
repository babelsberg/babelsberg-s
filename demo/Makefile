TARGET=.
MANIFEST=$(TARGET)/offline.appcache
FILES=lib/squeak.js vm.js jit.js plugins/*.js page/index.html page/demo.css page/demo.js page/icon.png \
	lib/lz-string.js lib/addtohomescreen.css lib/addtohomescreen.js lib/gh-fork-ribbon.css
EXTRA='http://www.lively-kernel.org/babelsberg/BabelsbergS.image'

$(MANIFEST): Makefile $(TARGET)
	@rm -f $@
	@echo "CACHE MANIFEST" > $@
	@stat --format='# %z' `ls -t $(FILES) | head -n1` | tee -a $@
	@for f in $(FILES) $(EXTRA); do echo $$f >> $@ ; done

$(TARGET): $(FILES)
	@mkdir -pv $@ $@/lib $@/plugins
	@for f in $^ ; do install -pvm 444 $$f $@/$$f ; done
	@touch $@
