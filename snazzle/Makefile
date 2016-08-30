# Create c and header from bison config (.y)
snazzle.tab.c snazzle.tab.h: snazzle.y
	bison -d snazzle.y

lex.yy.c: snazzle.l snazzle.tab.h
	flex snazzle.l

snazzle: lex.yy.c snazzle.tab.c snazzle.tab.h
	g++ snazzle.tab.c lex.yy.c -lfl -o snazzle

all:
	bison -d snazzle.y
	flex snazzle.l
	g++ snazzle.tab.c lex.yy.c -lfl -o snazzle

clean: 
	rm lex.yy.c snazzle.tab.c snazzle.tab.h snazzle
