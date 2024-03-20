from validare.validator import *


def seteaza_cheltuiala(suma, ziua):
    '''
    Creeaza cheltuiala cu suma int suma si ziua int ziua
    :param suma: int suma
    :param ziua: int ziua
    :return: rez: dict - cheltuiala
    '''
    return {
        "suma": suma,
        "ziua": ziua
    }


def creeaza_apartament_stiva(nr, tip, suma, ziua, c):
    return [c, nr, tip, suma, ziua]


def creeaza_apartament(apartamente, nr, tip, suma, ziua):
    '''
    Creeaza dictionarul de apartamente dict apartamente cu cheia numarul apartamentului int nr, avand ca valoare alt
    dictionar cu cheia tipul cheltuielii string tip, avand ca valoare dictionarul cu cheile suma si ziua avand valorile
    int suma, respectiv int ziua
    :param apartamente: dict
    :param nr: int
    :param tip: string
    :param suma: int
    :param ziua: int
    :return: - (daca nr, tip, suma, ziua sunt valide)
    :raises ValueError - cu mesajul "apartament invalid!"/"tip cheltuiala invalida!"/"suma invalida!"/"zi invalida!"
    '''
    valideaza_cheltuiala(nr, tip, suma, ziua)
    if not (nr in apartamente):
        apartamente[nr] = {}
    apartament = apartamente[nr]
    cheltuiala = seteaza_cheltuiala(suma, ziua)
    apartament[tip] = cheltuiala


def get_ziua_cheltuiala(apartamente, nr, tip):
    '''
    Returneaza ziua unei cheltuieli unui apartament, pentru o anumita utilitate
    :param apartamente: Dictionar cu toate apartamentele
    :param nr: Numarul apartamentului
    :param tip: Tipul de utilitate
    :return: rez:int -  Ziua asociata cheltuielii
    '''
    return apartamente[nr][tip]["ziua"]


def get_suma_cheltuiala(apartamente, nr, tip):
    '''
    Returneaza suma unei cheltuieli unui apartament, pentru o anumita utilitate
    :param apartamente: dict
    :param nr: int
    :param tip: string
    :return: rez:int - suma asociata cheltuielii
    '''
    return apartamente[nr][tip]["suma"]

