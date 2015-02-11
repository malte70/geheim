all: clean geheim.db

install: all
	install -m 600 geheim.db ${HOME}/.geheim.db

geheim.db: geheim.db.tar
	gpg --encrypt <geheim.db.tar >geheim.db

geheim.db.tar:
	cd storage && tar cf ../geheim.db.tar *

clean:
	rm -f geheim.db
	rm -f geheim.db.tar
