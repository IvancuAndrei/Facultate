#pragma once
#include <string>
#include <iostream>

using std::string;
using std::cout;

class Oferta{
    string denumire;
    string destinatie;
    string tip;
    int pret;
public:
    Oferta(const string dr, const string d, const string t, int p):denumire{dr},destinatie{d},tip{t},pret{p}{}

    Oferta(const Oferta& o):denumire{o.denumire},destinatie{o.destinatie},tip{o.tip},pret{o.pret}{}

    Oferta():denumire{""},destinatie{""},tip{""},pret{-1}{}

    string getDenumire() const{
        return denumire;
    }

    string getDestinatie() const{
        return destinatie;
    }

    string getTip() const{
        return tip;
    }

    int getPret() const noexcept{
        return pret;
    }
};

bool cmpDenumire(const Oferta& o1, const Oferta& o2);

bool cmpDestinatie(const Oferta& o1, const Oferta& o2);


