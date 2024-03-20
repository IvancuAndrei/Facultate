#include "IteratorLP.h"
#include "Lista.h"
#include <exception>

IteratorLP::IteratorLP(const Lista& l):lista(l) {
	it = lista.head;
}

void IteratorLP::prim(){
	it = lista.head;
}

void IteratorLP::urmator(){
	if((valid() == false))
        throw std::exception();
    it = it->next;
}

bool IteratorLP::valid() const{
	return it != NULL;
}

TElem IteratorLP::element() const{
	if(valid() == false)
        throw std::exception();
	return it->elem;
}

bool IteratorLP::operator==(const IteratorLP &other) const {
    return it->elem == other.it->elem && it->next == other.it->next;
}

bool IteratorLP::operator!=(const IteratorLP &other) const {
    return !(it == other.it);
}


