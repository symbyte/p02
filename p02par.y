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
program:
  term
  { cout << endl << "right thing here TODO"; 
  }
identifier-list:
  ID
  { cout << endl << "identifier-list -> ID";
  }
identifier-list:
  identifier-list COMMA ID
  { cout << endl << "identifier-list -> identifier-list, ID";
  }
{//TODO: declarations -> null set
}
declarations:
  declarations VAR identifier-list COLON type SEMICOLON
  { cout << endl << "declarations -> declarations VAR identifier-list : type ;";
  }
type:
  standard-type
  { cout << endl << "type -> standard-type";
  }
type:
  ARRAY LBRACKET INTLIT RANGE INTLIT RBRACKET OF standard-type
  { cout << endl << "type -> ARRAY [ INTLIT .. INTLIT ] OF standard-type";
  }
standard-type:
  INTEGER
  { cout << endl << "standard-type -> INTEGER";
  }
standard-type:
  REAL
  { cout << endl << "standard-type -> REAL";
  }
{// TODO: subprogram-declarations -> null set 
}
subprogram-declarations:
  subprogram-declarations subprogram-declaration SEMICOLON
  { cout << endl << "subprogram-declarations -> subprogram-declarations subprogram-declaration ;";
  }
subprogram-declaration:
  subprogram-head declarations compound-statement
  { cout << endl << "subprogram-declaration -> subprogram-head declarations compound-statement";
  }
subprogram-head:
  FUNCTION ID arguments COLON standard-type SEMICOLON
  { cout << endl << "subprogram-head -> FUNCTION ID arguments : standard-type ;";
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
