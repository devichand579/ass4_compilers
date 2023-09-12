ass4_21CS30014_21CS30012_output.txt: parser ass4_21CS30014_21CS30012_test.c
	./parser < ass4_21CS30014_21CS30012_test.c > ass4_21CS30014_21CS30012_output.txt

parser: lex.yy.o y.tab.o ass4_21CS30014_21CS30012_main.o
	gcc lex.yy.o y.tab.o ass4_21CS30014_21CS30012_main.o -lfl -o parser

ass4_21CS30014_21CS30012_main.o: ass4_21CS30014_21CS30012_main.c
	gcc -c ass4_21CS30014_21CS30012_main.c

lex.yy.o: lex.yy.c
	gcc -c lex.yy.c

y.tab.o: y.tab.c
	gcc -c y.tab.c

lex.yy.c: ass4_21CS30014_21CS30012.l y.tab.h
	flex ass4_21CS30014_21CS30012.l

y.tab.c y.tab.h: ass4_21CS30014_19CS30012.y
	bison -dty --report=all ass4_21CS30014_21CS30012.y

clean:
	rm parser ass4_21CS30014_21CS30012_main.o lex.yy.* y.tab.* y.output