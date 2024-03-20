from domain.cheltuiala import *


def adauga_cheltuiala_lista(cheltuieli, cheltuiala):
    for _cheltuiala in cheltuieli:
        if egal_cheltuieli(cheltuiala, _cheltuiala):
            raise ValueError("cheltuiala invalida!\n")
    cheltuieli.append(cheltuiala)


def numar_cheltuieli_lista(cheltuieli):
    return len(cheltuieli)


def get_lista_cheltuieli(cheltuieli):
    return cheltuieli[:]


def cauta_cheltuiala(cheltuieli, nr, tip):
    ok = 0
    for cheltuiala in cheltuieli:
        if get_nr_apartament_cheltuiala(cheltuiala) == nr:
            if get_tip_cheltuiala(cheltuiala) == tip:
                ok = 1
                return cheltuiala
    if ok == 0:
        raise ValueError("cheltuiala inexistenta!\n")


def modifica_cheltuiala(cheltuieli, cheltuiala):
    ok = 0
    for _cheltuiala in cheltuieli:
        if get_nr_apartament_cheltuiala(_cheltuiala) == get_nr_apartament_cheltuiala(cheltuiala):
            if get_tip_cheltuiala(_cheltuiala) == get_tip_cheltuiala(cheltuiala):
                ok = 1
                set_suma_noua(_cheltuiala, get_suma_cheltuiala(cheltuiala))
                set_ziua_noua(_cheltuiala, get_ziua_cheltuiala(cheltuiala))
    if ok == 0:
        raise ValueError("Cheltuiala inexistenta!\n")


def sterge_cheltuieli_apartament(cheltuieli, nr):
    ok = 0
    for cheltuiala in reversed(cheltuieli):
        if get_nr_apartament_cheltuiala(cheltuiala) == nr:
            cheltuieli.remove(cheltuiala)
            ok = 1
    if ok == 0:
        raise ValueError("Apartament inexistent!")


def sterge_cheltuieli_apartamente_consecutive(cheltuieli, nr1, nr2):
    if nr1 > nr2:
        nr1, nr2 = nr2, nr1
    for cheltuiala in reversed(cheltuieli):
        if nr1 <= get_nr_apartament_cheltuiala(cheltuiala) <= nr2:
            cheltuieli.remove(cheltuiala)


def sterge_cheltuieli_de_un_tip(cheltuieli, tip):
    for cheltuiala in reversed(cheltuieli):
        if get_tip_cheltuiala(cheltuiala) == tip:
            cheltuieli.remove(cheltuiala)

def suma_totala_apartamente(cheltuieli):
    apartamente = []
    sume_apartamente = []
    for cheltuiala in cheltuieli:
        if get_nr_apartament_cheltuiala(cheltuiala) not in apartamente:
            apartamente.append(get_nr_apartament_cheltuiala(cheltuiala))
    for nr in apartamente:
        sume_apartamente.append([nr, 0])
    for s in sume_apartamente:
        for cheltuiala in cheltuieli:
            if get_nr_apartament_cheltuiala(cheltuiala) == s[0]:
                s[1] += get_suma_cheltuiala(cheltuiala)
    return sume_apartamente


def sortare_dupa_tip(cheltuieli, tip):
    sume_apartamente = []
    for cheltuiala in cheltuieli:
        if get_tip_cheltuiala(cheltuiala) == tip:
            sume_apartamente.append([get_nr_apartament_cheltuiala(cheltuiala), get_suma_cheltuiala(cheltuiala)])
    sume_apartamente.sort(key = lambda l: l[1])
    return sume_apartamente


def suma_totala_apartament(cheltuieli, nr):
    suma = 0
    for cheltuiala in cheltuieli:
        if get_nr_apartament_cheltuiala(cheltuiala) == nr:
            suma += get_suma_cheltuiala(cheltuiala)
    return suma

def filtreaza_dupa_un_tip(cheltuieli, tip):
    cheltuieli_filtrate = []
    for cheltuiala in cheltuieli:
        if get_tip_cheltuiala(cheltuiala) != tip:
            adauga_cheltuiala_lista(cheltuieli_filtrate, cheltuiala)
    return cheltuieli_filtrate

def filtreaza_dupa_suma(cheltuieli, suma):
    cheltuieli_filtrate = []
    for cheltuiala in cheltuieli:
        if get_suma_cheltuiala(cheltuiala) > suma:
            adauga_cheltuiala_lista(cheltuieli_filtrate, cheltuiala)
    return cheltuieli_filtrate