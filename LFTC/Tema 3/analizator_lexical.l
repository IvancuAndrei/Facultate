%{
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "BST.h"

#define MAX_ELEM 100000
#define PROGRAM_PATH "/mnt/d/Facultate - Github/Facultate/LFTC/Tema 3/program.txt"
#define FIP_PATH "/mnt/d/Facultate - Github/Facultate/LFTC/Tema 3/FIP.txt"
#define TSID_PATH "/mnt/d/Facultate - Github/Facultate/LFTC/Tema 3/TSID.txt"
#define TSC_PATH "/mnt/d/Facultate - Github/Facultate/LFTC/Tema 3/TSC.txt"

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
ID              {LETTER}+
KEYWORD         struct|cin|cout|if|int|float|double|while|for|else|endl|cattimp|executa|sfcattimp|repeta|panacand|sfrepeta|then|endif|daca|atunci|sfdaca
OPERATOR        "=="|"+"|"-"|"/"|"*"|"%"|"<="|">="|"<"|">"|"!="|"="|"||"|"&&"
SEPARATOR       ";"|"{"|"}"|"("|")"|"<<"|">>"|","
CONST           {DIGIT}|[1-9]{DIGIT}+|{DIGIT}"."{DIGIT}{DIGIT}*|-{DIGIT}|-[1-9]{DIGIT}+|-{DIGIT}"."{DIGIT}{DIGIT}*
%%

{KEYWORD} {
	int codAtom = -1;
	if (strcmp("struct", yytext) == 0) codAtom = 22;
	if (strcmp("cin", yytext) == 0) codAtom = 23;
	if (strcmp("cout", yytext) == 0) codAtom = 24;
	if (strcmp("if", yytext) == 0) codAtom = 25;
	if (strcmp("int", yytext) == 0) codAtom = 26;
	if (strcmp("double", yytext) == 0) codAtom = 27;
	if (strcmp("float", yytext) == 0) codAtom = 28;
	if (strcmp("while", yytext) == 0) codAtom = 29;
	if (strcmp("for", yytext) == 0) codAtom = 30;
	if (strcmp("else", yytext) == 0) codAtom = 31;
    if (strcmp("endl", yytext) == 0) codAtom = 32;
	if (strcmp("cattimp", yytext) == 0) codAtom = 35;
	if (strcmp("sfcattimp", yytext) == 0) codAtom = 36;
	if (strcmp("repeta", yytext) == 0) codAtom = 37;
	if (strcmp("panacand", yytext) == 0) codAtom = 38;
	if (strcmp("sfrepeta", yytext) == 0) codAtom = 39;
	if (strcmp("then", yytext) == 0) codAtom = 40;
	if (strcmp("endif", yytext) == 0) codAtom = 41;
	if (strcmp("daca", yytext) == 0) codAtom = 42;
	if (strcmp("atunci", yytext) == 0) codAtom = 43;
	if (strcmp("sfdaca", yytext) == 0) codAtom = 44;

	addToFIP(codAtom, -1);
}

{ID} {
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
}

{CONST} {
	int index = getIndexRecursive(tsc, yytext, 0);
	if(index == -1)
	{
		tsc = insertRecursive(tsc, yytext); 
		index = getIndexRecursive(tsc, yytext, 0);
	}
	addToFIP(1, index);
}


{OPERATOR} {
	int codAtom = -1;
	if (strcmp("<", yytext) == 0) codAtom = 2;
	if (strcmp(">", yytext) == 0) codAtom = 3;
	if (strcmp("<=", yytext) == 0) codAtom = 4;
	if (strcmp(">=", yytext) == 0) codAtom = 5;
	if (strcmp("==", yytext) == 0) codAtom = 6;
	if (strcmp("!=", yytext) == 0) codAtom = 7;
	if (strcmp("+", yytext) == 0) codAtom = 8;
	if (strcmp("-", yytext) == 0) codAtom = 9;
	if (strcmp("*", yytext) == 0) codAtom = 10;
	if (strcmp("/", yytext) == 0) codAtom = 11;
	if (strcmp("=", yytext) == 0) codAtom = 12;
	if (strcmp("%", yytext) == 0) codAtom = 13;
    if (strcmp("&&", yytext) == 0) codAtom = 14;
    if (strcmp("||", yytext) == 0) codAtom = 15;
    
	addToFIP(codAtom, -1);
}

{SEPARATOR} {
	int codAtom = -1;
	if (strcmp(",", yytext) == 0) codAtom = 16;
	if (strcmp(";", yytext) == 0) codAtom = 17;
	if (strcmp("{", yytext) == 0) codAtom = 18;
	if (strcmp("}", yytext) == 0) codAtom = 19;
	if (strcmp("(", yytext) == 0) codAtom = 20;
	if (strcmp(")", yytext) == 0) codAtom = 21;
	if (strcmp("<<", yytext) == 0) codAtom = 33;
	if (strcmp(">>", yytext) == 0) codAtom = 34;

	addToFIP(codAtom, -1);
}

[\n] {
	currentLine++;
}

[ \t\r]+ ;

. {
	printf("Error on line %d. Unrecognized character: %s\n", currentLine, yytext);
}

%% 
int main(int argc, char **argv)  
{ 
	printf("ABCACSAC\n");
	
	yyin = fopen(PROGRAM_PATH, "r");
    if (yyin == NULL) {
        printf("Error opening input file!\n");
        return 1;
    }

    FILE *fipFile = fopen(FIP_PATH, "w");
    if (fipFile == NULL) {
        printf("Error opening FIP file!\n");
        return 1;
    }

    FILE *tscFile = fopen(TSC_PATH, "w");
    if (tscFile == NULL) {
        printf("Error opening TSC file!\n");
        return 1;
    }

    FILE *tsidFile = fopen(TSID_PATH, "w");
    if (tsidFile == NULL) {
        printf("Error opening TSID file!\n");
        return 1;
    }


    tsid = initializeTree();
    tsc = initializeTree();

    yylex();

	inorderRecursivePrint(tsid, tsidFile);
    inorderRecursivePrint(tsc, tscFile);
	printFIP(fipFile);

    fclose(fipFile);
    fclose(tscFile);
    fclose(tsidFile);
}