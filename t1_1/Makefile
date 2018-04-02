LIBS =  libgoodbye.a libhello.so


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
libhello.so: libhello.o
			gcc --shared -o libhello.so libhello.o
libhello.o: libhello.c
			gcc libhello.c -c -Wall -fPIC  -o libhello.o
install:
			sudo cp libhello.so /usr/lib/
uninstall:
			sudo rm /usr/lib/libhello.so


