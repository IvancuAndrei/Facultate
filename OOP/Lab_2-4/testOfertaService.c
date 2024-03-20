#include <assert.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "oferta.h"
#include "ofertaService.h"
#include "listaOferte.h"
#include "ofertaRepo.h"
#pragma warning(disable:4996)

void testAdaugaOfertaService() {
    listaOferte *o = createOList();

    assert(adauga_oferta_service(o, 1, "mare", "spania", "21.04", 100) == 0);

    assert(o->lista[0]->id == 1);
    assert(strcmp(o->lista[0]->tip, "mare") == 0);
    assert(strcmp(o->lista[0]->destinatie, "spania") == 0);
    assert(strcmp(o->lista[0]->data_plecare, "21.04") == 0);
    assert(o->lista[0]->pret == 100);
    deleteLista(o);
}

void testStergeOfertaService() {
    listaOferte *o = createOList();

    adauga_oferta_service(o, 1, "mare", "spania", "21.04", 100);
    assert(sterge_oferta_service(o, 1) == 0);
    assert(o->size == 0);
    deleteLista(o);
}

void testModificaOfertaService() {
    listaOferte *o = createOList();

    adauga_oferta_service(o, 1, "mare", "spania", "21.04", 100);
    assert(modifica_oferta_service(o, 1, "munte", "italia", "21.05", 150) == 0);
    assert(o->lista[0]->id == 1);
    assert(strcmp(o->lista[0]->tip, "munte") == 0);
    assert(strcmp(o->lista[0]->destinatie, "italia") == 0);
    assert(strcmp(o->lista[0]->data_plecare, "21.05") == 0);
    assert(o->lista[0]->pret == 150);
    deleteLista(o);
}

void testSortareDupaPretSiDestinatie() {
    listaOferte *o = createOList();

    adauga_oferta_service(o, 1, "mare", "spania", "22.04", 100);
    adauga_oferta_service(o, 2, "munte", "italia", "23.05", 100);
    adauga_oferta_service(o, 3, "mare", "turcia", "24.06", 50);

    listaOferte *o_sortat = createOList();
    sortareDupaPretsiDestinatie(o, o_sortat);
    assert(o_sortat->lista[0]->id == 3);
    assert(o_sortat->lista[1]->id == 2);
    assert(o_sortat->lista[2]->id == 1);
    deleteLista(o);
    free(o_sortat->lista);
    free(o_sortat);

}

void testFiltrareDupaCriteriu(){
    listaOferte *o = createOList();
    listaOferte *o_filtrat = createOList();

    adauga_oferta_service(o, 1, "mare", "spania", "21.02", 100);
    adauga_oferta_service(o, 2, "munte", "italia", "22.03", 150);
    adauga_oferta_service(o, 3, "mare", "turcia", "22.04", 300);

    char criteriu[25] = "tip";
    char argument[25] = "mare";

    filtrareDupaCriteriu(o, o_filtrat, criteriu, argument);
    assert(o_filtrat->size == 2);

    char criteriu1[25] = "destinatie";
    char argument1[25] = "spania";

    listaOferte *o_filtrat1 = createOList();
    filtrareDupaCriteriu(o, o_filtrat1, criteriu1, argument1);
    assert(o_filtrat1->size == 1);

    listaOferte *o_filtrat2 = createOList();
    char criteriu2[25] = "pret";
    char argument2[25] = "200";
    filtrareDupaCriteriu(o, o_filtrat2,  criteriu2, argument2);
    assert(o_filtrat2->size == 2);
    deleteLista(o);
    free(o_filtrat->lista);
    free(o_filtrat);
    free(o_filtrat1->lista);
    free(o_filtrat1);
    free(o_filtrat2->lista);
    free(o_filtrat2);


}
