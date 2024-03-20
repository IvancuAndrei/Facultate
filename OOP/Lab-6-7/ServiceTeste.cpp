#include "ServiceTeste.h"
#include "validator.h"

void testAddOfertaService() {
    OfertaRepo all;
    OfertaValidator val;
    Agentie ctr(all, val);

    ctr.addOferta("denumire0", "dest0", "tip0", 100);
    assert(ctr.getAll()[0].getDenumire() == "denumire0");
}

void testPopOfertaService() {
    OfertaRepo all;
    OfertaValidator val;
    Agentie ctr(all,val);

    ctr.addOferta( "denumire0", "dest0", "tip0", 100);
    ctr.popOferta("denumire0");
    assert(ctr.getAll().size() == 0);
}

void testModOfertaService() {
    OfertaRepo all;
    OfertaValidator val;
    Agentie ctr(all,val);

    ctr.addOferta( "denumire0", "dest0", "tip0", 100);
    ctr.modOferta("denumire0", "dest1", "tip1", 100);
    assert(ctr.getAll()[0].getDestinatie() == "dest1");
}

void testSortAgentie() {
    OfertaRepo all;
    OfertaValidator val;
    Agentie ctr(all,val);
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

void testFilterAgentie() {
    OfertaRepo all;
    OfertaValidator val;
    Agentie ctr(all, val);

    ctr.addOferta( "denumire3", "dest0", "tip0", 100);
    ctr.addOferta( "denumire2", "dest1", "tip1", 200);
    ctr.addOferta( "denumire1", "dest1", "tip2", 150);
    ctr.addOferta( "denumire0", "dest3", "tip3", 500);
    vector<Oferta> oFilteredList = ctr.filtrareDestinatie("dest1");
    assert(oFilteredList.size() == 2);
    vector<Oferta> oFilteredList1 = ctr.filtrarePret(250);
    assert(oFilteredList1.size() == 3);
}

void testAllService(){
    testAddOfertaService();
    testPopOfertaService();
    testModOfertaService();
    testSortAgentie();
    testFilterAgentie();
}