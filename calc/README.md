# Steps to use Bison

- Write a lexical analyzer to process input and pass tokens to the parser (calc.lex).
- Write the grammar specification for bison (calc.y), including grammar rules, yyparse() and yyerror().
- Run Bison on the grammar to produce the parser. (Makefile)
- Compile the code output by Bison, as well as any other source files.
- Link the object files to produce the finished product.


# Practice
Get familiar with Bison: Write a desk calculator which performs '+' and '*' on unsigned integers

      make
      ./calc

Use input programs (or stdin) which contain expressions with integer constants and operators + and *, then press Ctrl-D to see the result

## Understand the input file

### Format

      %{
      C Declarations
      %}
      Bison Declarations
      %%
      Grammar Rules
      %%
      Additional C Code


## Useful Bison definitions

    %token, %union, %type, %left, %right, %nonassoc, ...


## Format of the grammar rules section

    result: components ...
        ;

## Important data structure and functions

    yylval, YYSTYPE, yyerror(), yyparse()
