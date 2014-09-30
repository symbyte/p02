#ifndef exppar_h
#define exppar_h 1
//--------------------------------------------------------------------
// File exppar.h defines the interface to the parser generated by
// yacc.
//--------------------------------------------------------------------
//Author:   Steven Chambers
//E-Mail:   schambers4@uco.edu
//Author:   Melicent King
//E-Mail:   mking24@uco.edu
//Date:     October,2014                                     
//--------------------------------------------------------------------
//--------------------------------------------------------------------
//Function yyparse is the parser generated by yacc.                  
//--------------------------------------------------------------------
#ifdef __cplusplus
extern "C" 
#endif
int yyparse (void);
class Parser: public Lexer {
public:
  Parser(FILE* i):Lexer(i){}
};
#endif
