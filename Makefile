all:

test: bin/geheim test/*
	make -C test all
	sh test/test.sh


