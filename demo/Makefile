#Just works for me

CURL=curl -L -o
BASE="https://raw.githubusercontent.com/bertfreudenberg/SqueakJS/master/"

default: all
clean:
	rm squeakjs/*

squeakjs/addtohomescreen.css:
	$(CURL) $@ $(BASE)/lib/addtohomescreen.css

squeakjs/addtohomescreen.js:
	$(CURL) $@ $(BASE)/lib/addtohomescreen.js

squeakjs/gh-fork-ribbon.css:
	$(CURL) $@ $(BASE)/lib/gh-fork-ribbon.css

squeakjs/lz-string.js:
	$(CURL) $@ $(BASE)/lib/lz-string.js

squeakjs/squeak.js:
	$(CURL) $@ $(BASE)/lib/squeak.js

squeakjs/vm.js:
	$(CURL) $@ $(BASE)/vm.js

all: squeakjs/addtohomescreen.css squeakjs/addtohomescreen.js squeakjs/gh-fork-ribbon.css squeakjs/lz-string.js squeakjs/squeak.js squeakjs/vm.js
