#pragma once
#include "OfertaTeste.h"

void testOferta() {
    Oferta OfertaNoua("denumire", "dest", "tip", 100);

    assert(OfertaNoua.getDenumire() == "denumire");
    assert(OfertaNoua.getDestinatie() == "dest");
    assert(OfertaNoua.getTip() == "tip");
    assert(OfertaNoua.getPret() == 100);
}