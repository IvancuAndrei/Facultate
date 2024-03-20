#include "IteratorMD.h"
#include "MD.h"

using namespace std;

IteratorMD::IteratorMD(const MD& _md) : md(_md) {
    pozCurent = 0;
    deplasare();
}

TElem IteratorMD::element() const {
    return curent->e;
    //return pair <TCheie, TValoare>(-1, -1);
}

bool IteratorMD::valid() const {
    if (pozCurent < md.dim() && curent != NULL) {
        return true;
    }
    return false;
}

void IteratorMD::urmator() {
    curent = curent->urm;
    if (curent == NULL) {
        pozCurent++;
        deplasare();
    }
}

void IteratorMD::prim() {
    pozCurent = 0;
    deplasare();
}

void IteratorMD::deplasare() {
    while (pozCurent < md.m && md.keys[pozCurent] == NULL) {
        pozCurent++;
    }
    if (pozCurent < md.m) {
        curent = md.keys[pozCurent];
    }

}