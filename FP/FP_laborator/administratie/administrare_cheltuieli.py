from repository.infrastructura import *


def suma_totala_cheltuieli(apartamente, nr):
    '''
    Returneaza suma totala de cheltuieli a unui apartament
    :param apartamente: dict
    :param nr:int
    :return: rez:int suma totala de cheltuieli a unui apartament
    '''
    suma = 0
    for tip_utilitate in apartamente[nr]:
        suma += apartamente[nr][tip_utilitate]["suma"]
    return suma


def sterge_toate_cheltuielile_apartament(apartamente, nr):
    '''
    Elimina toate cheltuielile de la apartamentul cu numarul dat
    :param apartamente: dict
    :param nr: int
    '''
    apartamente.pop(nr)


def sterge_toate_cheltuielile_apartamente_consecutive(apartamente, nr1, nr2):
    '''
    Elimina toate cheltuielile de la apartamente consecutive, incepand de la un numar dat, pana la alt numar dat
    :param apartamente: dict
    :param nr1: int
    :param nr2: int
    '''
    for nr in range(nr1, nr2 + 1):
        if not nr in apartamente:
            continue
        else:
            sterge_toate_cheltuielile_apartament(apartamente, nr)


def sterge_toate_cheltuielile_de_un_tip(apartamente, tip):
    '''
    Elimina toate cheltuielile de la o utilitate data in dictionarul de apartamente
    :param apartamente: dict
    :param tip: string
    '''
    for nr in apartamente:
        apartamente[nr].pop(tip)


def filtrare_cheltuieli_tip(apartamente, apartamente_filtrate, tip_cheltuiala):
    '''
    Filtreaza dictionarul de apartamente, prin adaugarea intr-un alt dictionar apartamente_filtrate a apartamentelor
    cu cheltuielile ce respecta conditia de a nu fi de tipul citit
    :param apartamente: dict
    :param apartamente_filtrate: dict
    :param tip_cheltuiala: string
    '''
    for nr in apartamente:
        for tip in apartamente[nr]:
            if tip_cheltuiala != tip:
                creeaza_apartament(apartamente_filtrate, nr, tip, apartamente[nr][tip]["suma"], apartamente[nr][tip]["ziua"])


def filtrare_cheltuieli_suma(apartamente, apartamente_filtrate, suma_data):
    '''
    Filtreaza dictionarul de apartamente, prin adaugarea intr-un alt dictionar apartamente_filtrate a apartamentelor
    cu cheltuielile ce respecta conditia de a avea suma mai mare decat cea citita
    :param apartamente: dict
    :param apartamente_filtrate: dict
    :param suma_data: int
    '''
    for nr in apartamente:
        for tip in apartamente[nr]:
            if apartamente[nr][tip]["suma"] > suma_data:
                creeaza_apartament(apartamente_filtrate, nr, tip, apartamente[nr][tip]["suma"], apartamente[nr][tip]["ziua"])


def suma_totala_cheltuieli_tip(apartamente, tip_cheltuiala_primit):
    '''
    Calculeaza suma totala a anumitei utilitati scrise in meniu, si apoi o returneaza
    :param apartamente: dict
    :param tip_cheltuiala_primit: string
    :return: rez:int - suma totala a unei utilitati
    '''
    suma_totala = 0
    for nr in apartamente:
        for tip in apartamente[nr]:
            if tip == tip_cheltuiala_primit:
                suma_totala += apartamente[nr][tip]["suma"]
    return suma_totala


def sortare_dupa_tip(apartamente, apartamente_cu_cheltuiala, tip_cheltuiala):
    '''
    Adauga intr-o lista apartamentele ce contin tipul de cheltuiala cerut, dupa care il sorteaza dupa suma crescator
    :param apartamente: dict
    :param apartamente_cu_cheltuiala: list
    :param tip_cheltuiala: string
    '''
    for nr in apartamente:
        for tip in apartamente[nr]:
            if tip == tip_cheltuiala:
                my_dict = {"nr": nr, "suma": apartamente[nr][tip]["suma"]}
                apartamente_cu_cheltuiala.append(my_dict)

    def returneaza_suma(e):
        return e["suma"]
    apartamente_cu_cheltuiala.sort(key=returneaza_suma)


def undo(apartamente, stiva_apartamente):
    '''
    Reface ultima operație (lista de cheltuieli revine la ce exista înainte de ultima operație care a modificat lista)
    :param apartamente: dict
    :param stiva_apartamente: list
    :return: -
    '''
    apartament = stiva_apartamente.pop()
    for op in apartament:
        comanda = op[0]
        if comanda == "c11":
            apartamente[op[1]].pop(op[2])
        elif comanda == "c12":
            creeaza_apartament(apartamente, op[1], op[2], op[3], op[4])
        elif comanda == "c21":
            creeaza_apartament(apartamente, op[1], op[2], op[3], op[4])
        elif comanda == "c22":
            creeaza_apartament(apartamente, op[1], op[2], op[3], op[4])
        elif comanda == "c23":
            creeaza_apartament(apartamente, op[1], op[2], op[3], op[4])
