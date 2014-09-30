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
//Function yyerror is necessary
//---------------------------------------------------------------------
void yyerror(const char* m)
{   cout << endl << m << endl;
    cout << endl;
}
//---------------------------------------------------------------------
//End of exppar.y
//---------------------------------------------------------------------
