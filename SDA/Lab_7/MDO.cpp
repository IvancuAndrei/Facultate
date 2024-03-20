#include "IteratorMDO.h"
#include "MDO.h"
#include <iostream>
#include <vector>

#include <exception>
using namespace std;

nod::nod(Relatie r, TElem val) {
    rel = r;
    left = NULL;
    right = NULL;
    up = NULL;
    minim = this;
    heightLeft = 0;
    heightRight = 0;
    values = val;
}
bool nod::operator<=(nod a) {
    return rel(this->values.first, a.values.first);
}
MDO::MDO(Relatie r) {
    /* Theta(1) */
    parent = NULL;
    nrElems = 0;
    rel = r;
}


void MDO::adauga(TCheie c, TValoare v) {
    /*	Caz favorabil = Theta(1)
        Caz defavorabil = Theta(n)
        Caz mediu = Theta(n)
        Complexitate generala : O(n)*/

    parent = adaugaRec(parent, TElem(c, v));
    ++nrElems;
}

nod* MDO::adaugaRec(nod* par, TElem value) {
    if (par == NULL) {
        par = new nod(this->rel, value);
        return par;
    }
    if (rel(value.first, par->values.first)) {
        par->heightLeft++;
        par->left = adaugaRec(par->left, value);
        par->left->up = par;

        par->minim = par->left->minim;

    }
    else {
        par->heightRight++;
        par->right = adaugaRec(par->right, value);
        par->right->up = par;
    }
    return par;
}

void MDO::cauta_rec(nod* par, TCheie c, vector<nod*>& aux) const {
    if (par != NULL) {
        if (par->values.first == c) {
            aux.push_back(par);
            cauta_rec(par->left, c, aux);
            cauta_rec(par->right, c, aux);
        }
        else {
            if (rel(c, par->values.first)) {
                cauta_rec(par->left, c, aux);
            }
            else {
                cauta_rec(par->right, c, aux);
            }
        }
    }
}

vector<TValoare> MDO::cauta(TCheie c) const {
    /*	Caz favorabil = Theta(1)
        Caz defavorabil = Theta(n)
        Caz mediu = Theta(n)
        Complexitate generala : O(n)*/
    vector<nod*> aux;
    vector<TValoare> to_return;
    cauta_rec(parent, c, aux);
    for (vector<nod*>::iterator i = aux.begin(); i != aux.end(); ++i) {
        to_return.push_back((*i)->values.second);
    }

    return to_return;
}

nod* MDO::urmator(nod* present) const {
    nod* succ;
    nod* prec;
    if (present->right != NULL) {
        succ = present->right->minim;
    }
    else {
        prec = present->up;
        while (prec != NULL && present == prec->right) {
            present = prec;
            prec = present->up;
        }
        succ = prec;
    }
    return succ;

}

void MDO::sterge_rec(nod* to_delete) {
    if (to_delete != NULL) {
        if (to_delete->left == NULL && to_delete->right == NULL) {
            if (to_delete->up != NULL) {
                if (to_delete->up->left == to_delete)
                    to_delete->up->left = NULL;
                else
                    to_delete->up->right = NULL;
            }
            delete to_delete;
        }
        else {
            if (to_delete->left == NULL) {
                to_delete->heightRight--;
                to_delete->values = to_delete->right->values;
                sterge_rec(to_delete->right);

            }
            else if (to_delete->right == NULL) {
                to_delete->heightLeft--;
                to_delete->values = to_delete->left->values;
                sterge_rec(to_delete->left);
            }
            else {
                if (to_delete->heightLeft < to_delete->heightRight) {
                    to_delete->heightLeft--;
                    to_delete->values = to_delete->left->values;
                    sterge_rec(to_delete->left);

                }
                else {
                    to_delete->heightRight--;
                    to_delete->values = to_delete->right->values;
                    sterge_rec(to_delete->right);

                }
            }
        }
    }
}

bool MDO::sterge(TCheie c, TValoare v) {
    /*	Caz favorabil = Theta(1)
        Caz defavorabil = Theta(n)
        Caz mediu = Theta(n)
        Complexitate generala : O(n)*/
    vector<nod*> aux;
    if (dim() == 0)
    {
        return false;
    }
    cauta_rec(parent, c, aux);
    for (vector<nod*>::iterator i = aux.begin(); i != aux.end(); ++i) {
        if ((*i)->values.second == v) {
            sterge_rec(*i);
            --nrElems;
            return true;
        }
    }

    return false;
}

int MDO::dim() const {
    // BC = WC = AC = Theta(1)
    return nrElems;
}

bool MDO::vid() const {
    // BC = WC = AC = Theta(1)
    return nrElems == 0;
}

IteratorMDO MDO::iterator() const {
    return IteratorMDO(*this);
}

void MDO::destructor_rec(nod* par) {
    if (par != NULL && nrElems > 0) {
        destructor_rec(par->right);
        destructor_rec(par->left);
        delete par;
    }
}

MDO::~MDO() {
    /* de adaugat */
    destructor_rec(parent);
}

int MDO::adaugaInexistente(MDO &mdo){
    int nr = 0;
    IteratorMDO it = mdo.iterator();
    it.prim();
    while(it.valid()){
        TElem el = it.element();
        vector<TValoare> v = this->cauta(el.first);
        if(v.size() == 0) {
            adauga(el.first, el.second);
            nr++;
        }
        else{
            int ok = 0;
            for(int i = 0; i < v.size(); i++)
                if(v[i] == el.second) {
                    ok = 1;
                    break;
                }
            if(!ok) {
                adauga(el.first, el.second);
                nr++;
            }
        }
        it.urmator();
    }
    return nr;

}