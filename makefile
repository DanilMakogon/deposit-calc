CC=gcc
FLAGS=-Wall -Werror -MP -MMD
all: bin/main
bin/main: build/main.o build/deposit.o
	mkdir bin -p
	$(CC) $(FLAGS) -o bin/main build/deposit.o build/main.o
build/main.o: src/main.c
	mkdir build -p
	$(CC) $(FLAGS) -c -o build/main.o src/main.c
build/deposit.o: src/deposit.c
	$(CC) $(FLAGS) -c -o build/deposit.o src/deposit.c
.PHONY: clean
clean:
	rm build/*
