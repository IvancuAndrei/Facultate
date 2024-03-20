#include "Colectie.h"
#include "IteratorColectie.h"
#include <iostream>

using namespace std;

bool rel(TElem e1, TElem e2) { // T(1)
	if (e1 <= e2)
        return true;
	return false;
}

Colectie::Colectie() {   //T(1)
    this->maxSize = 16;
    v = new TPair [maxSize];
    this->vLen = 0;
}

void Colectie::resize() { //T(n)
    maxSize *= 2;
    TPair *vNou = new TPair [maxSize];
    for (int i = 0; i < vLen; i++)
        vNou[i] = v[i];

    free(v);
    v = vNou;
}

void Colectie::adauga(TElem e) {         // Worst Case (T(n^2))
	if(vLen == maxSize)                  // Best Case(T(1))
        resize();                        // Medium Case(O(n))

    for(int i = 0; i < vLen; i++)
        if(v[i].e == e) {
            v[i].freq++;
            return;
        }

    int i = 0;
    while(rel(v[i].e, e)&& i < vLen)
        i++;
    vLen++;
    for(int j = vLen-1; j > i; j--)
        v[j] = v[j - 1];
    v[i] = TPair{e, 1};


}


bool Colectie::sterge(TElem e) {        //Worst Case(T(n))
	for(int i = 0; i < vLen; i++)       //Best Case(T(1))
        if(v[i].e == e) {               //Medium Case(O(n))
            v[i].freq--;
            if(v[i].freq == 0){
                vLen--;
                for(int j = i; j < vLen; j++)
                    v[j] = v[j + 1];
            }
            return true;
        }
	return false;
}


bool Colectie::cauta(TElem elem) const {    //Worst Case(T(n))
	for(int i = 0; i < vLen; i++)           //Best Case(T(1))
        if(v[i].e == elem)                  //Medium Case (O(n))
            return true;
	return false;
}


int Colectie::nrAparitii(TElem elem) const {    //Worst Case(T(n))
    for(int i = 0; i < vLen; i++)               //Best Case(T(1))
        if(v[i].e == elem)                      //Medium Case(O(n))
            return v[i].freq;
	return 0;
}



int Colectie::dim() const {     //T(n)
	int dimensiune = 0;
    for(int i = 0; i < vLen; i++)
        dimensiune += v[i].freq;
    if(dimensiune)
        return dimensiune;
	return 0;
}


bool Colectie::vida() const {
	if(vLen)
        return false;
	return true;
}


IteratorColectie Colectie::iterator() const {
	return  IteratorColectie(*this);
}


Colectie::~Colectie() {
	free(v);
}

int Colectie::eliminaAparitii(int nr, TElem e){     //Worst Case: T(k) daca nr < k
    int k = v[e].freq;                              //Best Case: T(nr) daca k < nr
    if (nr < 0){
        throw std::invalid_argument("Parametru invalid!\n");
    }
    if (k < nr) {
        nr = k;
        while (k) {
            sterge(e);
            k--;
        }
        return nr;
        }
    else{
        k = nr;
        while(nr){
            sterge(e);
            nr--;
        }
        return k;
    }

}
