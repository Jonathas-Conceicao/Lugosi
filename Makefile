SHELL:=/bin/bash
J=java
JC=javac
JCC=javacc

MAIN_CLASS=Lugosi

FILE ?= minimal.lug

DEFAULT=\033[0m
RED=\033[00;31m
LCYAN=\033[01;36m

S=--no-print-directory

.PHONY: all run clean tests

all: build/bin/$(MAIN_CLASS).class

build/bin/$(MAIN_CLASS).class: Lugosi.jj
	$(JCC) -OUTPUT_DIRECTORY=build/src Lugosi.jj
	$(JC)  build/src/*.java -d build/bin

run: build/bin/$(MAIN_CLASS).class
	$(J) -cp build/bin/ $(MAIN_CLASS) $(FILE)

tests: build/bin/$(MAIN_CLASS).class
	@echo -e "$(LCYAN) Running Ok Tests$(DEFAULT)";   \
	for ((i=1;i<=3;i++));                             \
		do make $S run FILE=tests/OK$$i.lug;            \
	done;                                             \
	echo -e "$(RED) Running notOk Tests$(DEFAULT)";   \
	for ((i=1;i<=2;i++));                             \
		do make $S run FILE=tests/notOK$$i.lug || true; \
	done;

clean:
	rm -rf build/src/*.java
	rm -rf build/bin/*class
