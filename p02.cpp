//-------------------------------------------------------------------
//File p02.cpp contains functions that process command line arguments
//and interface with the lex-generated scanner and parser 
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
//--------------------------------------------------------------------
//C++ Standard include files
//--------------------------------------------------------------------
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <cstdio>
#include <string>
//--------------------------------------------------------------------
//Application include files
//--------------------------------------------------------------------
#include "p02lex.h"
#include "p02par.h"
//--------------------------------------------------------------------
//Namespaces
//--------------------------------------------------------------------
using namespace std;
extern int yydebug;
//--------------------------------------------------------------------
//Function main processes command line arguments
//--------------------------------------------------------------------
int main(int argc,char* argv[])
{   char ifn[255];
    switch (argc) {
       case 1:                      //Prompt for the input file name
          cout << "Enter the input file name. ";
          cin >> ifn;
          break;
       case 2:                      //Read the input file name
          strcpy(ifn,argv[1]);
          break;
       default:
          exit(EXIT_FAILURE);
    }
	char inExt[] = {'s', 'a', 'p', '.'}; // assert that the input file is .pas
	for (int i = 0; i < 4; i++) {
		if (ifn[strlen(ifn)-i-1] != inExt[i]) {
			cout << "invalid file extension. use *.pas" << endl;
			exit(EXIT_FAILURE);
		}
	}
    FILE* i=fopen(ifn,"r");         //Open the input file
    char ofn[255];                  //make and name the output file
    strcpy(ofn, ifn);
    size_t ofnLength = strlen(ofn);
    int extPos = ofnLength-4;
    ofn[extPos] = '\0';
    char outExt[] = {'.', 't', 'r', 'c', '\0'};
    strcat(ofn, outExt);
    freopen(ofn,"w+",stdout);
    Parser par(i);
    par.Parse();
    cout << endl;
    //fclose(ofn);
    fclose(i);
    return 0;
}


