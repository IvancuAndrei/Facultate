#pragma once
#include "Agentie.h"
#include "Oferta.h"
class ConsoleUI {
    Agentie& ctr;
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

    void tipareste(const Lista<Oferta>& oferte);

public:
    ConsoleUI(Agentie& ctr) :ctr{ ctr } {
    }
    //nu permitem copierea obiectelor
    ConsoleUI(const ConsoleUI& ot) = delete;

    void start();

    void space();
};