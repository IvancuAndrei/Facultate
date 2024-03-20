#include "RepoTeste.h"

void testAddOfertaRepo() {
    OfertaRepo all;

    all.addOferta(Oferta("denumire0", "dest0", "tip0", 100));
    assert(all.getAll().size() == 1);
    try {
        all.addOferta(Oferta("denumire0", "dest1", "tip1", 100)); assert(false);
    }
    catch (OfertaRepoException e){
        assert(true);
    }
    all.addOferta(Oferta("denumire1", "dest1", "tip1", 100));
    assert(all.getAll().size() == 2);
}

void testPopOfertaRepo() {
    OfertaRepo all;

    all.addOferta(Oferta("denumire0", "dest0", "tip0", 100));
    all.addOferta(Oferta("denumire1", "dest1", "tip1", 100));
    all.popOferta("denumire0");
    assert(all.getAll().size() == 1);
    try {
        all.popOferta("denumire0"); assert(false);
    }
    catch (OfertaRepoException e) {
        assert(true);
    }
    assert(all.getAll()[0].getDenumire() == "denumire1");
}

void testModOfertaRepo() {
    OfertaRepo all;

    all.addOferta(Oferta("denumire0", "dest0", "tip0", 100));
    all.addOferta(Oferta("denumire1", "dest1", "tip1", 100));
    all.modOferta("denumire1", Oferta("denumire1", "dest2", "tip2", 100));

    assert(all.getAll()[1].getDenumire() == "denumire1");
    assert(all.getAll()[1].getDestinatie() == "dest2");
    assert(all.getAll()[1].getTip() == "tip2");
    assert(all.getAll()[1].getPret() == 100);
    try {
        all.modOferta("denumire2", Oferta("denumire2", "dest2", "tip2", 100)); assert(false);
    }
    catch (OfertaRepoException e) {
        assert(true);
    }
}

void testAllRepo(){
    testAddOfertaRepo();
    testPopOfertaRepo();
    testModOfertaRepo();
}