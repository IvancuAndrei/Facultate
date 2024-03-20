from domain.cheltuiala import *
from validare.validator import *
from infrastructura.repository import *
from business.service import *

def teste_domeniu():
    nr_apartament = 23
    tip_cheltuiala = "apa"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    cheltuiala = creeaza_cheltuiala(nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    assert(nr_apartament == get_nr_apartament_cheltuiala(cheltuiala))
    assert(tip_cheltuiala == get_tip_cheltuiala(cheltuiala))
    assert(abs(suma_cheltuiala - get_suma_cheltuiala(cheltuiala)) < 0.0001)
    assert(ziua_cheltuiala == get_ziua_cheltuiala(cheltuiala))


def teste_validare():
    nr_apartament = 23
    tip_cheltuiala = "apa"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    cheltuiala = creeaza_cheltuiala(nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    valideaza_cheltuiala(cheltuiala)

    nr_gresit = -2
    tip_gresit = ""
    suma_gresita = -1
    ziua_gresita = 0
    cheltuiala_gresita = creeaza_cheltuiala(nr_gresit, tip_gresit, suma_gresita, ziua_gresita)
    try:
        valideaza_cheltuiala(cheltuiala_gresita)
        assert False
    except ValueError as ve:
        assert (str(ve) == "numar apartament invalid!\ntip cheltuiala invalid!\nsuma cheltuiala invalida!\nziua cheltuiala invalida!\n")


def teste_repository():
    cheltuieli = []
    nr_apartament = 23
    tip_cheltuiala = "apa"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    cheltuiala = creeaza_cheltuiala(nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    assert(numar_cheltuieli_lista(cheltuieli) == 0)
    adauga_cheltuiala_lista(cheltuieli, cheltuiala)
    assert (numar_cheltuieli_lista(cheltuieli) == 1)
    alta_cheltuiala = creeaza_cheltuiala(nr_apartament, tip_cheltuiala , 123, 2)
    try:
        adauga_cheltuiala_lista(cheltuieli, alta_cheltuiala)
        assert False
    except ValueError as ve:
        assert(str(ve) == "cheltuiala invalida!\n")

    cheltuiala_noua = creeaza_cheltuiala(nr_apartament, tip_cheltuiala, 23, 5)
    modifica_cheltuiala(cheltuieli, cheltuiala_noua)
    cheltuiala_ = cauta_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala)
    assert (get_suma_cheltuiala(cheltuiala_) == 23)
    assert (get_ziua_cheltuiala(cheltuiala_) == 5)
    cheltuiala_inexistenta = creeaza_cheltuiala(12, "gaz", 23, 7)
    try:
        modifica_cheltuiala(cheltuieli, cheltuiala_inexistenta)
        assert False
    except ValueError as ve:
        assert(str(ve) == "Cheltuiala inexistenta!\n")

    assert(numar_cheltuieli_lista(cheltuieli) == 1)
    sterge_cheltuieli_apartament(cheltuieli, 23)
    assert (numar_cheltuieli_lista(cheltuieli) == 0)
    try:
        sterge_cheltuieli_apartament(cheltuieli, 23)
        assert False
    except ValueError as ve:
        assert (str(ve) == "Apartament inexistent!")


def teste_service_cheltuiala():
    cheltuieli = []
    nr_apartament = 23
    tip_cheltuiala = "apa"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    assert (numar_cheltuieli_service(cheltuieli) == 0)
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    assert (numar_cheltuieli_service(cheltuieli) == 1)
    try:
        adauga_cheltuiala_service(cheltuieli, 0, "", 0, 32)
        assert False
    except ValueError as ve:
        assert (str(ve) == "numar apartament invalid!\ntip cheltuiala invalid!\nsuma cheltuiala invalida!\nziua cheltuiala invalida!\n")
    try:
        adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, 123, 2)
        assert False
    except ValueError as ve:
        assert (str(ve) == "cheltuiala invalida!\n")

    cheltuieli_stiva = []
    cheltuieli_stiva.append([["mod", nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala]])
    suma_cheltuiala_noua = 27
    ziua_cheltuiala_noua = 8
    modifica_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala_noua, ziua_cheltuiala_noua)
    cheltuiala_ = cauta_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala)
    assert (get_suma_cheltuiala(cheltuiala_) == 27)
    assert (get_ziua_cheltuiala(cheltuiala_) == 8)
    undo_service(cheltuieli, cheltuieli_stiva)
    cheltuiala_ = cauta_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala)
    assert (get_suma_cheltuiala(cheltuiala_) == 89.06)
    assert (get_ziua_cheltuiala(cheltuiala_) == 12)
    try:
        modifica_cheltuiala_service(cheltuieli, 12, "gaz", 12, 12)
        assert False
    except ValueError as ve:
        assert (str(ve) == "Cheltuiala inexistenta!\n")
    try:
        modifica_cheltuiala_service(cheltuieli, -1, "", 0, 32)
        assert False
    except ValueError as ve:
        assert (str(ve) == "numar apartament invalid!\ntip cheltuiala invalid!\nsuma cheltuiala invalida!\nziua cheltuiala invalida!\n")

    cheltuieli_stiva = []
    cheltuieli = []
    _cheltuiala = []
    nr_apartament = 23
    tip_cheltuiala = "apa"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    nr_apartament = 23
    tip_cheltuiala = "gaz"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    assert (numar_cheltuieli_service(cheltuieli) == 2)
    for cheltuiala in cheltuieli:
        if get_nr_apartament_cheltuiala(cheltuiala) == nr_apartament:
            _cheltuiala.append(["del1", get_nr_apartament_cheltuiala(cheltuiala), get_tip_cheltuiala(cheltuiala), get_suma_cheltuiala(cheltuiala), get_ziua_cheltuiala(cheltuiala)])
    cheltuieli_stiva.append(_cheltuiala)
    sterge_cheltuieli_apartament_service(cheltuieli, 23)
    assert (numar_cheltuieli_service(cheltuieli) == 0)
    undo_service(cheltuieli, cheltuieli_stiva)
    assert (numar_cheltuieli_service(cheltuieli) == 2)
    sterge_cheltuieli_apartament_service(cheltuieli, 23)
    try:
        sterge_cheltuieli_apartament_service(cheltuieli, 23)
        assert False
    except ValueError as ve:
        assert (str(ve) == "Apartament inexistent!")
    try:
        sterge_cheltuieli_apartament_service(cheltuieli, -23)
        assert False
    except ValueError as ve:
        assert (str(ve) == "numar apartament invalid!\n")

    cheltuieli = []
    cheltuieli_stiva = []
    _cheltuiala = []
    nr_apartament = 23
    tip_cheltuiala = "apa"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    _cheltuiala.append(["del2", nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala])
    nr_apartament = 24
    tip_cheltuiala = "apa"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    _cheltuiala.append(["del2", nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala])
    nr_apartament = 25
    tip_cheltuiala = "apa"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    _cheltuiala.append(["del2", nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala])
    cheltuieli_stiva.append(_cheltuiala)
    assert (numar_cheltuieli_service(cheltuieli) == 3)
    sterge_cheltuieli_apartamente_consecutive_service(cheltuieli, 23, 25)
    assert (numar_cheltuieli_service(cheltuieli) == 0)
    undo_service(cheltuieli, cheltuieli_stiva)
    assert(numar_cheltuieli_service(cheltuieli) == 3)

    cheltuieli = []
    cheltuieli_stiva = []
    _cheltuiala = []
    nr_apartament = 23
    tip_cheltuiala = "apa"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    _cheltuiala.append(["del3", nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala])
    nr_apartament = 24
    tip_cheltuiala = "apa"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    _cheltuiala.append(["del3", nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala])
    cheltuieli_stiva.append(_cheltuiala)
    assert (numar_cheltuieli_service(cheltuieli) == 2)
    sterge_cheltuieli_de_un_tip_service(cheltuieli, "apa")
    assert (numar_cheltuieli_service(cheltuieli) == 0)
    undo_service(cheltuieli, cheltuieli_stiva)
    assert (numar_cheltuieli_service(cheltuieli) == 2)

    cheltuieli = []
    nr_apartament = 23
    tip_cheltuiala = "apa"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    nr_apartament = 24
    tip_cheltuiala = "apa"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    l = suma_totala_apartamente_service(cheltuieli, 80)
    assert (len(l) == 2)

    cheltuieli = []
    nr_apartament = 23
    tip_cheltuiala = "apa"
    suma_cheltuiala = 1
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    nr_apartament = 24
    tip_cheltuiala = "apa"
    suma_cheltuiala = 2
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    s = suma_totala_cheltuiala_service(cheltuieli, "apa")
    assert (s == 3)

    cheltuieli = []
    nr_apartament = 23
    tip_cheltuiala = "apa"
    suma_cheltuiala = 1
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    nr_apartament = 23
    tip_cheltuiala = "gaz"
    suma_cheltuiala = 2
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    s = suma_totala_apartament_service(cheltuieli, 23)
    assert (s == 3)

    cheltuieli = []
    nr_apartament = 23
    tip_cheltuiala = "apa"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    nr_apartament = 24
    tip_cheltuiala = "gaz"
    suma_cheltuiala = 88.06
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    l = filtreaza_dupa_un_tip_service(cheltuieli, "apa")
    assert (len(l) == 1)
    l = filtreaza_dupa_suma_service(cheltuieli, 89)
    assert (len(l) == 1)

    cheltuieli_stiva = []
    cheltuieli = []
    nr_apartament = 23
    tip_cheltuiala = "apa"
    suma_cheltuiala = 89.06
    ziua_cheltuiala = 12
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)
    cheltuieli_stiva.append([["add", nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala]])
    assert(len(cheltuieli) == 1)
    undo_service(cheltuieli, cheltuieli_stiva)
    assert(len(cheltuieli) == 0)
    try:
        undo_service(cheltuieli,cheltuieli_stiva)
        assert False
    except ValueError as ve:
        assert(str(ve) == "nu mai exista elemente in sir!")




def ruleaza_toate_testele():
    teste_domeniu()
    teste_validare()
    teste_repository()
    teste_service_cheltuiala()