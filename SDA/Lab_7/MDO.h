#pragma once

#include <vector>

typedef int TCheie;
typedef int TValoare;

#include <utility>
typedef std::pair<TCheie, TValoare> TElem;

using namespace std;

class IteratorMDO;

typedef bool(*Relatie)(TCheie, TCheie);

class nod {
public:
    TElem values;
    int heightLeft;
    int heightRight;
    nod* minim;
    nod* up;
    nod* left;
    nod* right;
    Relatie rel;
    nod(Relatie r, TElem val);

    bool operator<=(const nod a);
};

class MDO {
    friend class IteratorMDO;
private:
    /* aici e reprezentarea */
    nod* parent;

    int nrElems;
    Relatie rel;
    //cauta locul valorilor din variabila value
    //si le pune in locul potrivit
    nod* adaugaRec(nod* par, TElem value);
    //pune in aux toate nodurile de cheie c gasite
    void cauta_rec(nod* par, TCheie c, vector<nod*>& aux) const;
    //sterge nodul pasat ca parametru
    void sterge_rec(nod* to_delete);
    //returneaza urmatorul nod, ca valoare, din arbore
    nod* urmator(nod* present)const;

    //functie pentru destructor
    //distruge recursiv clasa
    void destructor_rec(nod* par);
public:

    // constructorul implicit al MultiDictionarului Ordonat
    MDO(Relatie r);

    // adauga o pereche (cheie, valoare) in MDO

    void adauga(TCheie c, TValoare v);

    //cauta o cheie si returneaza vectorul de valori asociate

    vector<TValoare> cauta(TCheie c) const;

    //sterge o cheie si o valoare
    //returneaza adevarat daca s-a gasit cheia si valoarea de sters

    bool sterge(TCheie c, TValoare v);

    //returneaza numarul de perechi (cheie, valoare) din MDO

    int dim() const;

    //verifica daca MultiDictionarul Ordonat e vid

    bool vid() const;

    // se returneaza iterator pe MDO
    // iteratorul va returna perechile in ordine in raport cu relatia de ordine
    IteratorMDO iterator() const;

    // destructorul
    ~MDO();

    int adaugaInexistente(MDO& mdo);

};