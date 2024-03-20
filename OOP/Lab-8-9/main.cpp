#include "presentation.h"
#include "Agentie.h"
#include "OfertaRepo.h"
#include "validator.h"
#include "OfertaTeste.h"
#include "RepoTeste.h"
#include "ServiceTeste.h"
#include "TesteValidator.h"
#include "CosRepo.h"
#include "CosService.h"
#include "OfertaRepoFis.h"

void adaugaCateva(Agentie& ctr) {
    ctr.addOferta("a", "zz","qqq", 10);
    ctr.addOferta("b", "aa","eee", 100);
    ctr.addOferta("z", "cc","ttt", 50);
    ctr.addOferta("c", "bb","qqq", 70);
}



void testAll() {
    testOferta();
    testAllRepo();
    testAllService();
    testValidator();
}



int main() {
    testAll();

    OfertaRepoFis repoFis{"oferte.txt"};
    OfertaRepo rep;
    CosRepo cRep;
    OfertaValidator val;
    Agentie ctr{&repoFis ,val };
    CosService cServ{rep, cRep, val};
    adaugaCateva(ctr);
    ConsoleUI ui{ ctr, cServ };
    ui.start();

}