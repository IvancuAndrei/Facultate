#include <exception>

#include "IteratorLP.h"
#include "Lista.h"

#include <iostream>

Lista::Lista() {
        this->head = NULL;
}

int Lista::dim() const {
	int dim = 0;
    IteratorLP it = IteratorLP(*this);

    it.prim();
    while(it.valid()){
        dim++;
        it.urmator();
    }
	return dim;
}


bool Lista::vida() const {
	return head == NULL;
}

IteratorLP Lista::prim() const {
	IteratorLP it = IteratorLP(*this);

    it.prim();
    return it;
}

TElem Lista::element(IteratorLP poz) const {
	return poz.element();
}

TElem Lista::sterge(IteratorLP& poz) {
	if (poz.valid() == false)
        throw std::exception();

    IteratorLP ite = IteratorLP(*this);
    ite.prim();

    //daca e primul element
    if(ite == poz){
        int elemSters = head->elem;
        Node* headAux = head;
        head = head->next;
        free(headAux);
        return elemSters;
    }

    IteratorLP del = ite;
    while(del != poz) {
        del.urmator();
        if (del != poz)
            ite.urmator();
    }

    //daca e ultimul element
    IteratorLP del2 = del;
    del2.urmator();
    if(del2.valid() == false){
        int elemSters = del.element();
        free(del.it);
        del.it = NULL;
        return elemSters;
    }

    int elemSters = del.element();
    ite.it->next = del.it->next;
    free(del.it);
    return elemSters;

}

IteratorLP Lista::cauta(TElem e) const{
	IteratorLP it = IteratorLP(*this);

    it.prim();
    while (it.valid() && it.element() != e){
        it.urmator();
    }
	return it;
}

TElem Lista::modifica(IteratorLP poz, TElem e) {
    if (poz.valid() == false)
        throw std::exception();

    IteratorLP ite = IteratorLP(*this);
    ite.prim();
    while(ite != poz)
        ite.urmator();

    int elemMod = ite.element();
    ite.it->elem = e;
    return elemMod;
}

void Lista::adauga(IteratorLP& poz, TElem e) {
    if(poz.valid() == false)
        throw std::exception();

    IteratorLP ite = IteratorLP(*this);
    ite.prim();
    while(ite != poz)
        ite.urmator();
    IteratorLP add = ite;
    ite.it->next = new Node{e, add.it->next};
    poz.urmator();
}

void Lista::adaugaInceput(TElem e) {
	if (head == NULL){
        head = new Node{e, NULL};
        return;
    }
    else {
        Node* new_node = new Node{e, head};
        head = new_node;
        return;
    }

}

void Lista::adaugaSfarsit(TElem e) {
    if (head == NULL){
        head = new Node{e, NULL};
        return;
    }
    else {
        Node *curr = head;
        Node *lftNode = NULL;
        while (curr != NULL) {
            lftNode = curr;
            curr = curr->next;
        }

        lftNode->next = new Node{e, NULL};
        return;
    }
}

Lista::~Lista() {
	Node* curr = head;
    while(curr != NULL){
        Node* currAux = curr;
        curr = curr->next;
        delete currAux;
    }
}
