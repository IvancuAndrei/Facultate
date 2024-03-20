#include "CosRepo.h"

const vector<Oferta>& CosRepo::getAll() const {
    return cList;
}

void CosRepo::addOferta(const Oferta& o) {
    for (const auto& oferta : cList)
        if (oferta.getDenumire() == o.getDenumire()) {
            throw OfertaRepoException("ID deja existent!\n");
        }

    cList.push_back(o);
}

void CosRepo::emptyCos() {
    cList.clear();
}

void CosRepo::exportCos(const string& fileName) const {
    const string fileNameCsv = fileName + ".csv";
    std::ofstream csvout(fileNameCsv);

    for (const auto& oferta : cList)
        csvout << "denumire: " << oferta.getDenumire() << ", destinatie: " << oferta.getDestinatie()  << ", tip: " << oferta.getTip() << ", pret: " << oferta.getPret() << "\n";

    csvout.close();
}