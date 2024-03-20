#pragma once
#include "Agentie.h"
#include "Oferta.h"
#include "CosService.h"
class ConsoleUI {
    Agentie& ctr;
    CosService& cServ;

    /*
    Citeste datele de la tastatura si adauga Pet
    arunca exceptie daca: nu se poate salva, nu e valid
    */
    void adaugaUI();
    /*
    Tipareste o lista de animale la consola
    */
    void stergeUI();

    void modificaUI();

    void sortByDenumireUI();

    void sortByDestinatieUI();

    void sortByTipPretUI();

    void filtrareDestinatieUI();

    void filtrarePretUI();

    void emptyCosUI();

    void addCosUI();

    void genCosUI();

    void expCosUI();

    void typeOfCosUI();

    void undoUI();

    void tipareste(const vector<Oferta>& oferte);

public:
    ConsoleUI(Agentie& ctr, CosService& cServ) :ctr{ ctr }, cServ(cServ) {
    }
    //nu permitem copierea obiectelor
    ConsoleUI(const ConsoleUI& ot) = delete;

    void start();

    void space();
};