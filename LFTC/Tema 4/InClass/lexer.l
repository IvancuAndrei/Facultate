%{

#include "parser.tab.h"
#include <string.h>

int total_words = 0;
int limbaj_words = 0;

%}

%option noyywrap

LETTER          [a-zA-Z]

%%

{LETTER}*"limbaj"{LETTER}* {total_words++; limbaj_words++; return LIMBAJ;}

{LETTER}+ {total_words++; return WORD;}

[\n] ;

[ \t]+ ;

%%