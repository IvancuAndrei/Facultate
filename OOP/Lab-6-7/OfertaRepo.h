#pragma once
#include "Oferta.h"
#include "Lista.h"
#include <vector>
#include <string>
#include <ostream>

using std::vector;
using std::string;
using std::ostream;
using std::exception;

class OfertaRepo {
    Lista<Oferta> all;
    //vector<Oferta> all;


    bool exist(const Oferta& o) const;
public:
    OfertaRepo() = default;

    OfertaRepo(const OfertaRepo& ot) = delete;

    void addOferta(const Oferta& o);

    void popOferta(const string& denumire);

    void modOferta(const string& denumire, const Oferta& OfertaNoua);

    const Oferta& find(const string& denumire) const;

    const Lista<Oferta>& getAll() const noexcept;

};

class OfertaRepoException {
    string msg;
public:
    OfertaRepoException(string m) :msg{ m } {}

    friend ostream& operator<<(ostream& out, const OfertaRepoException& ex);
};

ostream& operator<<(ostream& out, const OfertaRepoException& ex);

