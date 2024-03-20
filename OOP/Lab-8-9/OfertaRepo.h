#pragma once
#include "Oferta.h"
#include <vector>
#include <string>
#include <ostream>

using std::vector;
using std::string;
using std::ostream;
using std::exception;

class Repo{
protected:
    vector<Oferta> all;

public:

    virtual ~Repo() {}

    virtual void addOferta(const Oferta& o) =  0;

    virtual void popOferta(const string& denumire) = 0;

    virtual void modOferta(const string& denumire, const Oferta& OfertaNoua) = 0;

    virtual const Oferta& find(const string& denumire) const = 0;

    virtual const vector<Oferta>& getAll() const noexcept = 0;
};



class OfertaRepo : public Repo{
protected:
    bool exist(const Oferta& o) const;
public:
    OfertaRepo() = default;

    OfertaRepo(const OfertaRepo& ot) = delete;

    void addOferta(const Oferta& o) override;

    void popOferta(const string& denumire) override;

    void modOferta(const string& denumire, const Oferta& OfertaNoua) override;

    const Oferta& find(const string& denumire) const override;

    const vector<Oferta>& getAll() const noexcept override;

};

class OfertaRepoException {
protected:
    string msg;
public:
    OfertaRepoException(string m) :msg{ m } {}

    friend ostream& operator<<(ostream& out, const OfertaRepoException& ex);
};

ostream& operator<<(ostream& out, const OfertaRepoException& ex);

