CC=clang
CFLAGS=-Wall -Wextra -std=c99 -ggdb

all:
	mkdir -p build dist
	clang src/main.c -o dist/TetrisJFF


run: dist/TetrisJFF
	./dist/TetrisJFF
