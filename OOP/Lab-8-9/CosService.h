#pragma once
#include <algorithm>
#include <iostream>
#include <random>
#include <vector>
#include <map>
#include "CosRepo.h"
#include "validator.h"

using std::map;

class CosService {
private:
    OfertaRepo& oRepo;
    CosRepo& cRepo;
    OfertaValidator& val;

public:
    CosService(OfertaRepo& oRepo, CosRepo& cRepo, OfertaValidator& val) :
            oRepo{ oRepo },
            cRepo{ cRepo },
            val{ val }
    {}

    CosService(const CosService& ot) = delete;

    const vector<Oferta>& getAll() const;

    void addOferta(const string name);

    void emptyCos();

    void exportCos(const string& fileName) const;

    void generateCos(const int n);

    map<string, vector<Oferta>> typeOfCos();
};