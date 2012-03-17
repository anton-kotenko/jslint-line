JSLINT_HOME=/usr/share/jslint
BINPATH=/usr/bin/jslint

JSLint/jslint.js:
	[ -e "JSLint/.git"  ] && cd ./JSLint &&  git pull origin
	[ -e "JSLint/.git"  ] || git clone https://github.com/douglascrockford/JSLint.git ./JSLint
$(BINPATH):JSLint/jslint.js ./jslintrun.js 
	rm -rf $(JSLINT_HOME)
	mkdir $(JSLINT_HOME)
	echo '#!'`which node` > $(BINPATH)
	cat jslintrun.js >> $(BINPATH) && cp JSLint/jslint.js $(JSLINT_HOME) 
	chmod +x $(BINPATH)
	@echo "jslint installed successfully";
install:$(BINPATH)	
deinstall:
	rm $(BINPATH) && rm -r $(JSLINT_HOME)
clean:
	[ -e "JSLint" ] && rm -fr JSLint

.PHONY: clean deinstall install

