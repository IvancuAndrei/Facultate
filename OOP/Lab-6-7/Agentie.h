#pragma once

#include "Oferta.h"
#include "OfertaRepo.h"
#include <string>
#include <vector>

#include <functional>
#include "validator.h"

using std::vector;
using std::function;

class Agentie {
    OfertaRepo& rep;
    OfertaValidator& val;

    Lista<Oferta> generalSort(bool (*maiMicF)(const Oferta&, const Oferta&));

    Lista<Oferta> filtreaza(function<bool(const Oferta&)> const &fct);
public:
    Agentie(OfertaRepo& rep, OfertaValidator& val) :rep{ rep }, val{ val } {
    }

    Agentie(const Agentie& ot) = delete;

    const Lista<Oferta>& getAll() noexcept {
        return rep.getAll();
    }

    void addOferta(const string& denumire, const string& destinatie, const string& tip, int price);

    void popOferta(const string& denumire);

    void modOferta(const string& denumire, const string& distanta, const string& tip, int pret);


    Lista<Oferta> sortByDenumire();


    Lista<Oferta> sortByDestinatie();



    Lista<Oferta> sortByTipPret();


    Lista<Oferta> filtrareDestinatie(const string& destinatie);


    Lista<Oferta> filtrarePret(int pretMax);

};

