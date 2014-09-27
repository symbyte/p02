//-------------------------------------------------------------------
//File p02.cpp contains functions that process command line arguments
//and interface with the lex-generated scanner 
//--------------------------------------------------------------------
// Author: Steven Chambers                                           
// E-Mail: schambers4@uco.edu
// Author: Melicent King 
// E-mail: mking24@uco.edu	                                        
// Date:   October, 2014 
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
//--------------------------------------------------------------------
//Namespaces
//--------------------------------------------------------------------
using namespace std;
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
    Lexer lex(i);                    //Redirect the lexer to read the input
    for (;lex.Scan();)                         //file
    cout << endl;
    fclose(i);
    return 0;
}


