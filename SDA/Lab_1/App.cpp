#include <iostream>
#include "Colectie.h"
#include "IteratorColectie.h"
#include "TestExtins.h"
#include "TestScurt.h"

using namespace std;

void printColectie(Colectie& c){
    IteratorColectie it = c.iterator();
    while(it.valid()){
        cout<<it.element()<<" ";
        it.urmator();
    }
    cout<<"\n";
}

int main() {
	testAllExtins();
	testAll();
    cout << "All tests passed\n";

    Colectie c;

    c.adauga(1);
    c.adauga(1);
    c.adauga(2);
    c.adauga(2);
    c.adauga(2);
    c.adauga(3);
    c.adauga(3);
    c.adauga(3);
    c.adauga(3);
    c.adauga(3);
    printColectie(c);
    cout<<c.dim()<<"\n";

    cout<<c.nrAparitii(3)<<"\n";
    cout<<c.vida()<<"\n";
    cout<<c.dim()<<"\n";


    c.sterge(1);
    printColectie(c);

    c.eliminaAparitii(2,2);
    printColectie(c);




}
