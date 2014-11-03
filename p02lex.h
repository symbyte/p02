#ifndef p02lex_h
#define p02lex_h 1
//--------------------------------------------------------------------
// File p02lex.h defines class Lexer.  
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
//C++ Standard include files
//--------------------------------------------------------------------
//--------------------------------------------------------------------
// Standard C and C++ include files                                        
//--------------------------------------------------------------------
#include <cstdio>
#include <fstream>
#include <iostream>
//--------------------------------------------------------------------
// Token Definitions
//--------------------------------------------------------------------
//#include "p02tkn.h"
//--------------------------------------------------------------------
//Namespaces
//--------------------------------------------------------------------
using namespace std;
//--------------------------------------------------------------------
//Function: yylex                                                     
//Function yylex is the expner.  Function yylex returns an integer   
//token code as defined above or 0 if end-of-file has been     
//reached.                                                            
//--------------------------------------------------------------------
#ifdef __cplusplus
extern "C" 
#endif
int yylex (void);
//--------------------------------------------------------------------
//Class Lexer defines the attributes of a Scanner
//--------------------------------------------------------------------
class Lexer {
public:
  Lexer(FILE* i);                //Constructor used to redirect the keyboard
                                 //(stdin) to file i.
  int Scan();
};
#endif
