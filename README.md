# C Libraries, Object files, Shared Objects and C Libraries in C++
This document explains the different ways to use C libraries.

Throughout the exercises, after running the executable (`./main` and/or `./main_cpp`), you should see the following message in the console:
```bash
Wow, it works!
```

At any time, you can delete the executables/binaries/object files by running:
```bash
make clean
```

## How to use your own libraries in C
This example shows how to use a library in your C code in 3 different ways. We will use a simple library that just prints string in the console.

### Compiling library source files
This is done by compiling the library source files with the application code. And finally, running a self-contained final executable.
- If calling the toolchain from the command line, run:
```bash
gcc main.c hello.c -o main
./main
```
- If using a Makefile with `make`, run:
```bash
make
```

### Using an object file
This is done by precompiling the library into an object (`.o`) file and compiling it together with the application code. The result is also a self-contained final executable with the object file linked at the compilation.
- If calling the toolchain from the command line, run:
```bash
gcc -Wall -g -c hello.c
gcc main.c hello.o -o main
./main
```
- If using a Makefile with `make`, run:
```bash
make object
```

### Using a shared object file
This is done by precompiling the library into a shared object (`.so`) file or a dynamically linked library (`.dll` in Windows). Then we can compile with the application code, but the shared object will be loaded at run time and not packed together in the executable.

First, we create the shared object file:
```bash
gcc -Wall -g -fPIC -shared -o libhello.so hello.c -lc
```

Now, we need to specify where this shared object file is to be linked at run time. We can do this in two ways:

- Using the `-rpath` linker option: it is used to specify a directory to be added to the runtime search path for shared libraries. Run:
```bash
gcc -Wall -g -o main main.c -L. -lhello -Wl,-rpath,.
./main
```

- Using the `LD_LIBRARY_PATH` environment variable: it is an environment variable that tells the operating system where to look for shared libraries when running an executable. So, we can add the current directory to `LD_LIBRARY_PATH` and simplify the command prompt. Run:
```bash
LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
gcc -Wall -g -o main main.c -L. -lhello
./main
```

## How to use C libraries in C++ code
It is possible to use C libraries in C++ code. To do that, we include the C header in our C++ application code like so:
```C++
extern "C" {
#include "hello.h"
}
```

### Using a C shared object file in C++
First, we create the C shared file like before:
```bash
gcc -Wall -g -fPIC -shared -o libhello.so hello.c -lc
```

And now, we want to link this C shared library with our C++ application code. Again, we can do this in two ways:

- Using the `-rpath` linker option:
```bash
g++ -Wall -g -o main_cpp main.cpp -L. -lhello -Wl,-rpath,.
./main_cpp
```

- Using the `LD_LIBRARY_PATH` environment variable:
```bash
LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
g++ -Wall -g -o main_cpp main.cpp -L. -lhello
./main_cpp
```

## Glossary

- `-o`: Specifies the output file name for a compilation or linking step.
- `-Wall`: Enables all compiler warnings.
- `-g`: Includes debugging information in the compiled program.
- `-c`: Compiles source code into object files, without linking them into an executable.
- `-fPIC`: Generates position-independent code.
- `-shared`: Creates a shared library.
- `-lc`: Links the C standard library when building an executable or shared library.
- `-L.`: Adds the current directory to the library search path.
- `-lhello`: Links the `hello` library when building an executable or shared library.
- `-Wl`: Passes options to the linker.
- `-rpath,.`: Adds the current directory to the runtime search path for shared libraries.
- `LD_LIBRARY_PATH`: Environment variable that holds the shared libraries search path at run time.


## Links
- [Shared libraries with GCC on Linux](https://www.cprogramming.com/tutorial/shared-libraries-linux-gcc.html)
- [How to write your own code libraries in C - Jacob Sorber YouTube video](https://youtu.be/JbHmin2Wtmc)
