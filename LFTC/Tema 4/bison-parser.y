%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "BST.h"

#define PROGRAM_PATH "/mnt/d/Facultate - Github/Facultate/LFTC/Tema 4/program.txt"
#define FIP_PATH "/mnt/d/Facultate - Github/Facultate/LFTC/Tema 4/FIP.txt"
#define TSID_PATH "/mnt/d/Facultate - Github/Facultate/LFTC/Tema 4/TSID.txt"
#define TSC_PATH "/mnt/d/Facultate - Github/Facultate/LFTC/Tema 4/TSC.txt"

extern int yylex();
extern int yyparse();
extern void printFIP();
extern struct TreeNode *initializeTree();
extern void inorderRecursivePrint();

extern int currentLine;
extern struct TreeNode *tsid, *tsc;
extern FILE* yyin;


void yyerror(const char* s);

%}

%token INT FLOAT STRUCT DOUBLE
%token LPAREN RPAREN LBRACE RBRACE COMMA SEMICOLON RIGHT_SHIFT LEFT_SHIFT
%token ASSIGN 
%left PLUS MINUS MUL DIV MOD AND OR
%left NE EQ LT GT LE GE
%token CIN COUT WHILE IF FOR ELSE ENDL 
%token CONST ID
%token UNKNOWN

%%

program: LBRACE declarations instructions RBRACE
       ;

declarations: declarations declarations
            | declaration 
            ;

declaration: type list_var SEMICOLON
           ;

type: INT 
    | DOUBLE 
    | FLOAT 
    | decl-pred
    ;


decl-pred: STRUCT LBRACE declarations RBRACE  
         ;

list_var: ID  
        | ID COMMA list_var 
        ;

instructions: instruction 
            | instruction instructions
            ;

instruction : atribuire 
            | io 
            | cond 
            | rep
            ;

atribuire: ID ASSIGN expr SEMICOLON
         ;

expr: CONST
    | ID
    | expr op expr
    ;

op: PLUS 
  | MINUS 
  | DIV 
  | MOD 
  | MUL 
  | AND
  | OR
  ;

io: CIN RIGHT_SHIFT ID SEMICOLON 
  | COUT LEFT_SHIFT expr LEFT_SHIFT ENDL SEMICOLON
  ;

cond: IF LPAREN cerinta RPAREN LBRACE instructions RBRACE
    | IF LPAREN cerinta RPAREN LBRACE instructions RBRACE ELSE instructions
    | IF LPAREN cerinta RPAREN LBRACE instructions RBRACE ELSE IF cond
    ;

cerinta: ID comp expr
       ;

rep: FOR LPAREN ID ASSIGN expr SEMICOLON cerinta SEMICOLON ID ASSIGN expr RPAREN LBRACE instructions RBRACE
    | FOR LPAREN ID ASSIGN expr SEMICOLON cerinta SEMICOLON ID ASSIGN expr RPAREN instructions
    | WHILE LPAREN cerinta RPAREN LBRACE instructions RBRACE
    ;

comp: LT
    | GT
    | LE
    | GE
    | EQ
    | NE
    ;

%%

void yyerror(const char* s) {
    fprintf(stderr, "Syntax error on line %d\n", currentLine);
    exit(EXIT_FAILURE);
}

int main(int argc, char** argv) {
    
	
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

    yyparse();

	inorderRecursivePrint(tsid, tsidFile);
    inorderRecursivePrint(tsc, tscFile);
	printFIP(fipFile);

    fclose(fipFile);
    fclose(tscFile);
    fclose(tsidFile);
}