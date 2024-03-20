def creeaza_cheltuiala(nr, tip, suma, ziua):
    return [nr, tip, suma, ziua]


def get_nr_apartament_cheltuiala(cheltuiala):
    return cheltuiala[0]


def get_tip_cheltuiala(cheltuiala):
    return cheltuiala[1]


def get_suma_cheltuiala(cheltuiala):
    return cheltuiala[2]


def get_ziua_cheltuiala(cheltuiala):
    return cheltuiala[3]


def set_suma_noua(cheltuiala, suma_noua):
    cheltuiala[2] = suma_noua


def set_ziua_noua(cheltuiala, ziua_noua):
    cheltuiala[3] = ziua_noua


def egal_cheltuieli(cheltuiala_a, cheltuiala_b):
    return cheltuiala_a[0] == cheltuiala_b[0] and cheltuiala_a[1] == cheltuiala_b[1]


def to_string_cheltuiala(cheltuiala):
    return f"Apartamentul:{get_nr_apartament_cheltuiala(cheltuiala)} Tipul cheltuielii:{get_tip_cheltuiala(cheltuiala)} Suma:{get_suma_cheltuiala(cheltuiala)} Ziua:{get_ziua_cheltuiala(cheltuiala)}"