#pragma once

#include "Oferta.h"
#include "OfertaRepo.h"
#include <string>
#include <vector>
#include <memory>
#include "undo.h"

#include <functional>
#include "validator.h"

using std::vector;
using std::function;
using std::unique_ptr;

class Agentie {
    Repo* rep;
    OfertaValidator& val;

    vector<Oferta> generalSort(bool (*maiMicF)(const Oferta&, const Oferta&));

    vector<Oferta> filtreaza(function<bool(const Oferta&)> const &fct);

    std::vector<unique_ptr<ActiuneUndo>> undoActions;
public:
    Agentie(OfertaRepo* rep, OfertaValidator& val) :rep{ rep }, val{ val } {
    }

    Agentie(const Agentie& ot) = delete;

    const vector<Oferta>& getAll() noexcept {
        return rep->getAll();
    }

    void addOferta(const string& denumire, const string& destinatie, const string& tip, int price);

    void popOferta(const string& denumire);

    void modOferta(const string& denumire, const string& distanta, const string& tip, int pret);


    vector<Oferta> sortByDenumire();


    vector<Oferta> sortByDestinatie();



    vector<Oferta> sortByTipPret();


    vector<Oferta> filtrareDestinatie(const string& destinatie);


    vector<Oferta> filtrarePret(int pretMax);

    void undo();

};

