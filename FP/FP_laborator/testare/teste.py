from administratie.administrare_cheltuieli import *
from repository.infrastructura import *


def teste_creare_cheltuieli():
    apartamente = {}
    assert (len(apartamente) == 0)
    nr = 12
    tip = "apa"
    suma = 76.09
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    assert (len(apartamente) == 1)


def teste_stergere_cheltuieli():
    apartamente = {}
    nr = 12
    tip = "apa"
    suma = 76.09
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    assert (len(apartamente) == 1)
    sterge_toate_cheltuielile_apartament(apartamente, 12)
    assert (len(apartamente) == 0)


def teste_stergere_cheltuieli_apartamente_consecutive():
    apartamente = {}
    nr = 12
    tip = "apa"
    suma = 76.09
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 13
    tip = "apa"
    suma = 76.09
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 14
    tip = "apa"
    suma = 76.09
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    assert (len(apartamente) == 3)
    sterge_toate_cheltuielile_apartamente_consecutive(apartamente, 12, 14)
    assert (len(apartamente) == 0)


def teste_stergere_cheltuieli_acelasi_tip():
    apartamente = {}
    nr = 12
    tip = "apa"
    suma = 76.09
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 12
    tip = "altele"
    suma = 90
    zi = 12
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 13
    tip = "apa"
    suma = 90
    zi = 14
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 13
    tip = "gaz"
    suma = 122
    zi = 11
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    assert (len(apartamente[12]) == 2)
    assert(len(apartamente[13]) == 2)
    sterge_toate_cheltuielile_de_un_tip(apartamente, "apa")
    assert (len(apartamente[12]) == 1)
    assert (len(apartamente[13]) == 1)


def teste_suma_totala_apartament():
    apartamente = {}
    nr = 12
    tip = "apa"
    suma = 1
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 12
    tip = "gaz"
    suma = 2
    zi = 2
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 12
    tip = "altele"
    suma = 3
    zi = 11
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    assert(suma_totala_cheltuieli(apartamente, 12) == 6)


def teste_suma_totala_utilitate():
    apartamente = {}
    nr = 12
    tip = "apa"
    suma = 1
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 13
    tip = "apa"
    suma = 2
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 14
    tip = "apa"
    suma = 3
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    assert (suma_totala_cheltuieli_tip(apartamente, "apa") == 6)


def teste_filtrare_cheltuieli_tip():
    apartamente = {}
    apartamente_filtrate = {}
    assert (len(apartamente_filtrate) == 0)
    nr = 12
    tip = "apa"
    suma = 1
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 13
    tip = "altele"
    suma = 2
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 14
    tip = "apa"
    suma = 3
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 15
    tip = "gaz"
    suma = 4
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    filtrare_cheltuieli_tip(apartamente, apartamente_filtrate, "apa")
    assert (len(apartamente_filtrate) == 2)


def teste_filtrare_suma():
    apartamente = {}
    apartamente_filtrate = {}
    assert (len(apartamente_filtrate) == 0)
    nr = 12
    tip = "apa"
    suma = 1
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 13
    tip = "altele"
    suma = 2
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 14
    tip = "apa"
    suma = 3
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    nr = 15
    tip = "gaz"
    suma = 4
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    filtrare_cheltuieli_suma(apartamente, apartamente_filtrate, 2)
    assert (len(apartamente_filtrate) == 2)


def teste_undo_c11():
    apartamente = {}
    stiva_apartamente = []
    apartament = []
    assert (len(apartamente) == 0)
    nr = 15
    tip = "gaz"
    suma = 4
    ziua = 21
    creeaza_apartament(apartamente, nr, tip, suma, ziua)
    apartament.append(creeaza_apartament_stiva(nr, tip, suma, ziua, "c11"))
    stiva_apartamente.append(apartament)
    assert (len(apartamente[nr]) == 1)
    undo(apartamente, stiva_apartamente)
    assert (len(apartamente[nr]) == 0)


def teste_undo_c12():
    apartamente = {}
    stiva_apartamente = []
    apartament = []
    nr = 15
    tip = "gaz"
    suma = 4
    ziua = 21
    creeaza_apartament(apartamente, nr, tip, suma, ziua)
    apartament.append(creeaza_apartament_stiva(nr, tip, suma, ziua, "c11"))
    stiva_apartamente.append(apartament)
    assert (apartamente[nr][tip]["suma"] == 4)
    assert (apartamente[nr][tip]["ziua"] == 21)
    creeaza_apartament(apartamente, nr, tip, 132, 11)
    apartament = []
    apartament.append(creeaza_apartament_stiva(nr, tip, suma, ziua, "c12"))
    stiva_apartamente.append(apartament)
    assert (apartamente[nr][tip]["suma"] == 132)
    assert (apartamente[nr][tip]["ziua"] == 11)
    undo(apartamente, stiva_apartamente)
    assert (apartamente[nr][tip]["suma"] == 4)
    assert (apartamente[nr][tip]["ziua"] == 21)


def teste_undo_c21():
    apartamente = {}
    stiva_apartamente = []
    apartament = []
    nr = 15
    tip = "gaz"
    suma = 4
    ziua = 21
    creeaza_apartament(apartamente, nr, tip, suma, ziua)
    apartament.append(creeaza_apartament_stiva(nr, tip, suma, ziua, "c11"))
    stiva_apartamente.append(apartament)
    apartament = []
    for tip_c in apartamente[nr]:
        apartament.append(creeaza_apartament_stiva(nr, tip_c, apartamente[nr][tip_c]["suma"], apartamente[nr][tip_c]["ziua"], "c21"))
    stiva_apartamente.append(apartament)
    sterge_toate_cheltuielile_apartament(apartamente, nr)
    assert (len(apartamente) == 0)
    undo(apartamente, stiva_apartamente)
    assert (len(apartamente) == 1)


def teste_undo_c22():
    apartamente = {}
    stiva_apartamente = []
    apartament = []
    nr = 12
    tip = "apa"
    suma = 76.09
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    apartament.append(creeaza_apartament_stiva(nr, tip, suma, zi, "c22"))
    nr = 13
    tip = "apa"
    suma = 76.09
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    apartament.append(creeaza_apartament_stiva(nr, tip, suma, zi, "c22"))
    nr = 14
    tip = "apa"
    suma = 76.09
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    apartament.append(creeaza_apartament_stiva(nr, tip, suma, zi, "c22"))
    stiva_apartamente.append(apartament)
    assert (len(apartamente) == 3)
    sterge_toate_cheltuielile_apartamente_consecutive(apartamente, 12, 14)
    assert (len(apartamente) == 0)
    undo(apartamente, stiva_apartamente)
    assert (len(apartamente) == 3)


def teste_undo_c23():
    apartamente = {}
    stiva_apartamente = []
    apartament = []
    nr = 12
    tip = "apa"
    suma = 76.09
    zi = 21
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    apartament.append(creeaza_apartament_stiva(nr, tip, suma, zi, "c23"))
    nr = 12
    tip = "altele"
    suma = 90
    zi = 12
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    apartament.append(creeaza_apartament_stiva(nr, tip, suma, zi, "c23"))
    nr = 13
    tip = "apa"
    suma = 90
    zi = 14
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    apartament.append(creeaza_apartament_stiva(nr, tip, suma, zi, "c23"))
    nr = 13
    tip = "gaz"
    suma = 122
    zi = 11
    creeaza_apartament(apartamente, nr, tip, suma, zi)
    apartament.append(creeaza_apartament_stiva(nr, tip, suma, zi, "c23"))
    stiva_apartamente.append(apartament)
    assert (len(apartamente[12]) == 2)
    assert (len(apartamente[13]) == 2)
    sterge_toate_cheltuielile_de_un_tip(apartamente, "apa")
    assert (len(apartamente[12]) == 1)
    assert (len(apartamente[13]) == 1)
    undo(apartamente, stiva_apartamente)
    assert (len(apartamente[12]) == 2)
    assert (len(apartamente[13]) == 2)


def toate_testele():
    teste_creare_cheltuieli()
    teste_stergere_cheltuieli()
    teste_stergere_cheltuieli_apartamente_consecutive()
    teste_stergere_cheltuieli_acelasi_tip()
    teste_suma_totala_apartament()
    teste_suma_totala_utilitate()
    teste_filtrare_cheltuieli_tip()
    teste_filtrare_suma()
    teste_undo_c11()
    teste_undo_c12()
    teste_undo_c21()
    teste_undo_c22()
    teste_undo_c23()
