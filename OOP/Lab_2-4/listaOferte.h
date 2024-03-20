#include <stdio.h>
#include "oferta.h"
#pragma once

typedef struct {
    int size;
    int maxSize;
    oferta **lista; //

}listaOferte;

listaOferte* createOList();

void deleteLista(listaOferte *o);