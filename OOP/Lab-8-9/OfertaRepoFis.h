#pragma once
#include "OfertaRepo.h"

#include <iostream>
#include <sstream>
#include <fstream>

using std::ostream;
using std::stringstream;
using std::getline;

class OfertaRepoFis : public OfertaRepo{
private:
    string nume_fisier;
    void save_file();
    void load_file();
public:

    OfertaRepoFis(string nume_fisier) : OfertaRepo(), nume_fisier{nume_fisier} {}

    void addOferta(const Oferta& o) override;

    void popOferta(const string& denumire) override;

    void modOferta(const string& denumire, const Oferta& OfertaNoua) override;


};