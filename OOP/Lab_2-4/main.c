#include "oferta.h"
#include "ui.h"
#include "ofertaService.h"
#include "ofertaRepo.h"
#include "testOfertaRepo.h"
#include "testOfertaService.h"
#pragma warning(disable:4996)

void testAll(){
    testAdaugareOferta();
    testStergereOferta();
    testModificareOferta();
    testAdaugaOfertaService();
    testStergeOfertaService();
    testModificaOfertaService();
    testSortareDupaPretSiDestinatie();
    testFiltrareDupaCriteriu();
}

int main() {
    testAll();
    listaOferte *o = createOList();
    run(o);

}
