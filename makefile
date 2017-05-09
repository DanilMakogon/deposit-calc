CC=gcc
FLAGS=-Wall -Werror -MP -MMD
CFLAGS= -Wall -Werror
TEST_FLAGS= -I src -I thirdparty -Wall -Werror
EXECUTABLE= bin/calc
SRC_BUILD_DIR= src
SRC_DIR= src/
TEST_EXEC= bin/test
TEST_OBJ_DIR= build/test
all: bin/main test
bin/main: build/main.o build/deposit.o
	mkdir bin -p
	$(CC) $(FLAGS) -o bin/main build/deposit.o build/main.o
build/main.o: src/main.c
	mkdir build -p
	$(CC) $(FLAGS) -c -o build/main.o src/main.c
build/deposit.o: src/deposit.c
	$(CC) $(FLAGS) -c -o build/deposit.o src/deposit.c

test: mktest test-comp

mktest:
	mkdir -p bin build/test

test-comp: $(TEST_OBJ_DIR)/main.o $(TEST_OBJ_DIR)/deposit_test.o $(TEST_OBJ_DIR)/validation_test.o $(SRC_BUILD_DIR)/deposit.o
	$(CC) $(TEST_OBJ_DIR)/main.o $(TEST_OBJ_DIR)/deposit_test.o $(TEST_OBJ_DIR)/validation_test.o $(SRC_BUILD_DIR)/deposit.o -o $(TEST_EXEC)

$(TEST_OBJ_DIR)/main.o: test/main.c
	$(CC) $(TEST_FLAGS) -c test/main.c -o $(TEST_OBJ_DIR)/main.o

$(TEST_OBJ_DIR)/deposit_test.o: test/deposit_test.c
	$(CC) $(TEST_FLAGS) -c test/deposit_test.c -o $(TEST_OBJ_DIR)/deposit_test.o

$(TEST_OBJ_DIR)/validation_test.o: test/validation_test.c
	$(CC) $(TEST_FLAGS) -c test/validation_test.c -o $(TEST_OBJ_DIR)/validation_test.o

.PHONY: clean
clean:
	rm build/*
