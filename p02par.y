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
%%
expression:
  term
  { cout << endl << "expression -> term"; 
  }
expression:
  expression PLUS term
  { cout << endl << "expression -> expression + term";
  }
expression:
  expression MINUS term
  { cout << endl << "expression -> expression - term";
  }
term:
  factor
  { cout << endl << "term -> factor";
  }
term:
  term STAR factor
  { cout << endl << "term -> term * factor";
  }
term:
  term SLASH factor
  { cout << endl << "term -> term / factor";
  }
factor:
  LPAREN expression RPAREN
  { cout << endl << "factor -> ( expression )";
  }
factor:
  INTLIT
  { cout << endl << "factor -> INTLIT";
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
