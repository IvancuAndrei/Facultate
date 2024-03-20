def valideaza_cheltuiala(nr, tip, suma, ziua):
    '''
    verifica daca numarul apartamentului int >0
    tipul cheltuielii string nu e vid
    suma cheltuiala int > 0
    si ziua cheltuielii int > 0
    :param nr: int
    :param tip: string
    :param suma: int
    :param ziua: int
    :return: - (daca datele cheltuielii sunt valide)
    :raises ValueError: - daca numarul apartamentului int < 0 "apartament invalid!\n" va fi concatenat la stringul de eroare
                          daca tipul cheltuielii string este vid "tip cheltuiala invalid!\n" va fi concatenat ...
                          daca suma int < 0 "suma invalida!\n" ...
                          daca ziua int < 0 "zi invalida!\n" ...
                          si daca cel putin unul dintre mesaje este concatenat
                          se arunca eroare de tipul ValueError cu mesajul stringurilor de concatenate
    '''
    erori = ""
    if nr < 0:
        erori += "apartament invalid!\n"
    if tip == "":
        erori += "tip cheltuiala invalid!\n"
    if suma < 0:
        erori += "suma invalida!\n"
    if ziua < 1 and ziua > 31:
        erori += "zi invalida"
    if len(erori) > 0:
        raise ValueError(erori)


def valideaza_nr_apartament(apartamente, nr):
    '''
    Verifica daca apartamentul exista in dictionar
    :param apartamente: dict
    :param nr: int
    :return: - (daca apartamentul exista)
    :raises ValueError - daca apartamentul nu exista in dictionar, se arunca eroare de tipul ValueError cu mesajul "Apartamentul nu exista!"
    '''
    erori = ""
    if not nr in apartamente:
        erori += "Apartamentul nu exista!"
    if len(erori) > 0:
        raise ValueError(erori)


def valideaza_tip_cheltuiala(apartamente, nr, tip):
    '''
    Verifica daca tipul cheltuielii exista la un apartament
    :param apartamente: dict
    :param nr: int
    :param tip: string
    :return: - (daca tipul cheltuielii exista)
    :raises ValueError - daca apartamentul nu are tipul de cheltuiala cerut, se arunca eroare de tipul ValueError cu mesajul "Tipul cheltuielii nu exista la acest apartament!"
    '''
    erori = ""
    if not tip in apartamente[nr]:
        erori += "Tipul cheltuielii nu exista la acest apartament!"
    if len(erori) > 0:
        raise ValueError(erori)


def valideaza_nr(nr):
    '''
    Verifica daca numarul apartamentului este valid (>0)
    :param nr: int
    :return: - (daca este valid numarul apartamentului)
    :raises ValueError - daca numarul apartamentului nu poate sa existe, se arunca eroare de tipul ValueError cu mesajul "Numar apartament invalid!"
    '''
    erori = ""
    if nr < 0:
        erori += "Numar apartament invalid!"
    if len(erori) > 0:
        raise ValueError(erori)


def valideaza_tip(tip):
    '''
    Verifica daca tipul cheltuielii este valid (nu este vid)
    :param tip: string
    :return: - (daca este valid tipul cheltuielii)
    :raises ValueError - daca tipul cheltuielii este vid, se arunca eroare de tipul ValueError cu mesajul "Tipul cheltuielii este invalid!"
    '''
    erori = ""
    if tip == "":
        erori += "Tipul cheltuielii este invalid!"
    if len(erori) > 0:
        raise ValueError(erori)


def valideaza_ziua(ziua):
    '''
    Verifica daca ziua cheltuielii este valida (>0)
    :param ziua: int
    :return: - (daca este valida ziua)
    :raises ValueError - daca ziua cheltuielii este invalida, se arunca eroare de tipul ValueError cu mesajul "Zi cheltuiala invalida!"
    '''
    erori = ""
    if ziua < 0:
        erori += "Zi cheltuiala invalida!"
    if len(erori) > 0:
        raise ValueError(erori)

def valideaza_undo(stiva_apartamente):
    '''
    Verifica daca in stiva de comenzi si apartamente se mai poate aplica functia de undo in care se elimina cate un element
    din stiva
    :param stiva_apartamente: list
    :return: - (daca stiva este in continuare plina cu elemente)
    :raises ValueError - daca stiva este goala, se arunca eroare de tipul ValueError cu mesajul "Nu mai exista elemente in lista!"
    '''
    erori = ""
    if len(stiva_apartamente) == 0:
        erori += "Nu mai exista elemente in lista!"
    if len(erori) > 0:
        raise ValueError(erori)
