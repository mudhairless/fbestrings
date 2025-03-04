COMPILER = fbc
COMPILE_OPTS = -i inc -g -w all -exx
LINK_OPTS = -lib
TEST_COMPILE_OPTS = -i inc -p lib -g -w all -exx
EXE_EXT = .exe

all: lib/libfbestrings.a 

%.o: %.bas 
	$(COMPILER) $(COMPILE_OPTS) -c $< -o $@

lib/libfbestrings.a: src/compact.o src/insertinto.o src/join.o src/leven.o src/pos.o src/repeat.o src/replace_copy.o src/replace.o src/reverse_copy.o src/reverse.o src/rot13.o src/shuffle_copy.o src/shuffle.o src/split.o src/substr_compare.o src/substr_count.o src/substr_replace.o src/substr.o src/ucwords.o
	$(COMPILER) $(LINK_OPTS) -x lib/libfbestrings.a src/compact.o src/insertinto.o src/join.o src/leven.o src/pos.o src/repeat.o src/replace_copy.o src/replace.o src/reverse_copy.o src/reverse.o src/rot13.o src/shuffle_copy.o src/shuffle.o src/split.o src/substr_compare.o src/substr_count.o src/substr_replace.o src/substr.o src/ucwords.o

clean:
	rm src/*.o lib/*.a 

.PHONY: clean
