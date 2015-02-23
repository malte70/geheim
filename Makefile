DEST=/usr/local

all:

test: bin/geheim test/*
	make -C test all
	sh test/test.sh

install: bin/geheim
	install -d $(DEST)/bin
	install -m 755 bin/geheim $(DEST)/bin/geheim
	install -d $(DEST)/share/licenses/geheim
	install -m 644 COPYING.md $(DEST)/share/licenses/geheim/
	install -d $(DEST)/share/doc
	install -m 644 README.md $(DEST)/share/doc
	cp -r doc/* $(DEST)/share/doc
	
