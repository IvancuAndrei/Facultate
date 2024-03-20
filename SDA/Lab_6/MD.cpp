#include "MD.h"
#include "IteratorMD.h"
#include <exception>
#include <iostream>

using namespace std;

//returneaza hashCode-ul unui element
int hashFct(TCheie e) {
    return abs(e);
}

Nod::Nod(TElem e, PNod urm) {
    this->e = e;
    this->urm = urm;
}

int MD::d(TCheie e) const {
    return hashFct(e) % m;
}



MD::MD() { //O(m)
    m = 10;
    urm = new int[MAX];
    nrElem = 0;

    //initializez listele inlantuite ca fiind vide
    for (int i = 0; i < m; i++) {
        this->keys.push_back(nullptr);
    }
}


void MD::adauga(TCheie c, TValoare v) {
    //O(n) unde n e numarul de elemente din lista de la locatia key din tabela de dispersie
    int key = this->d(c);
    TElem e = make_pair(c, v);
    PNod value = new Nod(e, nullptr);
    if (keys[key] == nullptr) { //daca e prima valoare de la locatia key din tabela de dispersie
        keys[key] = value;
        nrElem++;
        return;
    }
    PNod p = keys[key];
    while (p->urm != nullptr) {
        p = p->urm;
    }
    p->urm = value;
    nrElem++;
}


bool MD::sterge(TCheie c, TValoare v) {
    int key = d(c);
    if (keys[key] == nullptr) {
        return false;
    }
    if (keys[key]->e.first == c && keys[key]->e.second == v) {
        keys[key] = keys[key]->urm;
        nrElem--;
        return true;
    }
    PNod p = keys[key];
    PNod ant = p;
    p = p->urm;
    while (p != nullptr) {
        if (p->e.first == c && p->e.second == v) {
            ant->urm = p->urm;
            nrElem--;
            return true;
        }
        ant = p;
        p = p->urm;
    }
    return false;
}


vector<TValoare> MD::cauta(TCheie c) const {
    //O(n) unde n e numarul de elemente de la locatia key din tabela de dispersie
    int key = d(c);
    if (keys[key] == nullptr) {
        return vector<TValoare>();
    }
    PNod p = keys[key];
    vector<TValoare> res;
    while (p != nullptr) {
        if (p->e.first == c) {
            res.push_back(p->e.second);
        }
        p = p->urm;
    }
    return res;
}


int MD::dim() const {
    return nrElem;
}


bool MD::vid() const {
    for (int i = 0; i < m; i++) {
        if (keys[i] != nullptr) {
            return false;
        }
    }
    return true;
}

IteratorMD MD::iterator() const {
    return IteratorMD(*this);
}

MD::~MD() {}

