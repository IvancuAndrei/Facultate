#include <assert.h>
#include <string.h>
#include "ofertaRepo.h"
#include "oferta.h"
#include <stdlib.h>
#pragma warning(disable:4996)

void testAdaugareOferta() {
    listaOferte *o = createOList();

    oferta* OfertaNoua = createOferta(1,"mare", "spania", "23.01",100);
    assert(adauga_oferta(o, OfertaNoua) == 0);

    assert(o->lista[0]->id == OfertaNoua->id);
    assert(strcmp(o->lista[0]->tip, OfertaNoua->tip) == 0);
    assert(strcmp(o->lista[0]->destinatie, OfertaNoua->destinatie) == 0);
    assert(strcmp(o->lista[0]->data_plecare, OfertaNoua->data_plecare) == 0);
    assert(o->lista[0]->pret == OfertaNoua->pret);


    oferta* AltaOferta = createOferta(1,"munte", "albania", "23.01",100);
    assert(adauga_oferta(o, AltaOferta) == -1);
    deleteLista(o);
}

void testStergereOferta() {
    listaOferte *o = createOList();

    oferta* OfertaNoua = createOferta(1, "mare", "spania", "21.01", 100);

    adauga_oferta(o, OfertaNoua);
    oferta* OfertaNoua2 = createOferta(2,"mare","spania","21.01",100);
    adauga_oferta(o, OfertaNoua2);

    assert(sterge_oferta(o, OfertaNoua) == 0);
    assert(o->size == 1);
    assert(sterge_oferta(o, OfertaNoua) == -1);
    deleteLista(o);

}

void testModificareOferta() {
    listaOferte *o = createOList();

    oferta* OfertaNoua = createOferta(1,"mare","spania","21.01", 100);

    oferta* OfertaMod = createOferta(1,"munte","italia","21.03",150);

    adauga_oferta(o, OfertaNoua);
    assert(modifica_oferta(o, OfertaMod) == 0);
    assert(o->lista[0]->id == OfertaMod->id);
    assert(strcmp(o->lista[0]->tip, OfertaMod->tip) == 0);
    assert(strcmp(o->lista[0]->destinatie, OfertaMod->destinatie) == 0);
    assert(strcmp(o->lista[0]->data_plecare, OfertaMod->data_plecare) == 0);
    assert(o->lista[0]->pret == OfertaMod->pret);

    oferta* OfertaMod2 = createOferta(2,"mare","spania","21.11",123);
    assert(modifica_oferta(o, OfertaMod2) == -1);
    deleteLista(o);
}

