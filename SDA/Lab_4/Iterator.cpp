#include "Iterator.h"
#include "LO.h"
#include <exception>

Iterator::Iterator(const LO& lo) : lo(lo){
	curr = lo.first;
}

void Iterator::prim(){
	curr = lo.first;
}

void Iterator::urmator(){
    if(valid() == false)
        throw std::exception();
	curr = lo.list[curr].next;
}

bool Iterator::valid() const{
	return curr != -1;
}

TElement Iterator::element() const{
	if(valid() == false)
        throw std::exception();
    return lo.list[curr].elem;
}

bool Iterator::operator==(const Iterator &other) const {
    return curr == other.curr;
}

bool Iterator::operator!=(const Iterator &other) const {
    return !(curr == other.curr);
}
