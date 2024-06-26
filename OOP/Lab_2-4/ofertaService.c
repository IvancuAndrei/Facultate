#include <string.h>
#include <stdlib.h>
#include "oferta.h"
#include "ofertaRepo.h"
#include <stdio.h>
#include "listaOferte.h"


int adauga_oferta_service(listaOferte *o, int id, char *tip, char *destinatie, char *data_plecare, int pret){
    oferta *Oferta_noua = createOferta(id, tip, destinatie, data_plecare, pret);
    return(adauga_oferta(o, Oferta_noua));

}

int sterge_oferta_service(listaOferte *o, int id){
    oferta* Oferta_de_sters;
    int ok = 0;
    for(int i = 0; i < o->size; i++)
        if(o->lista[i]->id == id) {
            Oferta_de_sters = o->lista[i];
            ok = 1;
        }
    if(ok == 1) {
        sterge_oferta(o, Oferta_de_sters);
        return 0;}else return -1;

}

int modifica_oferta_service(listaOferte *o, int id, char *tip, char *destinatie, char *data_plecare, int pret){
    oferta *Oferta_noua = createOferta(id, tip, destinatie, data_plecare, pret);
    return(modifica_oferta(o, Oferta_noua));

}

void sortareDupaPretsiDestinatie(listaOferte *o, listaOferte *o_ordonat){
    for(int i = 0; i < o->size; i++)
        adauga_oferta(o_ordonat, o->lista[i]);
    for (int i = 0; i < o_ordonat->size - 1; i++)
        for (int j = 0; j < o_ordonat->size - i - 1; j++)
            if (o_ordonat->lista[j]->pret > o_ordonat->lista[j + 1]->pret){
                oferta *aux = o_ordonat->lista[j];
                o_ordonat->lista[j] = o_ordonat->lista[j+1];
                o_ordonat->lista[j+1]=aux;
            }
            else if(o_ordonat->lista[j]->pret == o_ordonat->lista[j+1]->pret){
                if(strcmp(o_ordonat->lista[j]->destinatie, o_ordonat->lista[j+1]->destinatie) > 0){
                    oferta *aux = o_ordonat->lista[j];
                    o_ordonat->lista[j] = o_ordonat->lista[j+1];
                    o_ordonat->lista[j+1]=aux;
                }
            }
}

void filtrareDupaCriteriu(listaOferte *o, listaOferte *o_filtrata, char *criteriu, char *argument){
    if(strcmp(criteriu, "destinatie") == 0){
        for(int i = 0; i < o->size; i++)
            if(strcmp(o->lista[i]->destinatie, argument) == 0)
                adauga_oferta(o_filtrata, o->lista[i]);
    }
    else if (strcmp(criteriu, "tip") == 0){
        for(int i = 0; i < o->size; i++)
            if(strcmp(o->lista[i]->tip, argument) == 0)
                adauga_oferta(o_filtrata, o->lista[i]);
    }
    else if(strcmp(criteriu, "pret") == 0){
        int pret = atoi(argument);
        for(int i = 0; i < o->size; i++)
            if(o->lista[i]->pret <= pret)
                adauga_oferta(o_filtrata, o->lista[i]);

    }
}




