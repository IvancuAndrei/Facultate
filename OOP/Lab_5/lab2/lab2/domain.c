#include <math.h>
#include "domain.h"

Medicament* medicament_create_default(){
    Medicament* medicament = malloc(sizeof(Medicament));
    medicament->cod = NULL;
    medicament->nume = NULL;
    medicament->concentratie = 0.0;
    medicament->cantitate = 0;
    return medicament;
}

Medicament* medicament_create(char* cod, char* nume, double concentratie, int cantitate){
    Medicament* medicament = malloc(sizeof(Medicament));
    if(cod==NULL) medicament->cod = NULL;
    else {
        medicament->cod = malloc(sizeof(char) * (strlen(cod) + 1));
        strcpy(medicament->cod, cod);
    }
    if(nume==NULL) medicament->nume = NULL;
    else {
        medicament->nume = malloc(sizeof(char) * (strlen(nume)+1));
        strcpy(medicament->nume, nume);
    }
    medicament->concentratie = concentratie;
    medicament->cantitate = cantitate;
    return medicament;
}

char* medicament_get_cod(Medicament* medicament){
    return medicament->cod;
}
char* medicament_get_nume(Medicament* medicament){
    return medicament->nume;
}
double medicament_get_concentratie(Medicament* medicament){
    return medicament->concentratie;
}
int medicament_get_cantitate(Medicament* medicament){
    return medicament->cantitate;
}

void medicament_set_cod(Medicament* medicament, char* cod){
    if(medicament->cod) free(medicament->cod);
    medicament->cod = malloc(sizeof(char)*(strlen(cod)+1));
    strcpy(medicament->cod, cod);
}
void medicament_set_nume(Medicament* medicament, char* nume){
    if(medicament->nume) free(medicament->nume);
    medicament->nume = malloc(sizeof(char)*(strlen(nume)+1));
    strcpy(medicament->nume, nume);
}
void medicament_set_concentratie(Medicament* medicament, double concentratie){
    medicament->concentratie = concentratie;
}
void medicament_set_cantitate(Medicament* medicament, int cantitate){
    medicament->cantitate = cantitate;
}

int medicament_eq(void* m1, void* m2){
    Medicament* medicament1 = (Medicament*)m1;
    Medicament* medicament2 = (Medicament*)m2;
    if(medicament1->cod == NULL || medicament2->cod == NULL) return medicament1->cod == medicament2->cod;
    if(strcmp(medicament1->cod, medicament2->cod) !=0) return 0;

    if(medicament1->nume == NULL || medicament2->cod == NULL) return medicament1->nume == medicament2->nume;
    if(strcmp(medicament1->nume, medicament2->nume) !=0) return 0;

    if(fabs(medicament1->concentratie-medicament2->concentratie)>=1e-6) return 0;
    return 1;
}

void medicament_sterge_stoc(Medicament* medicament){
    medicament->cantitate = 0;
}

int medicament_compare(void* medicament1, void* medicament2, int reversed){
    Medicament* m1 = medicament1, *m2 = medicament2;
    int cmpnume = strcmp(medicament_get_nume(m1), medicament_get_nume(m2));
    if(cmpnume<0) return -1*reversed;
    if(cmpnume>0) return 1*reversed;
    // altfel, numele sunt egale
    int cmpcant = medicament_get_cantitate(m1) - medicament_get_cantitate(m2);
    if(cmpcant<0) return -1*reversed;
    if(cmpcant>0) return 1*reversed;
    return EQUAL; // altfel, sunt egale
}

int filtru_nume(void* medicament, void* filtru){
    char c = medicament_get_nume(filtru)[0];
    return c == medicament_get_nume(medicament)[0];
}

int filtru_cantitate(void* medicament, void* filtru){
    return medicament_get_cantitate(medicament)<
            medicament_get_cantitate(filtru);
}

int filtru_concentratie(void* medicament, void* filtru){
    return medicament_get_concentratie(medicament) < medicament_get_concentratie(filtru);
}

void medicament_delete(Medicament* medicament)
{
    if(medicament->cod != NULL) free(medicament->cod);
    if(medicament->nume != NULL) free(medicament->nume);
    free(medicament);
    medicament=NULL;
}

Medicament * copiaza_medicament(Medicament * medicament)
{
    //Functia creaza o copie a unui medicament trimis ca paramametru
    Medicament * copie_medicament = medicament_create((*medicament).cod, (*medicament).nume, (*medicament).concentratie, (*medicament).cantitate);
    return copie_medicament;
}