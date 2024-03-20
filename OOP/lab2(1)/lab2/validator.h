#ifndef LAB2_VALIDATOR_H
#define LAB2_VALIDATOR_H

#include "domain.h"
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#define VALIDATOR_OK 0
#define EROARE_COD 0x100
#define EROARE_NUME 0x200
#define EROARE_CONC 0x400
#define EROARE_CANT 0x800

// verific ca codul sa fie strict alfanumeric
// daca valoarea este invalida, returnez EROARE_COD
// altfel, returnez VALIDATOR_OK
int validate_cod(char*);

// verifica ca nume sa contina doar litere si spatii
// daca valoarea este invalida, returnez EROARE_NUME
// altfel, returnez VALIDATOR_OK
int validate_nume(char*);

// verific daca concentratia este sau nu un procent pozitiv
// daca valoarea este invalida, returnez EROARE_CONC
// altfel, returnez VALIDATOR_OK
int validate_concentratie(double);

// verific daca cantitatea e nr pozitiv
// daca valoarea este invalida, returnez EROARE_CANT
// altfel, returnez VALIDATOR_OK
int validate_cantitate(int);

// verific toate proprietatile medicamentului
// returnez un cod de eroare nenul daca exista erori
// sau SUCCESS daca nu exista
int validate_madicament(Medicament*);

#endif //LAB2_VALIDATOR_H
