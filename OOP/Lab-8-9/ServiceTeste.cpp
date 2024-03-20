#include "ServiceTeste.h"
#include "validator.h"

void testAddOfertaService() {
    OfertaRepo all;
    OfertaValidator val;
    Agentie ctr(&all, val);

    ctr.addOferta("denumire0", "dest0", "tip0", 100);
    assert(ctr.getAll()[0].getDenumire() == "denumire0");
}

void testPopOfertaService() {
    OfertaRepo all;
    OfertaValidator val;
    Agentie ctr(&all,val);

    ctr.addOferta( "denumire0", "dest0", "tip0", 100);
    ctr.popOferta("denumire0");
    assert(ctr.getAll().size() == 0);
}

void testModOfertaService() {
    OfertaRepo all;
    OfertaValidator val;
    Agentie ctr(&all,val);

    ctr.addOferta( "denumire0", "dest0", "tip0", 100);
    ctr.modOferta("denumire0", "dest1", "tip1", 100);
    assert(ctr.getAll()[0].getDestinatie() == "dest1");
}

void testSortOfertaService() {
    OfertaRepo all;
    OfertaValidator val;
    Agentie ctr(&all,val);
    vector<Oferta> oSortedList;

    ctr.addOferta( "denumire3", "dest2", "tip0", 100);
    ctr.addOferta( "denumire2", "dest0", "tip1", 200);
    ctr.addOferta( "denumire1", "dest1", "tip2", 200);
    ctr.addOferta( "denumire0", "dest3", "tip2", 500);
    oSortedList = ctr.sortByDenumire();
    assert(oSortedList[0].getDenumire() == "denumire0");
    assert(oSortedList[3].getDenumire() == "denumire3");
    oSortedList = ctr.sortByDestinatie();
    assert(oSortedList[0].getDenumire() == "denumire2");
    assert(oSortedList[3].getDenumire() == "denumire0");
    oSortedList = ctr.sortByTipPret();
    assert(oSortedList[0].getDenumire() == "denumire3");
    assert(oSortedList[3].getDenumire() == "denumire0");
}

void testFilterOfertaService() {
    OfertaRepo all;
    OfertaValidator val;
    Agentie ctr(&all, val);

    ctr.addOferta( "denumire3", "dest0", "tip0", 100);
    ctr.addOferta( "denumire2", "dest1", "tip1", 200);
    ctr.addOferta( "denumire1", "dest1", "tip2", 150);
    ctr.addOferta( "denumire0", "dest3", "tip3", 500);
    vector<Oferta> oFilteredList = ctr.filtrareDestinatie("dest1");
    assert(oFilteredList.size() == 2);
    vector<Oferta> oFilteredList1 = ctr.filtrarePret(250);
    assert(oFilteredList1.size() == 3);
}

void testAddOfertaCosService() {
    OfertaRepo oRepo;
    CosRepo cRepo;
    OfertaValidator val;
    CosService cService(oRepo, cRepo, val);

    oRepo.addOferta(Oferta("nume0", "dest0", "tip0", 100));
    oRepo.addOferta(Oferta("nume1", "dest1", "tip1", 200));
    cService.addOferta("nume1");
    assert(cService.getAll()[0] == Oferta( "nume1", "dest1", "tip1", 200));
}

void testEmptyCosService() {
    OfertaRepo oRepo;
    CosRepo cRepo;
    OfertaValidator val;
    CosService cService(oRepo, cRepo, val);

    oRepo.addOferta(Oferta("nume0", "dest0", "tip0", 100));
    oRepo.addOferta(Oferta( "nume1", "dest1", "tip1", 200));
    cService.addOferta("nume0");
    cService.addOferta("nume1");
    cService.emptyCos();
    assert(cService.getAll().size() == 0);
}

void testExportCosService() {
    OfertaRepo oRepo;
    CosRepo cRepo;
    OfertaValidator val;
    CosService cService(oRepo, cRepo, val);

    oRepo.addOferta(Oferta("nume0", "dest0", "tip0", 100));
    oRepo.addOferta(Oferta( "nume1", "dest1", "tip1", 200));
    cService.addOferta("nume0");
    cService.addOferta("nume1");
    cService.exportCos("test");
}

void testGenerateCosService() {
    OfertaRepo oRepo;
    CosRepo cRepo;
    OfertaValidator val;
    CosService cService(oRepo, cRepo, val);

    oRepo.addOferta(Oferta("nume0", "dest0", "tip0", 100));
    oRepo.addOferta(Oferta("nume1", "dest1", "tip1", 200));
    oRepo.addOferta(Oferta( "nume2", "dest2", "tip2", 300));
    cService.generateCos(2);
    assert(cService.getAll().size() == 2);
}

void testAllService(){
    testAddOfertaService();
    testPopOfertaService();
    testModOfertaService();
    testSortOfertaService();
    testFilterOfertaService();
    testAddOfertaCosService();
    testEmptyCosService();
    testExportCosService();
    testGenerateCosService();
}