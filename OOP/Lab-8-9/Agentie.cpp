#include "Agentie.h"
#include <functional>
#include <algorithm>


vector<Oferta> Agentie::generalSort(bool(*maiMicF)(const Oferta&, const Oferta&)) {
    vector<Oferta> v{ rep->getAll() };
    for (size_t i = 0; i < v.size(); i++) {
        for (size_t j = i + 1; j < v.size(); j++) {
            if (!maiMicF(v[i], v[j])) {
                Oferta aux = v[i];
                v[i] = v[j];
                v[j] =  aux;
            }
        }
    }
    return v;}

void Agentie::addOferta(const string& denumire, const string& destinatie, const string& tip, int pret) {
    Oferta o{ denumire, destinatie, tip, pret };
    val.validateOferta(o);
    rep->addOferta(o);
    undoActions.push_back(std::make_unique<UndoAdauga>(rep, o));
}

void Agentie::popOferta(const string& denumire) {
    Oferta o{denumire, "a", "a", 12};
    val.validateOferta(o);
    rep->popOferta(denumire);
    undoActions.push_back(std::make_unique<UndoSterge>(rep,o));
}

void Agentie::modOferta(const string& denumire, const string& destinatie, const string& tip, const int pret) {
    Oferta o(denumire, destinatie, tip, pret);
    val.validateOferta(o);
    Oferta of = rep->find(denumire);
    undoActions.push_back(std::make_unique<UndoModifica>(rep, of));
    rep->modOferta(denumire, o);
}


vector<Oferta> Agentie::sortByDenumire() {
    return generalSort(cmpDenumire);
}


vector<Oferta> Agentie::sortByDestinatie() {
    return generalSort(cmpDestinatie);
}



vector<Oferta> Agentie::sortByTipPret() {
    return generalSort([](const Oferta&o1, const Oferta&o2) {
        if (o1.getTip() == o2.getTip()) {
            return o1.getPret() < o2.getPret();
        }
        return o1.getTip() < o2.getTip();
    });
}

vector<Oferta> Agentie::filtrareDestinatie(const string &destinatie) {
    vector<Oferta> rez;
    vector<Oferta> l = rep->getAll();
    for (const auto& o: l) {
        if (o.getDestinatie() == destinatie) {
            rez.push_back(o);
        }
    }
    return rez;}

vector<Oferta> Agentie::filtreaza(function<bool(const Oferta&)> const &fct) {
    vector<Oferta> rez;
    vector<Oferta> l = rep->getAll();
    for (const auto& o: l) {
        if (fct(o)) {
            rez.push_back(o);
        }
    }
    return rez;}

vector<Oferta> Agentie::filtrarePret(int pretMax) {
    return filtreaza([pretMax](const Oferta& o) {
        return o.getPret() < pretMax;
    });
}

void Agentie::undo(){
    if(undoActions.empty()){
        throw OfertaRepoException{"Nu mai exista operatii!\n"};
    }
    undoActions.back()->doUndo();
    undoActions.pop_back();
}