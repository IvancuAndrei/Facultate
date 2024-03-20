#include "OfertaRepo.h"
#include <iostream>
#include <sstream>

using std::ostream;
using std::stringstream;

void OfertaRepo::addOferta(const Oferta& o)
{
    if (exist(o)) {
        throw OfertaRepoException("Exista deja oferta :" + o.getDenumire() + " cu destinatia :" + o.getDestinatie());
    }
    all.push_back(o);
}

void OfertaRepo::popOferta(const string& denumire) {
    int i = 0;
    for (const auto& o : all) {
        if (o.getDenumire() == denumire) {
            all.erase(all.begin()+i);
            return;
        }
        i++;
    }

    throw OfertaRepoException("Denumire inexistenta!\n");
}

void OfertaRepo::modOferta(const string& denumire, const Oferta& OfertaNoua) {
    for (auto& o : all)
        if (o.getDenumire() == denumire) {
            o = OfertaNoua;
            return;
        }

    throw OfertaRepoException("Denumire inexistenta!\n");
}

bool OfertaRepo::exist(const Oferta& o) const{
    try {
        find(o.getDenumire());
        return true;
    }
    catch (OfertaRepoException& ) {
        return false;
    }
}

const Oferta& OfertaRepo::find(const string& denumire) const{
    for (const auto& o : all) {
        if (o.getDenumire() == denumire) {
            return o;
        }
    }
    throw OfertaRepoException("Nu exista oferta :" + denumire);
}

const vector<Oferta>& OfertaRepo::getAll() const noexcept{
    return all;
}


ostream& operator<<(ostream& out, const OfertaRepoException& ex) {
    out << ex.msg;
    return out;
}
