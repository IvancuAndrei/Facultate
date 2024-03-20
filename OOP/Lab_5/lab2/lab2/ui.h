#ifndef LAB2_UI_H
#define LAB2_UI_H

#include <stdio.h>
#include <stdlib.h>
#include "service.h"

void opt1(Service*, Repository*); // functionalitate adaugare medicament
void opt2(Service*, Repository*); // functionalitate actualizare nume si concentratie
void opt3(Service*, Repository*); // functionalitate stergere stoc la un medicament
void opt4(Service*); // functionalitate afisare medicamente in stoc
void opt5(Service*); // functionalitate sortare
void opt6(Service*, Repository*);
void menu(Service*, Repository*); // functia care ruleaza meniul

void medicament_print(Medicament*); // afiseaza un medicament pe ecran
Medicament* medicament_scan(); // citire date medicament de la tastatura, returneaza Medicamentul citit sau NULL daca citirea a esuat
void repo_print(Repository*); // afisez medicamentele in stoc
void print_errs(int); // afisez erorile corespunzatoare codurilor de eroare

#endif //LAB2_UI_H
