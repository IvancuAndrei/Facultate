#include "presentation.h"

#include "Oferta.h"
#include <iostream>
#include <string>

using std::cout;
using std::cin;

void ConsoleUI::tipareste(const vector<Oferta>& oferte) {
    cout << "Oferte:\n";
    vector <Oferta> l = oferte;
    for (const auto& o: l) {
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

void ConsoleUI::emptyCosUI() {
    cServ.emptyCos();
}

void ConsoleUI::addCosUI() {
    string den;
    cout << "Dati denumirea:";
    cin >> den;
    cServ.addOferta(den);
}

void ConsoleUI::genCosUI() {
    int i;
    cout << "Dati numarul de oferte:";
    cin >> i;
    cServ.generateCos(i);
}

void ConsoleUI::expCosUI() {
    string nume;
    cout << "Dati numele fisierului:";
    cin >> nume;
    cServ.exportCos(nume);
}

void ConsoleUI::typeOfCosUI() {
    map<string, vector<Oferta>> typeMap = cServ.typeOfCos();
    cout << "Oferte din cos:" <<'\n';
    for (auto const &pair: typeMap) {
        cout << pair.first << ": " <<'\n';
        for(auto const&o :pair.second){
            cout << o <<'\n';
        }
    }
}

void ConsoleUI::undoUI(){
    ctr.undo();
    cout << "Operatie efectuata cu succes!\n";
}

void ConsoleUI::space() {
    cout<<"\n\n\n\n\n\n\n\n\n\n\n\n\n";
}

void ConsoleUI::start() {
    while (true) {
        cout << "Meniu:\n";
        cout << "1 Adauga oferta\n2 Sterge oferta\n3 Modifica oferta\n";
        cout << "4 Tipareste oferte\n5 Sorteaza dupa denumire ofertele\n";
        cout << "6 Sorteaza dupa destinatie ofertele\n7 Sorteaza dupa tip si pret ofertele\n";
        cout << "8 Filtreaza dupa destinatie ofertele\n9 Filtreaza dupa pret ofertele\n10 Adauga in cos\n11 Goleste cos\n12 Genereaza cos\n13 Exporta cos\n"
                "14 Ofertele din cos sortate dupa tip\n15 Undo\n0 Iesire\nDati comanda:";
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
                case 10:
                    space();
                    addCosUI();
                    break;
                case 11:
                    space();
                    emptyCosUI();
                    break;
                case 12:
                    space();
                    genCosUI();
                    break;
                case 13:
                    space();
                    expCosUI();
                    break;
                case 14:
                    space();
                    typeOfCosUI();
                    break;
                case 15:
                    space();
                    undoUI();
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