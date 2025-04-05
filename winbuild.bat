@IF "%fbc%"=="" (
    @echo Please run SET FBC=fbc32 or your preferred compiler first
    @goto :eof
)
@echo Clearing Old Build Files
@del src\*.o
@del lib\*.a
@del tests\*.exe
@del examples\*.exe

@echo Building Components
%fbc% -c -i inc -w all -g -exx src/compact.bas
%fbc% -c -i inc -w all -g -exx src/insertinto.bas
%fbc% -c -i inc -w all -g -exx src/join.bas
%fbc% -c -i inc -w all -g -exx src/leven.bas
%fbc% -c -i inc -w all -g -exx src/pos.bas
%fbc% -c -i inc -w all -g -exx src/repeat.bas
%fbc% -c -i inc -w all -g -exx src/replace_copy.bas
%fbc% -c -i inc -w all -g -exx src/replace.bas
%fbc% -c -i inc -w all -g -exx src/reverse_copy.bas
%fbc% -c -i inc -w all -g -exx src/reverse.bas
%fbc% -c -i inc -w all -g -exx src/rot13.bas
%fbc% -c -i inc -w all -g -exx src/shuffle_copy.bas
%fbc% -c -i inc -w all -g -exx src/shuffle.bas
%fbc% -c -i inc -w all -g -exx src/split.bas
%fbc% -c -i inc -w all -g -exx src/substr_compare.bas
%fbc% -c -i inc -w all -g -exx src/substr_count.bas
%fbc% -c -i inc -w all -g -exx src/substr_replace.bas
%fbc% -c -i inc -w all -g -exx src/substr.bas
%fbc% -c -i inc -w all -g -exx src/ucwords.bas

@echo Building Libraries
%fbc% -lib src/compact.o src/insertinto.o src/join.o src/leven.o src/pos.o src/repeat.o src/replace_copy.o src/replace.o src/reverse_copy.o src/reverse.o src/rot13.o src/shuffle_copy.o src/shuffle.o src/split.o src/substr_compare.o src/substr_count.o src/substr_replace.o src/substr.o src/ucwords.o -x lib/libfbestrings.a

@echo Building Examples
%fbc% -i inc -p lib -w all -g -exx examples/join.bas
%fbc% -i inc -p lib -w all -g -exx examples/repeat.bas
%fbc% -i inc -p lib -w all -g -exx examples/replace.bas
%fbc% -i inc -p lib -w all -g -exx examples/reverse.bas
%fbc% -i inc -p lib -w all -g -exx examples/split.bas

@echo Running Tests
%fbc% -i inc -p lib -w all -g -exx tests/compact.bas
@tests\compact.exe

%fbc% -i inc -p lib -w all -g -exx tests/insert.bas
@tests\insert.exe

%fbc% -i inc -p lib -w all -g -exx tests/join.bas
@tests\join.exe

%fbc% -i inc -p lib -w all -g -exx tests/repeat.bas
@tests\repeat.exe

%fbc% -i inc -p lib -w all -g -exx tests/replace_copy.bas
@tests\replace_copy.exe

%fbc% -i inc -p lib -w all -g -exx tests/replace.bas
@tests\replace.exe

%fbc% -i inc -p lib -w all -g -exx tests/reverse_copy.bas
@tests\reverse_copy.exe

%fbc% -i inc -p lib -w all -g -exx tests/reverse.bas
@tests\reverse.exe

%fbc% -i inc -p lib -w all -g -exx tests/tokenize.bas
@tests\tokenize.exe

%fbc% -i inc -p lib -w all -g -exx tests/split.bas
@tests\split.exe