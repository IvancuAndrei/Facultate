#ifndef LAB2_REPOSITORY_H
#define LAB2_REPOSITORY_H

#include <malloc.h>
#include "errors.h"
#include "domain.h"

typedef struct{
    int length;
    int capacity;
    void** elements;
    int (*elem_eq)(void*, void*);
} Repository;

// creez un repository vid de capacitate LENGTHMAX
Repository* repository_create(int (*)(void*, void*)); // constructor


// returneaza numarul de elemente dintr-un repo transmis ca parametru
int repository_get_length(Repository*); // getter nr de elemente

// returneaza capaitatea unui repo
int repository_get_capacity(Repository*); // getter capacitate

// returneaza elementul de tip Medicament de la pozitia index
// seteaza eroarea OUT_OF_RANGE daca index >= length sau index < 0
// returneaza NOT_FOUND daca nu exista
void* repository_get_element_at(Repository*, int); // indexer get


/**
 * repository: pointer catre un repo
 * length: lungimea noua
 * seteaza lungimea repo ului la length, eventual folosind realocare
 */
void repository_set_length(Repository*, int); // setter lungime
void repository_set_capacity(Repository*, int); // setter capacitate, realocare
/**
 * repository: pointer catre un repo
 * index: index-ul care va fi modificat repo
 * medicament: o instanta a structurii Medicament
 * seteaza eroarea OUT_OF_RANGE in cazul in care index >= length sau index < 0
 */
void repository_set_element_at(Repository*, int, void*); // indexer set

/**
 * repository: pointer catre un repo
 * medicament: o instanta a structurii Medicament
 * adauga medicamentul la sfarsitul repo-ului
 */
void repository_add(Repository*, void*); // append

// returnez pozitia pe care se afla un medicament
// NOT_FOUND daca nu exista
int repository_index_of(Repository*, void*); // find

/**
 * @param 1: repository
 * @param 2: index
 * @param 3: index
 * interschimb cei doi indecsi din repository
 * @throw: OUT_OF_RANGE error daca indecsii nu sunt valizi, caz in care repository-ul nu se modifica
 *         aceasta eroare trebuie curatata apoi cu CLEAR_ERRORS; pentru ca programul sa nu returneze o eroare
 */
void repository_swap(Repository*, int, int);

/**
 * @param 1: repository
 * @param 2: functie de sortare: int f(void* el1, void* el2, int reversed);
 * @param 3: valoarea lui reversed: REVERSED daca se doreste in ordine inversa
 *                                  NORMAL daca se doreste o ordine directa
 * sortez repository-ul dupa functia de comparare
 * sortare prin selectie directa
 * theta(n^2)
 */
void repository_sort(Repository*, int(*)(void*,void*,int), int);

/**
 * @param 1: repository
 * @param 2: o entitate de tipul celor din repository care retine datele de filtrare
 * @param 3: functia de filtrare: int f(void* el1, void* el2);
 * @return: repository-ul filtrat
 * filtrez repository-ul dupa functia de filtrare
 */
Repository* repository_filter(Repository*, void* filter_data, int (*)(void*,void*));

/** @note: nu se elibereaza elementele */
void repository_delete(Repository*); // destructor

Repository* copy_list(Repository* lista);

void adauga_pas_undo(Repository * undo_stiva, Repository * lista);

Repository* executa_pas_undo(Repository * undo_stiva, Repository * lista);



#endif //LAB2_REPOSITORY_H

