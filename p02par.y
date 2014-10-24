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
   //TODO
  }
identifier_list:
  ID
  { cout << endl << "identifier-list -> ID";
  }
identifier_list:
  identifier_list COMMA ID
  { cout << endl << "identifier-list -> identifier-list, ID";
  }
{//TODO: declarations -> null set
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
{// TODO: subprogram-declarations -> null set 
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
{//TODO: arguments -> null set
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
{//TODO: optional statements -> null set
}
optional_statements:
  statement_list
  { cout << endl << "optional-statements -> statement-list";
  }
statement_list:
  statement
  { cout << endl << "optional-statements -> statement";
  }
statement_list:
  statement_list SEMICOLON statement
  { cout << endl << "statement-list -> statement-list; statement";
  }
statement:
  variable ASSIGNOP expression
  { cout << endl << "statement -> variable := expression";
  }
statement
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
