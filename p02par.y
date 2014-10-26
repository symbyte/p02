%{
//---------------------------------------------------------------------
//File p02par.y contains a specification for simple expressions 
//defined by Thomas R. Turner.
//---------------------------------------------------------------------
//Author:   Steven Chambers
//E-Mail:   schambers4@uco.edu
//Author:   Melicent King
//E-Mail:   mking24@uco.edu
//Date:     October,2014 
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//C++ include files
//---------------------------------------------------------------------
#include <iostream>
#include <fstream>
#include <iomanip>
#include <cstdio>
//---------------------------------------------------------------------
//Application include files
//---------------------------------------------------------------------
#include "p02lex.h"
#include "p02par.h"
//---------------------------------------------------------------------
//Externals
//---------------------------------------------------------------------
extern int lineNo;
extern int colNo;
#define YYDEBUG 1
//---------------------------------------------------------------------
//Function prototypes
//---------------------------------------------------------------------
void yyerror(const char* m);
//---------------------------------------------------------------------
%}
%token NOTOKEN
%token INTLIT
%token PLUS
%token MINUS
%token STAR
%token SLASH
%token LPAREN 
%token RPAREN 
%token RBRACKET
%token LBRACKET 
%token COLON
%token SEMICOLON
%token COMMA
%token PERIOD
%token RANGE
%token ASSIGNOP
%token EQU
%token NEQ
%token LES
%token GRT
%token GEQ
%token CHRLIT
%token REALIT
%token ID
%token AND
%token ARRAY
%token BEGAN
%token DIV
%token DO
%token ELSE
%token END
%token FOR
%token FUNCTION
%token IF
%token INTEGER
%token MOD
%token NOT
%token OF
%token OR
%token PROCEDURE
%token PROGRAM
%token REAL
%token REPEAT
%token THEN
%token TO
%token UNTIL
%token VAR
%token WHILE
%token LEQ
%token ERROR
%debug
%error-verbose
%%
program:
  PROGRAM ID LPAREN identifier_list RPAREN SEMICOLON declarations subprogram_declarations compound_statement PERIOD
  { cout << endl << "program -> PROGRAM ID ( identifier-list ) ; declarations subprogram-declarations compound-statement .";
  }
identifier_list:
  ID
  { cout << endl << "identifier-list -> ID";
  }
identifier_list:
  identifier_list COMMA ID
  { cout << endl << "identifier-list -> identifier-list, ID";
  }
declarations:
  { /* empty */
    cout << endl << "declarations -> \"\"";
  }
declarations:
  declarations VAR identifier_list COLON type SEMICOLON
  { cout << endl << "declarations -> declarations VAR identifier-list : type ;";
  }
type:
  standard_type
  { cout << endl << "type -> standard-type";
  }
type:
  ARRAY LBRACKET INTLIT RANGE INTLIT RBRACKET OF standard_type
  { cout << endl << "type -> ARRAY [ INTLIT .. INTLIT ] OF standard-type";
  }
standard_type:
  INTEGER
  { cout << endl << "standard-type -> INTEGER";
  }
standard_type:
  REAL
  { cout << endl << "standard-type -> REAL";
  }
subprogram_declarations:
  { /* empty */
    cout << endl << "subprogram-declarations -> \"\"";
  }
subprogram_declarations:
  subprogram_declarations subprogram_declaration SEMICOLON
  { cout << endl << "subprogram-declarations -> subprogram-declarations subprogram-declaration ;";
  }
subprogram_declaration:
  subprogram_head declarations compound_statement
  { cout << endl << "subprogram-declaration -> subprogram-head declarations compound-statement";
  }
subprogram_head:
  FUNCTION ID arguments COLON standard_type SEMICOLON
  { cout << endl << "subprogram-head -> FUNCTION ID arguments : standard-type ;";
  }
subprogram_head:
  PROCEDURE ID arguments SEMICOLON
  { cout << endl << "subprogram-head -> PROCEDURE ID arguments;";
  }
arguments:
  { /* empty */
    cout << endl << "arguments -> \"\"";
  }
arguments:
  LPAREN parameter_list RPAREN
  { cout << endl << "arguments -> ( parameter list )";
  }
parameter_list:
  identifier_list COLON type
  { cout << endl << "parameter-list -> identifier-list : type";
  }
parameter_list:
  parameter_list SEMICOLON identifier_list COLON type
  { cout << endl << "parameter-list -> parameter-list ; identifier-list : type";
  }
compound_statement:
  BEGAN optional_statements END
  { cout << endl << "compound-statement -> BEGIN optional-statements END";
  }
optional_statements:
  statement_list
  { cout << endl << "optional-statements -> statement-list";
  }
optional_statements:
  { /* empty */
    cout << endl << "optional-statements -> \"\"";
  }
statement_list:
  statement
  { cout << endl << "statement-list -> statement";
  }
statement_list:
  statement_list SEMICOLON statement
  { cout << endl << "statement-list -> statement-list; statement";
  }
statement:
  variable ASSIGNOP expression
  { cout << endl << "statement -> variable := expression";
  }
statement:
  procedure_statement
  { cout << endl << "statement -> procedure-statement";
  }
statement:
  compound_statement
  { cout << endl << "statement -> compound-statement";
  }
statement:
  IF expression THEN statement ELSE statement
  { cout << endl << "statement -> IF expression THEN statement ELSE statement";
  }
statement:
  WHILE expression DO statement
  { cout << endl << "statement -> WHILE expression DO statement";
  }
variable:
  ID
  { cout << endl << "variable -> ID";
  }
variable:
  ID LBRACKET expression RBRACKET
  { cout << endl << "variable -> ID [ expression ]";
  }
procedure_statement:
  ID
  { cout << endl << "procedure-statement -> ID";
  }
procedure_statement:
  ID LPAREN expression_list RPAREN
  { cout << endl << "procedure-statement -> ID ( expression-list )";
  }
expression_list:
  expression
  { cout << endl << "expression-list -> expression";
  }
expression_list:
  expression_list COMMA expression
  { cout << endl << "expression-list -> expression-list, expression";
  }
expression:
  simple_expression
  { cout << endl << "expression -> simple-expression";
  }
expression:
    simple_expression relop simple_expression 
    {
        cout << endl << "expression -> simple_expression relop simple_expression";
    }
relop:
    EQU 
    {
        cout << endl << "relop -> =";
    }
relop:
    NEQ 
    {
        cout << endl << "relop -> <>";
    }
relop:
    LES 
    {
        cout << endl << "relop -> <";
    }
relop:
    LEQ 
    {
        cout << endl << "relop -> <=";
    }
relop:
    GRT
    {
        cout << endl << "relop -> >";
    }
relop:
    GEQ
    {
        cout << endl << "relop -> >=";
    }
simple_expression:
    term 
    {
        cout << endl << "simple_expression -> term";
    }
simple_expression:
    sign term
    {
        cout << endl << "simple_expression -> sign term";
    }
simple_expression:
    simple_expression addop term
    {
        cout << endl << "simple_expression -> simple-expression addop term";
    }
addop:
    PLUS 
    {
        cout << endl << "addop -> +";
    }
addop:
    MINUS
    {
        cout << endl << "addop -> -";
    }
addop:
    OR
    {
        cout << endl << "addop -> OR";
    }
term:
    factor 
    {
        cout << endl << "term -> factor";
    }
term:
    term mulop factor 
    {
        cout << endl << "term -> term mulop factor";
    }
mulop:
    STAR  
    {
        cout << endl << "mulop -> *";
    }
mulop:
    SLASH 
    {
        cout << endl << "mulop -> /";
    }
mulop:
    DIV
    {
        cout << endl << "mulop -> DIV";
    }
mulop:
    MOD
    {
        cout << endl << "mulop -> MOD";
    }
mulop:
    AND 
    {
        cout << endl << "mulop -> AND";
    }
factor:
    ID
    {
        cout << endl << "factor -> ID";
    }
factor:
    ID LPAREN expression_list RPAREN
    {
        cout << endl << "factor -> ID(expression_list)";
    }
factor:
    INTLIT
    {
        cout << endl << "factor -> INTLIT";
    }
factor:
    REALIT
    {
        cout << endl << "factor -> REALIT";
    }
factor:
    LPAREN expression RPAREN 
    {
        cout << endl << "factor -> (expression)";
    }
factor:
    NOT factor 
    {
        cout << endl << "factor -> NOT factor";
    }
sign:
    PLUS
    {
        cout << endl << "sign -> +";
    }
sign:
    MINUS 
    {
        cout << endl << "sign -> -";
    }
%%
//---------------------------------------------------------------------
//User function section
//---------------------------------------------------------------------
struct Error {
  Error(const char* m) {
    cout << endl << "line(" << lineNo << ") col(" << colNo << ")" << m;
    cout << endl;
  }
};
//---------------------------------------------------------------------
//Function yyerror is necessary
//---------------------------------------------------------------------
void yyerror(const char* m)
{  
  throw Error(m);
}
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//Parser::Parser(FILE* i):Lexer(i){};
int Parser::Parse(){return yyparse();}
//---------------------------------------------------------------------
//---------------------------------------------------------------------
Parser::~Parser(){}
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//End of exppar.y
//---------------------------------------------------------------------
