%{
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "parser.tab.h"

#define YY_DECL int yylex()

int currentLine = 0;


%}

%option noyywrap

DIGIT           [0-9]
LETTER          [a-zA-Z]

%%


"+"                                 {yylval.value = strdup(yytext); return PLUS;}

"-"                                 {yylval.value = strdup(yytext); return MINUS;}

"*"                                 {yylval.value = strdup(yytext); return MUL;}

"/"                                 {yylval.value = strdup(yytext); return DIV;}

"="                                 {return ASSIGN;}

","                                 {return COMMA;}

";"                                 {return SEMICOLON;}

"{"                                 {return LBRACE;}

"}"                                 {return RBRACE;}

"<<"                                {return LEFT_SHIFT;}

">>"                                {return RIGHT_SHIFT;}

"cin"                               {return CIN;}

"cout"                              {return COUT;}

"int"                               {return INT;}

([+-]?{DIGIT})                      {yylval.value = strdup(yytext); return CONST;}	

{LETTER}+                           {yylval.value = strdup(yytext); return ID;}
	
[\n]   { currentLine++; }

[ \t\r]+ ;

. { printf("Error on line %d. Unrecognized character: %s\n", currentLine, yytext); }

%%