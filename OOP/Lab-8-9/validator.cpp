#include "validator.h"
#include <sstream>

void OfertaValidator::validateOferta(const Oferta& o) {
    vector<string> msgs;
    if (o.getPret() < 0) msgs.push_back("Pret negativ!!!");
    if (o.getTip().size() == 0) msgs.push_back("Tip vid!!!");
    if (o.getDestinatie().size() == 0) msgs.push_back("Destinatie vida!!!");
    if (o.getDenumire().size() == 0) msgs.push_back("Denumire vida!!!");
    if (msgs.size() > 0) {
        throw ValidateException(msgs);
    }
}

ostream& operator<<(ostream& out, const ValidateException& ex) {
    for (const auto& msg : ex.msgs) {
        out << msg<<" ";
    }
    return out;
}

