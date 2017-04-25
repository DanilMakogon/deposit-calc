all: bin/main

bin/main: build/main.o build/deposit.o
	mkdir bin -p
	gcc -Wall -Werror -o bin/main build/deposit.o build/main.o
build/main.d: src/main.c
	mkdir build -p
	gcc -Wall -Werror -c -o build/main.o src/main.c -MP -MMD
build/deposit.d: src/deposit.c
	mkdir build -p
	gcc -Wall -Werror -c -o build/deposit.o src/deposit.c -MP -MMD
.PHONY: clean
clean:
	rm build/*
-include build/main.d
-include build/deposit.d
