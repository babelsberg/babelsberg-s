#Just works for me

CURL=curl -L -o
BASE="https://raw.githubusercontent.com/bertfreudenberg/SqueakJS/master/"

default: all
clean:
	mkdir -p lib
	mkdir -p plugins
	rm -f lib/*
	rm -f plugins/*
	rm -f *.js

lib/addtohomescreen.css:
	$(CURL) $@ $(BASE)/lib/addtohomescreen.css

lib/addtohomescreen.js:
	$(CURL) $@ $(BASE)/lib/addtohomescreen.js

lib/gh-fork-ribbon.css:
	$(CURL) $@ $(BASE)/lib/gh-fork-ribbon.css

lib/lz-string.js:
	$(CURL) $@ $(BASE)/lib/lz-string.js

lib/squeak.js:
	$(CURL) $@ $(BASE)/lib/squeak.js

vm.js:
	$(CURL) $@ $(BASE)/vm.js

jit.js:
	$(CURL) $@ $(BASE)/jit.js

ui.js:
	$(CURL) $@ $(BASE)/ui.js

plugins/LargeIntegers.js:
	$(CURL) $@ $(BASE)/plugins/LargeIntegers.js

all: lib/addtohomescreen.css lib/addtohomescreen.js \
	lib/gh-fork-ribbon.css lib/lz-string.js \
	lib/squeak.js vm.js\
	ui.js jit.js \
	plugins/LargeIntegers.js
