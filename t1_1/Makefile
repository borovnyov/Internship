LIBS =  libgoodbye.a libhello.a


.PHONY: all clean install
all: hello

clean:
			rm -rf hello *.o *.a *.so
hello: hello.o libs
			gcc -o hello hello.o -L. -lgoodbye  -lhello

hello.o: hello.c
			gcc  hello.c -c -o hello.o
libs:  $(LIBS)

libgoodbye.a: libgoodbye.o
			ar crs libgoodbye.a libgoodbye.o
libgoodbye.o: libgoodbye.c
			gcc libgoodbye.c -c -o libgoodbye.o
libhello.a: libhello.o
			ar crs libhello.a libhello.o
libhello.o: libhello.c
			gcc libhello.c -c  -o libhello.o
install:
			./hello

