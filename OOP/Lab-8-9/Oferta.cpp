#include "Oferta.h"

bool cmpDenumire(const Oferta& o1, const Oferta& o2){
    return o1.getDenumire() < o2.getDenumire();
}

bool cmpDestinatie(const Oferta& o1, const Oferta& o2){
    return o1.getDestinatie() < o2.getDestinatie();
}

bool Oferta::operator==(const Oferta& other) const {
    return denumire == other.denumire &&
           destinatie == other.destinatie &&
           tip == other.tip &&
           pret == other.pret;
}

ostream& operator<<(ostream& os, const Oferta& oferta) {
    os << "Denumire: " <<  oferta.denumire << " " << "Destinatie: " << oferta.destinatie << " " << "Tip: " << oferta.tip << " " << "Pret: " << oferta.pret;
    return os;
}