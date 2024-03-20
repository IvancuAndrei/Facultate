#pragma once
#include <fstream>
#include "OfertaRepo.h"

class CosRepo {
private:
    vector<Oferta> cList;

public:
    CosRepo() = default;

    CosRepo(const CosRepo& ot) = delete;

    const vector<Oferta>& getAll() const;

    void addOferta(const Oferta& o);

    void emptyCos();

    void exportCos(const string& fileName) const;
};