from business.service import *
from domain.cheltuiala import *


def ui_adauga_cheltuiala(cheltuieli, params, cheltuieli_stiva):
    if len(params) != 4:
        print("numar parametri invalid!")
        return
    nr_apartament = int(params[0])
    tip_cheltuiala = params[1]
    suma = float(params[2])
    ziua = int(params[3])
    adauga_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma, ziua)
    cheltuieli_stiva.append([["add", nr_apartament, tip_cheltuiala, suma, ziua]])


def ui_print_cheltuieli(cheltuieli, params):
    if len(params) != 0:
        print("numar parametri invalid!")
        return
    if numar_cheltuieli_service(cheltuieli) == 0:
        print("nu exista cheltuieli!")
        return
    _cheltuieli = get_cheltuieli_service(cheltuieli)
    for cheltuiala in _cheltuieli:
        print(to_string_cheltuiala(cheltuiala))


def ui_modifica_cheltuiala(cheltuieli, params, cheltuiala_stiva):
    if len(params) != 4:
        print("numar parametri invalid!")
        return
    nr_apartament = int(params[0])
    tip_cheltuiala = params[1]
    suma_cheltuiala = float(params[2])
    ziua_cheltuiala = int(params[3])
    _cheltuiala = cauta_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala)
    cheltuiala_stiva.append([["mod", nr_apartament, tip_cheltuiala, _cheltuiala[2], _cheltuiala[3]]])
    modifica_cheltuiala_service(cheltuieli, nr_apartament, tip_cheltuiala, suma_cheltuiala, ziua_cheltuiala)


def ui_sterge_cheltuiala_apartament(cheltuieli, params, cheltuiala_stiva):
    if len(params) != 1:
        print("numar parametri invalid!")
        return
    nr_apartament = int(params[0])
    _cheltuiala = []
    for cheltuiala in cheltuieli:
        if get_nr_apartament_cheltuiala(cheltuiala) == nr_apartament:
            _cheltuiala.append(["del1", get_nr_apartament_cheltuiala(cheltuiala), get_tip_cheltuiala(cheltuiala), get_suma_cheltuiala(cheltuiala), get_ziua_cheltuiala(cheltuiala)])
    cheltuiala_stiva.append(_cheltuiala)
    sterge_cheltuieli_apartament_service(cheltuieli, nr_apartament)


def ui_sterge_cheltuieli_apartamente_consecutive(cheltuieli, params, cheltuiala_stiva):
    if len(params) != 2:
        print("numar parametri invalid!")
        return
    nr1 = int(params[0])
    nr2 = int(params[1])
    _cheltuiala = []
    for cheltuiala in cheltuieli:
        if nr1 <=get_nr_apartament_cheltuiala(cheltuiala) <=nr2:
            _cheltuiala.append(["del2", get_nr_apartament_cheltuiala(cheltuiala), get_tip_cheltuiala(cheltuiala), get_suma_cheltuiala(cheltuiala), get_ziua_cheltuiala(cheltuiala)])
    cheltuiala_stiva.append(_cheltuiala)
    sterge_cheltuieli_apartamente_consecutive_service(cheltuieli, nr1, nr2)


def ui_sterge_cheltuieli_de_un_tip(cheltuieli, params, cheltuiala_stiva):
    if len(params) != 1:
        print("numar parametri invalid!")
        return
    tip = params[0]
    _cheltuiala = []
    for cheltuiala in cheltuieli:
        if get_tip_cheltuiala(cheltuiala) == tip:
            _cheltuiala.append(["del3", get_nr_apartament_cheltuiala(cheltuiala), get_tip_cheltuiala(cheltuiala),get_suma_cheltuiala(cheltuiala), get_ziua_cheltuiala(cheltuiala)])
    cheltuiala_stiva.append(_cheltuiala)
    sterge_cheltuieli_de_un_tip_service(cheltuieli, tip)


def ui_tipareste_apartamente_suma_mare(cheltuieli, params):
    if len(params) != 1:
        print("numar parametri invalid!")
        return
    suma_data = float(params[0])
    l = suma_totala_apartamente_service(cheltuieli, suma_data)
    for a in l:
        print(a)


def ui_tipareste_cheltuieli_tip(cheltuieli, params):
    if len(params) != 1:
        print("numar parametri invalid!")
        return
    tip_dat = params[0]
    for cheltuiala in cheltuieli:
        if get_tip_cheltuiala(cheltuiala) == tip_dat:
            print(to_string_cheltuiala(cheltuiala))

def ui_tipareste_cheltuieli_ziua(cheltuieli, params):
    if len(params) != 2:
        print("numar parametri invalid!")
        return
    ziua_data = int(params[0])
    suma_data = float(params[1])
    for cheltuiala in cheltuieli:
        if get_ziua_cheltuiala(cheltuiala) == ziua_data - 1:
            if get_suma_cheltuiala(cheltuiala) > suma_data:
                print(to_string_cheltuiala(cheltuiala))


def ui_tipareste_sort(cheltuieli, params):
    if len(params) != 1:
        print("numar parametri invalid!")
        return
    tip = params[0]
    l = sortare_dupa_tip_service(cheltuieli, tip)
    for a in l:
        print(a[0])


def ui_suma_totala_cheltuiala(cheltuieli, params):
    if len(params) != 1:
        print("numar parametri invalid!")
        return
    tip = params[0]
    print(suma_totala_cheltuiala_service(cheltuieli, tip))


def ui_suma_totala_apartament(cheltuieli, params):
    if len(params) != 1:
        print("numar parametri invalid!")
        return
    nr = int(params[0])
    print(suma_totala_apartament_service(cheltuieli, nr))


def ui_filtrare_dupa_tip(cheltuieli, params):
    if len(params) != 1:
        print("numar parametri invalid!")
        return
    tip = params[0]
    l = filtreaza_dupa_un_tip_service(cheltuieli, tip)
    for a in l:
        print(to_string_cheltuiala(a))


def ui_filtrare_dupa_suma(cheltuieli, params):
    if len(params) != 1:
        print("numar parametri invalid!")
        return
    suma = float(params[0])
    l = filtreaza_dupa_suma_service(cheltuieli, suma)
    for a in l:
        print(to_string_cheltuiala(a))


def ui_undo(cheltuieli, params, cheltuieli_stiva):
    if len(params) != 0:
        print("numar parametri invalid!")
        return
    undo_service(cheltuieli, cheltuieli_stiva)


def print_meniu():
    print("•adaugă cheltuială pentru un apartament                                               add  [nr] [tip] [suma] [zi]")
    print("•modifică cheltuială                                                                  mod  [nr] [tip] [suma] [zi]")
    print("•sterge toate cheltuielile de la un apartament                                        del1 [nr]           ")
    print("•sterge cheltuielile de la apartamente consecutive                                    del2 [nr1] [nr2]      ")
    print("•sterge cheltuielile de un anumit tip de la toate apartamentele                       del3 [tip]            ")
    print("•tipărește toate apartamentele care au cheltuieli mai mari decât o sumă dată          t1   [suma_data]     ")
    print("•tipărește cheltuielile de un anumit tip de la toate apartamentele                    t2   [tip_cerut]     ")
    print("•tipărește toate cheltuielile efectuate înainte de o zi și mai mari decât o sumă      t3   [zi_data] [suma_data]")
    print("•tipărește suma totală pentru un tip de cheltuială                                    rap1 [tip_dat]")
    print("•tipărește toate apartamentele sortate după un tip de cheltuială                      rap2 [tip_dat]")
    print("•tipărește totalul de cheltuieli pentru un apartament dat                             rap3 [nr_ap]")
    print("•elimină toate cheltuielile de un anumit tip                                          fil1 [tip_dat]")
    print("•elimină toate cheltuielile mai mici decât o sumă dată                                fil2 [suma_data]")
    print("•reface ultima operație                                                               undo")
    print("•afiseaza cheltuielile                                                                print")


def run_ui():
    cheltuieli = []
    cheltuieli_stiva = []
    print_meniu()
    while True:
        comanda = input(">>>")
        comanda = comanda.strip()
        if comanda == "":
            continue
        if comanda == "exit":
            return
        parti = comanda.split()
        nume_comanda = parti[0]
        params = parti[1:]
        if nume_comanda == "add":
            ui_adauga_cheltuiala(cheltuieli, params, cheltuieli_stiva)
        elif nume_comanda == "print":
            ui_print_cheltuieli(cheltuieli, params)
        elif nume_comanda == "mod":
            ui_modifica_cheltuiala(cheltuieli, params, cheltuieli_stiva)
        elif nume_comanda == "del1":
            ui_sterge_cheltuiala_apartament(cheltuieli, params, cheltuieli_stiva)
        elif nume_comanda == "del2":
            ui_sterge_cheltuieli_apartamente_consecutive(cheltuieli, params, cheltuieli_stiva)
        elif nume_comanda == "del3":
            ui_sterge_cheltuieli_de_un_tip(cheltuieli, params, cheltuieli_stiva)
        elif nume_comanda == "t1":
            ui_tipareste_apartamente_suma_mare(cheltuieli, params)
        elif nume_comanda == "t2":
            ui_tipareste_cheltuieli_tip(cheltuieli, params)
        elif nume_comanda == "t3":
            ui_tipareste_cheltuieli_ziua(cheltuieli, params)
        elif nume_comanda == "rap1":
            ui_suma_totala_cheltuiala(cheltuieli, params)
        elif nume_comanda == "rap2":
            ui_tipareste_sort(cheltuieli, params)
        elif nume_comanda == "rap3":
            ui_suma_totala_apartament(cheltuieli, params)
        elif nume_comanda == "fil1":
            ui_filtrare_dupa_tip(cheltuieli, params)
        elif nume_comanda == "fil2":
            ui_filtrare_dupa_suma(cheltuieli, params)
        elif nume_comanda == "undo":
            ui_undo(cheltuieli, params, cheltuieli_stiva)
        else:
            print("comanda invalida!")
            return
