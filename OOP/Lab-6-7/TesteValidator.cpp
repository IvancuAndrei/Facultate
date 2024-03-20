#include "TesteValidator.h"

void testValidator() {
    OfertaValidator v;
    Oferta o{"", "","",-1 };
    try {
        v.validateOferta(o);
    }
    catch (const ValidateException & ex) {
        std::stringstream sout;
        sout << ex;
        auto mesaj = sout.str();
        assert(mesaj.find("negativ") >= 0);
        assert(mesaj.find("vid") >= 0);
    }

}