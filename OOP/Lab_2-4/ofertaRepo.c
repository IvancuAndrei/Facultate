#include "oferta.h"
#include <stdio.h>
#include <stdlib.h>
#include "listaOferte.h"

int adauga_oferta(listaOferte *o, oferta *OfertaNoua){
    for(int i = 0; i < o->size; i++)
        if(o->lista[i]->id == OfertaNoua->id){
            deleteOferta(OfertaNoua);
            return -1;
        }

    if(o->size == o->maxSize) {
        o->maxSize = o->maxSize * 2;
        oferta **auxO = (oferta **) malloc(sizeof(oferta) * o->maxSize);
        for (int i = 0; i < o->size; i++)
            auxO[i] = o->lista[i];
        free(o->lista);
        o->lista = auxO;
    }
    o->lista[o->size] = OfertaNoua;
    o->size++;
    return 0;

}

int modifica_oferta(listaOferte *o, oferta *OfertaNoua){
    for(int i = 0; i < o->size; i++)
        if(o->lista[i]->id == OfertaNoua->id) {
            deleteOferta(o->lista[i]);
            o->lista[i] = OfertaNoua;
            return 0;
        }
    deleteOferta(OfertaNoua);
    return -1;

}

int sterge_oferta(listaOferte *o, oferta *Oferta_de_sters){
    for(int i= 0; i < o->size; i++) {
        if (o->lista[i]->id == Oferta_de_sters->id) {
            deleteOferta(o->lista[i]);
            for (int j = i; j < o->size - 1; j++)
                o->lista[j] = o->lista[j + 1];
            o->size--;
            return 0;
        }
    }
        return -1;
}

