from infrastructura.repository import *
from validare.validator import *

def adauga_cheltuiala_service(cheltuieli, nr, tip, suma, ziua):
    cheltuiala = creeaza_cheltuiala(nr, tip, suma, ziua)
    valideaza_cheltuiala(cheltuiala)
    adauga_cheltuiala_lista(cheltuieli, cheltuiala)


def numar_cheltuieli_service(cheltuieli):
    return numar_cheltuieli_lista(cheltuieli)


def get_cheltuieli_service(cheltuieli):
    return get_lista_cheltuieli(cheltuieli)


def cauta_cheltuiala_service(cheltuieli, nr, tip):
    return cauta_cheltuiala(cheltuieli, nr, tip)


def modifica_cheltuiala_service(cheltuieli, nr, tip, suma, ziua):
    cheltuiala = creeaza_cheltuiala(nr, tip, suma, ziua)
    valideaza_cheltuiala(cheltuiala)
    modifica_cheltuiala(cheltuieli, cheltuiala)


def sterge_cheltuieli_apartament_service(cheltuieli, nr):
    cheltuiala = creeaza_cheltuiala(nr, "apa", 123, 2)
    valideaza_cheltuiala(cheltuiala)
    sterge_cheltuieli_apartament(cheltuieli, nr)


def sterge_cheltuieli_apartamente_consecutive_service(cheltuieli, nr1, nr2):
    cheltuiala = creeaza_cheltuiala(nr1, "apa", 123, 2)
    valideaza_cheltuiala(cheltuiala)
    cheltuiala = creeaza_cheltuiala(nr2, "apa", 123, 2)
    valideaza_cheltuiala(cheltuiala)
    sterge_cheltuieli_apartamente_consecutive(cheltuieli, nr1, nr2)


def sterge_cheltuieli_de_un_tip_service(cheltuieli, tip):
    cheltuiala = creeaza_cheltuiala(12, tip, 123,2)
    valideaza_cheltuiala(cheltuiala)
    sterge_cheltuieli_de_un_tip(cheltuieli, tip)


def suma_totala_apartamente_service(cheltuieli, suma_data):
    cheltuiala = creeaza_cheltuiala(12,"apa", suma_data, 12)
    valideaza_cheltuiala(cheltuiala)
    l = []
    sume_apartamente = suma_totala_apartamente(cheltuieli)
    for s in sume_apartamente:
        if s[1] > suma_data:
            l.append(s[0])
    return l

def suma_totala_cheltuiala_service(cheltuieli, tip):
    suma = 0
    for cheltuiala in cheltuieli:
        if get_tip_cheltuiala(cheltuiala) == tip:
            suma += get_suma_cheltuiala(cheltuiala)
    return suma

def sortare_dupa_tip_service(cheltuieli, tip):
    cheltuiala = creeaza_cheltuiala(12, tip, 12, 12)
    valideaza_cheltuiala(cheltuiala)
    l = sortare_dupa_tip(cheltuieli, tip)
    return l

def suma_totala_apartament_service(cheltuieli, nr):
    cheltuiala = creeaza_cheltuiala(nr, "apa", 12, 12)
    valideaza_cheltuiala(cheltuiala)
    return suma_totala_apartament(cheltuieli, nr)


def filtreaza_dupa_un_tip_service(cheltuieli, tip):
    cheltuiala = creeaza_cheltuiala(12, tip, 14, 14)
    valideaza_cheltuiala(cheltuiala)
    return filtreaza_dupa_un_tip(cheltuieli, tip)


def filtreaza_dupa_suma_service(cheltuieli, suma):
    cheltuiala = creeaza_cheltuiala(12, "apa", suma, 12)
    valideaza_cheltuiala(cheltuiala)
    return filtreaza_dupa_suma(cheltuieli, suma)


def undo_service(cheltuieli, cheltuieli_stiva):
    if len(cheltuieli_stiva) == 0:
        raise ValueError("nu mai exista elemente in sir!")
    cheltuiala = cheltuieli_stiva.pop()
    for op in cheltuiala:
        comanda = op[0]
        if comanda == "add":
            for _chel in reversed(cheltuieli):
                if get_nr_apartament_cheltuiala(_chel) == op[1] and get_tip_cheltuiala(_chel) == op[2]:
                    cheltuieli.remove(_chel)
                    break
        if comanda == "mod":
            for _chel in cheltuieli:
                if get_nr_apartament_cheltuiala(_chel) == op[1] and get_tip_cheltuiala(_chel) == op[2]:
                    modifica_cheltuiala_service(cheltuieli, op[1], op[2], op[3], op[4])
        if comanda == "del1" or comanda == "del2" or comanda == "del3":
            adauga_cheltuiala_service(cheltuieli, op[1], op[2], op[3], op[4])
