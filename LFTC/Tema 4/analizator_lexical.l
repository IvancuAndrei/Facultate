%{
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "BST.h"
#include "bison-parser.tab.h"

#define MAX_ELEM 100000


typedef struct {
	int codAtom;
	int pozitieTS;
}FIP;

int lenFIP = 0;
FIP fip[MAX_ELEM];
struct TreeNode *tsid;
struct TreeNode *tsc;

int currentLine = 1;

void addToFIP(int codAtom, int pozitieTS) {
	fip[lenFIP].codAtom = codAtom;
	fip[lenFIP].pozitieTS = pozitieTS;
	lenFIP++;
}


void printFIP(FILE *file) {
	for (int i = 0; i < lenFIP; i++)
		fprintf(file, "%d  |  %d\n", fip[i].codAtom, fip[i].pozitieTS);
}
%}

%option noyywrap

DIGIT           [0-9]
LETTER          [a-zA-Z]

%%

"<"                                 {addToFIP(2, -1); return LT;}

">"                                 {addToFIP(3, -1); return GT;}

"<="                                {addToFIP(4, -1); return LE;}

">="                                {addToFIP(5, -1);  return GE;}

"=="                                {addToFIP(6, -1);  return EQ;}

"!="                                {addToFIP(7, -1);  return NE;}

"+"                                 {addToFIP(8, -1);  return PLUS;}

"-"                                 {addToFIP(9, -1);  return MINUS;}

"*"                                 {addToFIP(10, -1); return MUL;}

"/"                                 {addToFIP(11, -1);  return DIV;}

"="                                 {addToFIP(12, -1);  return ASSIGN;}

"%"                                 {addToFIP(13, -1);  return MOD;}

"&&"                                {addToFIP(14, -1);  return AND;}

"||"                                {addToFIP(15, -1);  return OR;}

","                                 {addToFIP(16, -1);  return COMMA;}

";"                                 {addToFIP(17, -1);  return SEMICOLON;}

"{"                                 {addToFIP(18, -1);  return LBRACE;}

"}"                                 {addToFIP(19, -1);  return RBRACE;}

"("                                 {addToFIP(20, -1);  return LPAREN;}

")"                                 {addToFIP(21, -1);  return RPAREN;}

"<<"                                {addToFIP(22, -1);  return LEFT_SHIFT;}

">>"                                {addToFIP(23, -1);  return RIGHT_SHIFT;}

"struct"                            {addToFIP(24, -1);  return STRUCT;}

"cin"                               {addToFIP(25, -1); return CIN;}

"cout"                              {addToFIP(26, -1); return COUT;}

"if"                                {addToFIP(27, -1); return IF;}

"int"                               {addToFIP(28, -1); return INT;}

"double"                            {addToFIP(29, -1); return DOUBLE;}
 
"float"                             {addToFIP(30, -1); return FLOAT; }

"while"                             {addToFIP(31, -1); return WHILE;}

"for"                               {addToFIP(32, -1); return FOR;}

"else"                              {addToFIP(32, -1); return ELSE;}

"endl"                              {addToFIP(33, -1); return ENDL;}

([+-]?{DIGIT}+([.]{DIGIT}+)?)       {
	int index = getIndexRecursive(tsc, yytext, 0);
	if(index == -1)
	{
		tsc = insertRecursive(tsc, yytext); 
		index = getIndexRecursive(tsc, yytext, 0);
	}
	addToFIP(1, index);
	
	return CONST;
	
}	

{LETTER}+                           {
	if (yyleng > 99) {
        printf("Error: Length of yytext exceeds 99 characters\n");
	}

	int index = getIndexRecursive(tsid, yytext, 0);
	if(index == -1)
	{
		tsid = insertRecursive(tsid, yytext); 
		index = getIndexRecursive(tsid, yytext, 0);
	}
	addToFIP(0, index);
	
	return ID;
}
	
[\n]   { currentLine++; }

[ \t\r]+ ;

. { printf("Error on line %d. Unrecognized character: %s\n", currentLine, yytext); }

