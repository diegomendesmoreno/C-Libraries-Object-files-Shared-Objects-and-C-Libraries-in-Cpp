# Using C libraries

## Using C library in C - Compiling together
```
gcc main.c hello.c -o main
./main
```

## Creating a shared object library in C
```
gcc -c -fpic hello.c
gcc -shared -o libhello.so hello.o
```


# Using LD_LIBRARY_PATH

## Using C shared object library in C
```
LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
gcc main.c -lhello -L. -Ilibhello -o main_c
./main_c
```

## Using C shared object library in C++
```
LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
g++ main.cpp -lhello -L. -Ilibhello -o main_cpp
./main_cpp
```


# Using rpath

## Using C shared object library in C
```
gcc -L. -Wl,-rpath=. -Wall -o main_c main.c -lhello
./main_c
```

## Using C shared object library in C++
```
g++ -L. -Wl,-rpath=. -Wall -o main_cpp main.cpp -lhello
./main_cpp
```

# Links
- [Shared libraries with GCC on Linux](https://www.cprogramming.com/tutorial/shared-libraries-linux-gcc.html)
