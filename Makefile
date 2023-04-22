CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -fPIC -D_GNU_SOURCE
LDFLAGS = -shared

.PHONY: all clean default

default: all	# just because the task ask for

all: encode decode libcodecA.so libcodecB.so cmp copy stshell

encode: encode.c
# produces the encode executable with the correct runtime library search path.
	$(CC) $(CFLAGS) -o encode encode.c -ldl -Wl,-rpath,'$$ORIGIN'

decode: decode.c
# produces the decode executable with the correct runtime library search path.
	$(CC) $(CFLAGS) -o decode decode.c -ldl -Wl,-rpath,'$$ORIGIN'

libcodecA.so: codecA.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o libcodecA.so codecA.c

libcodecB.so: codecB.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o libcodecB.so codecB.c

cmp: cmp.c
	$(CC) $(CFLAGS) -o cmp cmp.c

copy: copy.c
	$(CC) $(CFLAGS) -o copy copy.c

stshell: stshell.c
	$(CC) $(CFLAGS) -o stshell stshell.c

.PHONY: all clean

clean:
	rm -f encode decode libcodecA.so libcodecB.so cmp copy stshell *.txt

# explaination about the options: -Wl,-rpath,'$$ORIGIN': 
# This flag sets the RPATH (runtime library search path) 
# for the encode_decode executable. -Wl is used to pass options to the linker.
# In this case, we pass the -rpath option followed by '$$ORIGIN'.
# $$ is used to escape the $ character, so the actual value passed to the linker is $ORIGIN.
# At runtime, $ORIGIN is replaced with the path of the encode_decode executable,
# which tells the dynamic linker to search for shared libraries in the same directory as the executable.