%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s) {
    fprintf(stderr, "Eroare: %s\n", s);
}

#define PROGRAM_PATH "/mnt/d/Facultate - Github/Facultate/LFTC/Tema 4/InClass/fisier.txt"

extern int yylex();
extern int yyparse();
extern FILE* yyin;

extern int total_words;
extern int limbaj_words;
%}

%token WORD LIMBAJ

%%

text: WORD
    | LIMBAJ
    | WORD text
    | LIMBAJ text

%%

int main(int argc, char** argv) {
    
	
	yyin = fopen(PROGRAM_PATH, "r");
    if (yyin == NULL) {
        printf("Error opening input file!\n");
        return 1;
    }

    yyparse();
    printf("Numărul total de cuvinte: %d\n", total_words);
    printf("Numărul de cuvinte din declinarea lui 'limbaj': %d\n", limbaj_words);
}