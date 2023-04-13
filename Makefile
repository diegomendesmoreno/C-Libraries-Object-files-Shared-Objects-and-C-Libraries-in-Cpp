CC=gcc
CFLAGS=-Wall -g

all: src

src:
	$(CC) main.c hello.c -o main
	./main

object:
	$(CC) $(CFLAGS) -c hello.c
	$(CC) main.c hello.o -o main
	./main

clean:
	rm -f *.o *.so main main_cpp
	clear
