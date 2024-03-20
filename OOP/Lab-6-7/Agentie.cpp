#include "Agentie.h"
#include <functional>
#include <algorithm>


Lista<Oferta> Agentie::generalSort(bool(*maiMicF)(const Oferta&, const Oferta&)) {
    Lista<Oferta> v{ rep.getAll() };
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
    rep.addOferta(o);
}

void Agentie::popOferta(const string& denumire) {
    Oferta o{denumire, "a", "a", 12};
    val.validateOferta(o);
    rep.popOferta(denumire);
}

void Agentie::modOferta(const string& denumire, const string& destinatie, const string& tip, const int pret) {
    Oferta o(denumire, destinatie, tip, pret);
    val.validateOferta(o);
    rep.modOferta(denumire, o);
}


Lista<Oferta> Agentie::sortByDenumire() {
    return generalSort(cmpDenumire);
}


Lista<Oferta> Agentie::sortByDestinatie() {
    return generalSort(cmpDestinatie);
}



Lista<Oferta> Agentie::sortByTipPret() {
    return generalSort([](const Oferta&o1, const Oferta&o2) {
        if (o1.getTip() == o2.getTip()) {
            return o1.getPret() < o2.getPret();
        }
        return o1.getTip() < o2.getTip();
    });
}

Lista<Oferta> Agentie::filtrareDestinatie(const string &destinatie) {
    Lista<Oferta> rez;
    Lista<Oferta> l = rep.getAll();
    for (int i = 0; i < l.size(); i++) {
        if (l[i].getDestinatie() == destinatie) {
            rez.push(l[i]);
        }
    }
    return rez;}

Lista<Oferta> Agentie::filtreaza(function<bool(const Oferta&)> const &fct) {
    Lista<Oferta> rez;
    Lista<Oferta> l = rep.getAll();
    for (int i = 0; i < l.size(); i++) {
        if (fct(l[i])) {
            rez.push(l[i]);
        }
    }
    return rez;}

Lista<Oferta> Agentie::filtrarePret(int pretMax) {
    return filtreaza([pretMax](const Oferta& o) {
        return o.getPret() < pretMax;
    });
}
