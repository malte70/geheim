DEST=/usr/local

all:
	
test: bin/geheim test/*
	@make -s -C test all
	@sh test/test.sh
	
install: bin/geheim
	@install -d $(DEST)/bin
	@install -m 755 bin/geheim $(DEST)/bin/geheim
	@install -d $(DEST)/share/licenses/geheim
	@install -m 644 COPYING.md $(DEST)/share/licenses/geheim/
	@install -d $(DEST)/share/doc/geheim
	@install -m 644 README.md $(DEST)/share/doc/geheim
	@cp -r doc/*.md $(DEST)/share/doc/geheim
	@install -d $(DEST)/share/man/man1/
	@install -Dm644 doc/geheim.1 $(DEST)/share/man/man1/
	
