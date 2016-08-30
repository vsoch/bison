%{
#include "snazzle.h"
%}

// This is the section for Bison
// the types of tokens that Flex could return

%union {
        int ival;
        float fval;
        char *sval;
}

// terminal symbol types, each is associated with a field of the union

%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING

%%
snazzle:
        snazzle INT        { cout << "bison found an int: " << $2 << endl; }
        | snazzle FLOAT    { cout << "bison found a float: " << $2 << endl; }
        | snazzle STRING   { cout << "bison found a string: " << $2 << endl; }
        | INT              { cout << "bison found an int: " << $1 << endl; }
        | FLOAT            { cout << "bison found a float: " << $1 << endl; }
        | STRING           { cout << "bison found a string: " << $1 << endl; }
        ;
%%
int main(int, char**) {

    // Open a file handle to a particular "snazzlefile"
    FILE *snazzlefile = fopen("snazzlefile","r");
    
    // Make sure the file is valid
    if (!snazzlefile) {
        cout << "snazzlefile is not valid!" << endl;
        return -1;
    }

    // Have lex read from the file instead of stdin, until there is no more
    yyin = snazzlefile;

    do {
        yyparse();
    } while (!feof(yyin));

}

void yyerror(const char *s) {
    cout << "Parse error! Message: " << s << endl;
    exit(-1);
}
