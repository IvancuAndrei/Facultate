#include "CosService.h"

const vector<Oferta>& CosService::getAll() const {
    return cRepo.getAll();
}

void CosService::addOferta(const string denumire) {
    Oferta o{denumire, "a", "a", 12};
    val.validateOferta(o);
    const vector<Oferta>& oList = oRepo.getAll();
    const auto& found = std::find_if(oList.begin(), oList.end(), [&](const Oferta& oferta) {
        return oferta.getDenumire() == denumire;
    });

    if (found != oList.end()) {
        cRepo.addOferta(*found);
        return; } throw OfertaRepoException("Denumire inexistenta!\n"); }

void CosService::emptyCos() {
    cRepo.emptyCos();
}

void CosService::exportCos(const string& fileName) const {
    cRepo.exportCos(fileName);
}

void CosService::generateCos(const int n) {
    const vector<Oferta>& oList = oRepo.getAll();
    vector<Oferta> tempList(oList.begin(), oList.end());
    cRepo.emptyCos();

    std::random_device rd;
    std::mt19937 g(rd());
    std::shuffle(tempList.begin(), tempList.end(), g);

    int i = 0;
    for (const auto& oferta : tempList) {
        if (i == n)
            break;
        cRepo.addOferta(oferta);
        i += 1;
    }
}

map <string, vector<Oferta>> CosService::typeOfCos()  {
    map<string, vector<Oferta>> typeMap;
    const vector<Oferta>& cList = cRepo.getAll();
    for (const auto& o : cList) {
        typeMap[o.getTip()].push_back(o);
    }
    return typeMap;


}

