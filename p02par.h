#ifndef exppar_h
#define exppar_h 1
//--------------------------------------------------------------------
// File exppar.h defines the interface to the parser generated by
// yacc.
//--------------------------------------------------------------------
// Author 1:    Steven Chambers                                           
// Student ID:  *20342421
// E-Mail:      schambers4@uco.edu
// Author 2:    Melicent King 
// Student ID:  *20355157
// E-mail:      mking24@uco.edu	                                        
// Course:      CMSC 4023 - Programming Languages
// CRN:         12105
// Project:     p02
// Due:         November 5, 2014 
// Account:     tt060
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
  Parser(FILE* i):Lexer(i){};
  ~Parser();
  int Parse();
};
#endif

