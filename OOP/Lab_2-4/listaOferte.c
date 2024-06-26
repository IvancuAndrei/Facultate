#include "listaOferte.h"
#include <stdlib.h>

listaOferte *createOList() {
    listaOferte *o = (listaOferte*) malloc(sizeof(listaOferte));
    if(o){
        o->size = 0;
        o->maxSize = 2;
        o->lista = (oferta**)malloc(sizeof(oferta) * o->maxSize);
    }

    return o;

}

void deleteLista(listaOferte *o){
    for(int i = 0; i < o->size; i++)
        deleteOferta(o->lista[i]);
    free(o->lista);
    free(o);
}