#include <cstdio>
#include <iostream>
using namespace std;

// stuff from flex that bison needs to know about
extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;
extern int line_num;

void yyerror(const char *s);
