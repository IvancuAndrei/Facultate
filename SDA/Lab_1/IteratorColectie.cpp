#include "IteratorColectie.h"
#include "Colectie.h"


IteratorColectie::IteratorColectie(const Colectie& c): col(c) {
	prim();
}

TElem IteratorColectie::element() const{
	if (valid())
        return col.v[pos.e].e;
	return -1;
}

bool IteratorColectie::valid() const {
	return pos.e < col.vLen && pos.freq <= col.v[pos.e].freq;
}

void IteratorColectie::urmator() {
	if(pos.freq < col.v[pos.e].freq)
        pos.freq++;
    else{
        pos.freq = 1;
        pos.e++;
    }
}

void IteratorColectie::prim() {
	pos = TPair{0, 1};
}
