from domain.cheltuiala import *


def valideaza_cheltuiala(cheltuiala):
    erori = ""
    if get_nr_apartament_cheltuiala(cheltuiala) < 1:
        erori += "numar apartament invalid!\n"
    if get_tip_cheltuiala(cheltuiala) == "":
        erori += "tip cheltuiala invalid!\n"
    if get_suma_cheltuiala(cheltuiala) < 0.01:
        erori += "suma cheltuiala invalida!\n"
    if get_ziua_cheltuiala(cheltuiala) < 1 or get_ziua_cheltuiala(cheltuiala) > 31:
        erori += "ziua cheltuiala invalida!\n"
    if len(erori) > 0:
        raise ValueError(erori)