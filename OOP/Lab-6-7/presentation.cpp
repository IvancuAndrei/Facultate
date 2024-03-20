#include "presentation.h"

#include "Oferta.h"
#include <iostream>
#include <string>

using std::cout;
using std::cin;

void ConsoleUI::tipareste(const Lista<Oferta>& oferte) {
    cout << "Oferte:\n";
    Lista <Oferta> l = oferte;
    for (int i = 0; i < l.size(); i++) {
        Oferta o = l.getData(i);
        cout << ' ' << o.getDenumire() << ' ' << o.getDestinatie() << ' ' << o.getTip() << ' ' << o.getPret() << '\n';
    }
}


void ConsoleUI::adaugaUI() {
    string dr, d, t;
    int pret;
    cout << "Dati denumire:";
    cin >> dr;
    cout << "Dati destinatie:";
    cin >> d;
    cout << "Dati tip:";
    cin >> t;
    cout << "Dati pret:";
    cin >> pret;
    ctr.addOferta(dr, d, t, pret);
    cout << "Adaugat cu succes\n";
}

void ConsoleUI::stergeUI(){
    string denumire;
    cout<<"Dati denumirea:";
    cin>>denumire;
    ctr.popOferta(denumire);
    cout<<"Sters cu succes\n";

}

void ConsoleUI::modificaUI() {
    string dr, d, t;
    int p;
    cout <<"Dati denumirea: ";
    cin >> dr;
    cout << "Dati destinatie:";
    cin >> d;
    cout << "Dati tip:";
    cin >> t;
    cout << "Dati pret:";
    cin >> p;
    ctr.modOferta(dr, d, t, p);
    cout << "Modificat cu succes\n";
}

void ConsoleUI::sortByDenumireUI() {
    tipareste(ctr.sortByDenumire());

}

void ConsoleUI::sortByDestinatieUI() {
    tipareste(ctr.sortByDestinatie());
}

void ConsoleUI::sortByTipPretUI() {
    tipareste(ctr.sortByTipPret());
}

void ConsoleUI::filtrareDestinatieUI() {
    string d;
    cout << "Dati destinatie:";
    cin >> d;
    tipareste(ctr.filtrareDestinatie(d));
}

void ConsoleUI::filtrarePretUI() {
    int p;
    cout << "Dati pretul:";
    cin >> p;
    tipareste(ctr.filtrarePret(p));
}

void ConsoleUI::space() {
    cout<<"\n\n\n\n\n\n\n\n\n\n\n\n\n";
}

void ConsoleUI::start() {
    while (true) {
        cout << "Meniu:\n";
        cout << "1 Adauga oferta\n2 Sterge oferta\n3 Modifica oferta\n4 Tipareste oferte\n5 Sorteaza dupa denumire ofertele\n"
                "6 Sorteaza dupa destinatie ofertele\n7 Sorteaza dupa tip si pret ofertele\n"
                "8 Filtreaza dupa destinatie ofertele\n9 Filtreaza dupa pret ofertele\n0 Iesire\nDati comanda:";
        int cmd;
        cin >> cmd;
        try {
            switch (cmd) {
                case 1:
                    space();
                    adaugaUI();
                    break;
                case 2:
                    space();
                    stergeUI();
                    break;
                case 3:
                    space();
                    modificaUI();
                    break;
                case 4:
                    space();
                    tipareste(ctr.getAll());
                    break;
                case 5:
                    space();
                    sortByDenumireUI();
                    break;
                case 6:
                    space();
                    sortByDestinatieUI();
                    break;
                case 7:
                    space();
                    sortByTipPretUI();
                    break;
                case 8:
                    space();
                    filtrareDestinatieUI();
                    break;
                case 9:
                    space();
                    filtrarePretUI();
                    break;
                case 0:
                    return;
                default:
                    cout << "Comanda invalida\n";
            }
        }
        catch (const OfertaRepoException& ex) {
            cout << ex <<'\n';
        }
        catch (const ValidateException& ex) {
            cout << ex << '\n';
        }
    }
}