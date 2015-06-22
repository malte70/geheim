default_key = $(shell grep default-key ${HOME}/.gnupg/gpg.conf | cut -d" " -f2)

all: clean geheim.db

install: all
	@install -m 600 geheim.db ${HOME}/.geheim.db

geheim.db: geheim.db.tar
	@if [ "x$(default_key)" != x ]; then gpg --encrypt -r $(default_key) <geheim.db.tar >geheim.db; else gpg --encrypt <geheim.db.tar >geheim.db; fi

geheim.db.tar:
	@cd storage && tar cf ../geheim.db.tar *

clean:
	@rm -f geheim.db
	@rm -f geheim.db.tar
