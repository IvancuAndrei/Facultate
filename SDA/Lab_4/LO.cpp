#include "Iterator.h"
#include "LO.h"

#include <iostream>
using namespace std;

#include <exception>

void LO::resize() {                                                //theta(max_size)
    max_size = max_size * 2;
    Node* temp = new Node[max_size];

    for(int i = 0; i < cp; i++){
        temp[i] = list[i];
    }

    delete []list;
    list = temp;
}

int LO::cautaSpatiu() {                                             //bestCase:theta(1)
    for(int i = 0; i < cp; i++)                                     //WorstCase:theta(cp)
        if(list[i].elem == -1)                                      //AverageCase:O(cp)
            return i;
    return -1;
}

LO::LO(Relatie r) {
	this->r = r;
    list = new Node[max_size];
    nr = 0;
    cp = 0;
    first = NULL_TELEMENT;
    firstLiber = 0;
}

// returnare dimensiune
int LO::dim() const {
	return nr;
}

// verifica daca LO e vida
bool LO::vida() const {
	return nr == 0;
}

// prima pozitie din LO
Iterator LO::prim() const {
    Iterator it = Iterator(*this);

    it.prim();
	return it;
}

// returnare element de pe pozitia curenta
//arunca exceptie daca poz nu e valid
TElement LO::element(Iterator poz) const {
	return poz.element();
}

//sterge element de pe o pozitie poz si returneaza elementul sters
//dupa stergere poz e pozitionat pe elementul de dupa cel sters
//arunca exceptie daca poz nu e valid
TElement LO::sterge(Iterator& poz) {                                //BestCase:theta(1)
    if(poz.valid() == false)                                        //WorstCase:theta(nr)
        throw std::exception();                                     //AverageCase:O(nr)

    //primul element
    if(poz.curr == first) {
        TElement e = poz.element();
        list[first].elem = -1;
        first = list[first].next;
        poz.urmator();
        nr--;
        return e;
    }
    else {
        Iterator it = Iterator(*this);
        Iterator it2 = Iterator(*this);
        it.prim();
        it2.prim();
        TElement e = poz.element();
        while(it2 != poz){
            it2.urmator();
            if(it2 != poz)
                it.urmator();
        }
        list[it.curr].next = list[it2.curr].next;
        list[it2.curr].elem = -1;
        poz.urmator();
        nr--;
        return e;
    }
}


// cauta element si returneaza prima pozitie pe care apare (sau iterator invalid)
Iterator LO::cauta(TElement e) const{                               //BestCase: theta(1)
	Iterator it = Iterator(*this);                                  //WorstCase: theta(nr)
                                                                    //AverageCase: O(nr)
    it.prim();
    while(it.valid() && it.element() != e)
        it.urmator();
    return it;
}

// adaugare element in LO
void LO::adauga(TElement e) {                                       //BestCase: theta(1)
    if (cautaSpatiu() == -1 && cp == max_size)                      //WorstCase: theta(nr)
        resize();                                                   //AverageCase: O(nr)

    if(first == NULL_TELEMENT){
        first = firstLiber;
        list[first] = {e,NULL_TELEMENT};
        cp++;
        nr++;
        return;
    }

    int firstLiberAux = cautaSpatiu();
    if(firstLiberAux == -1)
        firstLiber++;
    else
        firstLiber = firstLiberAux;
    list[firstLiber] = {e ,NULL_TELEMENT};
    int k = first;
    int ante;
    while(k != NULL_TELEMENT && !(r(list[firstLiber].elem, list[k].elem))){
        ante = k;
        k = list[k].next;
    }

    if(k == first){
        list[firstLiber].next = first;
        first = firstLiber;
        cp++;
        nr++;
        return;
    }

    if(k == NULL_TELEMENT){
        list[ante].next = firstLiber;
        cp++;
        nr++;
        return;
    }

    list[firstLiber].next = k;
    list[ante].next = firstLiber;
    cp++;
    nr++;

}


//destructor
LO::~LO() {
	delete[] list;
}

int LO::eliminaDinKinK(int k){                          //theta(n)
    if(k < 0)
        throw std::exception();
    int num = 0;
    if(nr < k)
        return num;

    Iterator it = Iterator(*this);
    it.prim();
    while(it.valid() == true){
        int kk = k;
        while(kk - 1 != 0 && it.valid() == true) {
            it.urmator();
            kk--;
        }
        if(it.valid() == true) {
            sterge(it);
            num++;
        }
    }
    return num;
}