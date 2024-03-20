#ifndef LAB2_DOMAIN_H
#define LAB2_DOMAIN_H

#include "string.h"
#include "stdlib.h"

// define-uri pentru citiri (UI)
#define LGMAX_COD 20+1
#define LGMAX_NUME 30+1

// valorile de retur ale functiei de comparare
#define LESS -1
#define EQUAL 0
#define GREATER 1

// valoarea de return a functiei de filtrare
#define INFILTER 1

// valorile date ca parametru la functia de comparare
#define REVERSED -1
#define NORMAL 1

typedef struct {
    char* cod;
    char* nume;
    double concentratie;
    int cantitate;
} Medicament;

// creez un medicament si il returnez(special pentru folosirea functionalitatii de filtru)
Medicament* medicament_create_default();
// creez un medicament cu datele date si il returnez
Medicament* medicament_create(char*, char*, double, int);

// copiaza codul medicamentului dat ca prim parametru in sirul cod
char* medicament_get_cod(Medicament*); // getter cod
// copiaza numele medicamentului dat ca prim parametru in sirul nume
char* medicament_get_nume(Medicament*); // getter nume
// returneaza concentratia medicamentului dat ca prim parametru
double medicament_get_concentratie(Medicament*); // getter concentratie
// returneaza nr de medicamente 'medicament' din stoc
int medicament_get_cantitate(Medicament*); // getter cantitate

// seteaza codul medicamentului dat ca prim parametru la sirul cod
void medicament_set_cod(Medicament*, char*); // setter cod
// seteaza numele medicamentului dat ca prim parametru la sirul nume
void medicament_set_nume(Medicament*, char*); // setter nume
// seteaza concentratia medicamentului dat ca prim parametru la al doilea parametru, concentratie
void medicament_set_concentratie(Medicament*, double); // setter concentratie
// seteaza cantitatea medicamentului dat ca prim parametru la al doilea parametru, cantitate
void medicament_set_cantitate(Medicament*, int); // setter cantitate

// verifica daca proprietatile celor 2 medicamente date au aceleasi campuri, exceptie facand cantitatea
// returneaza 1 daca medicamentele sunt egale si 0 altfel
int medicament_eq(void*, void*); // operator de egalitate
// sterg stocul, adica setez cantitatea la 0
void medicament_sterge_stoc(Medicament*); // sterg stocul

/**
 * @param 1: medicament
 * @param 2: medicament
 * @param 3: reversed
 *          NORMAL daca functia intoarce rezultatul asteptat
 *          REVERSED altfel
 * compar 2 pointeri la medicament dupa nume, lexicografic crescator
 * in caz de egalitate, compar dupa cantitate, crescator
 * @return LESS daca primul medicament e in ordine fata de al doilea
 *         EQUAL daca cele 2 medicamente sunt egale
 *         GREATER daca daca al doilea medicament e in ordine fata de primul
 */
int medicament_compare(void*, void*, int);

/**
 * verifica daca medicamentul are numele incepand cu prima litera din numele celui de-al doilea medicament
 * @pre: medicamentele sunt valide
 * @param 1: pointer catre un medicament, care va fi verificat
 * @param 2: pointer catre un medicament care contine informatie pentru filtru
 *           , restul valorilor avand valoarea default
 * @return INFILTER daca medicamentul respecta filtru
 *         !INFILTER altfel
 */
int filtru_nume(void*, void*);
/**
 * verifica daca medicamentul are cantitatea mai mica decat a celui de-al doilea medicament
 * @pre: medicamentul si informatia din filtru sunt valide
 * @param 1: pointer catre un medicament, care va fi verificat
 * @param 2: pointer catre un medicament care contine informatie pentru filtru
 *           , restul valorilor avand valoarea default
 * @return INFILTER daca medicamentul respecta filtru
 *         !INFILTER altfel
 */
int filtru_cantitate(void*, void*);

// eliberare memorie
void medicament_delete(Medicament*);

Medicament * copiaza_medicament(Medicament * medicament);

int filtru_concentratie(void* medicament, void* filtru);

#endif //LAB2_DOMAIN_H
