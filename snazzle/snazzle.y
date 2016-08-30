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

// constant-string tokens
%token SNAZZLE TYPE
%token END

// terminal symbol types, each is associated with a field of the union
%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING

%%
// First rule defined is the highest-level, a "whole snazzle file"
snazzle:
        header template body_section footer { cout << "done parsing snazzlefile!" << endl; }
        ;
header:
        SNAZZLE FLOAT      { cout << "reading snazzlefile version: " << $2 << endl; }
        ;
template:
        typelines
        ;
typelines:
        typelines typeline
        | typeline
        ;
typeline:
        TYPE STRING { cout << "new defined snazzle type" << $2 << endl ; }
        ;
body_section:
        body_lines
        ;
body_lines:
        body_lines body_line
        | body_line
        ;
body_line:
        INT INT INT INT STRING { cout << "new snazzle: " << $1 << $2 << $3 << $4 << $5 << endl; }
        ;
footer:
        END
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
