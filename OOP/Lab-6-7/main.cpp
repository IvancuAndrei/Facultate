#include "presentation.h"
#include "Agentie.h"
#include "OfertaRepo.h"
#include "validator.h"
#include "OfertaTeste.h"
#include "RepoTeste.h"
#include "ServiceTeste.h"
#include "TesteValidator.h"


void adaugaCateva(Agentie& ctr) {
    ctr.addOferta("a", "zz","qqq", 10);
    ctr.addOferta("b", "aa","eee", 100);
    ctr.addOferta("z", "cc","ttt", 50);
    ctr.addOferta("c", "bb","vvv", 70);
}


/*
void testAll() {
    testOferta();
    testAllRepo();
    testAllService();
    testValidator();
}
*/


int main() {
    //testAll();

    OfertaRepo rep;
    OfertaValidator val;
    Agentie ctr{ rep,val };
    adaugaCateva(ctr);
    ConsoleUI ui{ ctr };
    ui.start();

}