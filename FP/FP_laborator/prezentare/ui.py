from administratie.administrare_cheltuieli import *
from repository.infrastructura import *
from validare.validator import *


def spacer():
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n")


def meniu():
    apartamente = {}
    stiva_apartamente = []
    while True:
        print("Administrarea blocului")
        print("c1 = Adaugare, c2 = Stergere, c3 = Cautari, c4 = Rapoarte, c5 = Filtru, c6 = Undo, q = Iesire")
        com = input("Introduceti comanda: ")
        if com == "c1":
            spacer()
            print("1 = Adaugare cheltuiala, 2 = Modificare cheltuiala")
            com1 = input("Ce doriti sa faceti: ")
            if com1 == "1":
                nr = int(input("Nr Apartament: "))
                tip = input("Tip cheltuiala: ")
                suma = float(input("Suma cheltuielii: "))
                ziua = int(input("Ziua din luna:"))
                creeaza_apartament(apartamente, nr, tip, suma, ziua)
                apartament = []
                apartament.append(creeaza_apartament_stiva(nr, tip, suma, ziua, "c11"))
                stiva_apartamente.append(apartament)
            elif com1 == "2":
                nr = int(input("Nr Apartament: "))
                valideaza_nr_apartament(apartamente, nr)
                tip = input("Tip cheltuiala: ")
                valideaza_tip_cheltuiala(apartamente, nr, tip)
                apartament = []
                apartament.append(creeaza_apartament_stiva(nr, tip, apartamente[nr][tip]["suma"], apartamente[nr][tip]["ziua"], "c12"))
                stiva_apartamente.append(apartament)
                ziua = get_ziua_cheltuiala(apartamente, nr, tip)
                suma = int(input("Introduceti suma dorita: "))
                creeaza_apartament(apartamente, nr, tip, suma, ziua)
            else:
                print("Introduceti o comanda valida!")
        elif com == "c2":
            spacer()
            print("1 = Șterge toate cheltuielile de la un apartament, 2 = Șterge cheltuielile de la apartamente consecutive, 3 = Șterge cheltuielile de un anumit tip de la toate apartamentele")
            com2 = input("Ce doriti sa faceti:")
            if com2 == "1":
                nr = int(input("Nr Apartament: "))
                valideaza_nr(nr)
                apartament = []
                for tip in apartamente[nr]:
                    apartament.append(creeaza_apartament_stiva(nr, tip, apartamente[nr][tip]["suma"], apartamente[nr][tip]["ziua"], "c21"))
                stiva_apartamente.append(apartament)
                sterge_toate_cheltuielile_apartament(apartamente, nr)
            elif com2 == "2":
                nr1 = int(input("Primul apartament:"))
                nr2 = int(input("Ultimul apartament"))
                valideaza_nr(nr1)
                valideaza_nr(nr2)
                if nr1 > nr2:
                    nr1, nr2 = nr2, nr1
                apartament = []
                for nr in range(nr1, nr2 + 1):
                    if not nr in apartamente:
                        continue
                    else:
                        for tip in apartamente[nr]:
                            apartament.append(creeaza_apartament_stiva(nr, tip, apartamente[nr][tip]["suma"], apartamente[nr][tip]["ziua"], "c22"))
                stiva_apartamente.append(apartament)
                sterge_toate_cheltuielile_apartamente_consecutive(apartamente, nr1, nr2)
            elif com2 == "3":
                tip = input("Tipul cheltuielii:")
                valideaza_tip(tip)
                apartament = []
                for nr in apartamente:
                    for tip_c in apartamente[nr]:
                        if tip_c == tip:
                            apartament.append(creeaza_apartament_stiva(nr, tip, apartamente[nr][tip]["suma"], apartamente[nr][tip]["ziua"], "c23"))
                stiva_apartamente.append(apartament)
                sterge_toate_cheltuielile_de_un_tip(apartamente, tip)
            else:
                print("Introduceti o comanda valida!")
        elif com == "c3":
            spacer()
            print("1 = Tipărește toate apartamentele care au cheltuieli mai mari decât o sumă dată, 2 = Tipărește cheltuielile de un anumit tip de la toate apartamentele, 3 = Tipărește toate cheltuielile efectuate înainte de o zi și mai mari decât o sumă")
            com3 = input("Ce doriti sa faceti:")
            if com3 == "1":
                suma_data = int(input("Introduceti suma:"))
                for nr in apartamente:
                    if suma_totala_cheltuieli(apartamente, nr) > suma_data:
                        print(nr, "\n")
            elif com3 == "2":
                tip_utilitate = input("Introduceti tipul cheltuielii:")
                valideaza_tip(tip_utilitate)
                for nr in apartamente:
                    for tip in apartamente[nr]:
                        if tip_utilitate == tip:
                            print("Apartament: ", nr, " Suma cheltuielii: ", apartamente[nr][tip]["suma"], "Ziua cheltuielii ", apartamente[nr][tip]["ziua"], "\n")
            elif com3 == "3":
                zi_emisa = int(input("Introduceti ziua: "))
                valideaza_ziua(zi_emisa)
                suma_ceruta = int(input("Introduceti suma: "))
                for nr in apartamente:
                    for tip in apartamente[nr]:
                        if apartamente[nr][tip]["suma"] > suma_ceruta and apartamente[nr][tip]["ziua"]+1 == zi_emisa:
                            print("Apartament: ", nr, "Tipul cheltuielii:", tip, "Suma cheltuielii:", apartamente[nr][tip]["suma"])
            else:
                print("Introduceti o comanda valida!")
        elif com == "c4":
            spacer()
            print("1 = Tipărește suma totală pentru un tip de cheltuială, 2 = Tipărește toate apartamentele sortate după un tip de cheltuială, 3 = Tipărește totalul de cheltuieli pentru un apartament dat")
            com4 = input("Ce doriti sa faceti:")
            if com4 == "1":
                tip_cheltuiala_data = input("Introduceti cheltuiala:")
                valideaza_tip(tip_cheltuiala_data)
                print(suma_totala_cheltuieli_tip(apartamente, tip_cheltuiala_data))
            elif com4 == "2":
                apartamente_cu_cheltuiala = []
                tip_cheltuiala_data = input("Introduceti cheltuiala:")
                valideaza_tip(tip_cheltuiala_data)
                sortare_dupa_tip(apartamente, apartamente_cu_cheltuiala, tip_cheltuiala_data)
                for apartament in apartamente_cu_cheltuiala:
                    print(apartament["nr"])
            elif com4 == "3":
                nr_apartament_dat = int(input("Introduceti numarul apartamentului"))
                valideaza_nr_apartament(apartamente, nr_apartament_dat)
                print(suma_totala_cheltuieli(apartamente, nr_apartament_dat))
            else:
                print("Introduceti o comanda valida!")
        elif com == "c5":
            print("\n\n\n\n\n\n\n\n\n\n")
            print("1 = Elimină toate cheltuielile de un anumit tip, 2 = Elimină toate cheltuielile mai mici decât o sumă dată")
            com5 = input("Ce doriti sa faceti:")
            if com5 == "1":
                tip_cheltuiala_filtrare = input("Introduceti tipul cheltuielii:")
                valideaza_tip(tip_cheltuiala_filtrare)
                apartamente_filtrate = {}
                filtrare_cheltuieli_tip(apartamente, apartamente_filtrate, tip_cheltuiala_filtrare)
                for nr in apartamente_filtrate:
                    for tip in apartamente_filtrate[nr]:
                        print("Apartamentul:", nr, "Tipul cheltuielii: ", tip, "Suma cheltuielii:", apartamente_filtrate[nr][tip]["suma"], "Ziua cheltuielii", apartamente_filtrate[nr][tip]["ziua"])
            elif com5 == "2":
                apartamente_filtrate = {}
                suma_data = int(input("Introduceti suma dorita:"))
                filtrare_cheltuieli_suma(apartamente, apartamente_filtrate, suma_data)
                for nr in apartamente_filtrate:
                    for tip in apartamente_filtrate[nr]:
                        print("Apartamentul:", nr, "Tipul cheltuielii: ", tip, "Suma cheltuielii:", apartamente_filtrate[nr][tip]["suma"], "Ziua cheltuielii", apartamente_filtrate[nr][tip]["ziua"])
            else:
                print("Introduceti o comanda valida!")
        elif com == "c6":
            valideaza_undo(stiva_apartamente)
            undo(apartamente, stiva_apartamente)
        elif com == "q":
            break
        else:
            print("Introduceti o comanda valida!")


def ui_adauga_cheltuiala(apartamente,params):
    if len(params) != 4:
        print("numar parametri invalid!")
        return
    nr = int(params[0])
    tip = params[1]
    suma = float(params[2])
    ziua = int(params[3])
    creeaza_apartament(apartamente, nr, tip, suma, ziua)


def ui_modificare_cheltuiala(apartamente, params):
    if len(params) != 4:
        print("numar parametri invalid!")
        return
    nr = int(params[0])
    tip = params[1]
    suma = float(params[2])
    ziua = int(params[3])
    creeaza_apartament(apartamente, nr, tip, suma, ziua)


def ui_stergere_apartament(apartamente, params):
    if len(params) != 1:
        print ("numar parametri invalid!")
        return
    nr = int(params[0])
    sterge_toate_cheltuielile_apartament(apartamente, nr)


def ui_stergere_apartamente_consecutive(apartamente, params):
    if len(params) != 2:
        print ("numar parametri invalid!")
        return
    nr1 = int(params[0])
    nr2 = int(params[1])
    if nr1 > nr2:
        nr1, nr2 = nr2, nr1
    sterge_toate_cheltuielile_apartamente_consecutive(apartamente, nr1, nr2)


def ui_stergere_tip_cheltuiala(apartamente, params):
    if len(params) != 1:
        print("numar parametri invalid")
        return
    tip = params[0]
    sterge_toate_cheltuielile_de_un_tip(apartamente, tip)


def ui_print(apartamente, params):
    if len(apartamente) == 0:
        print("nu exista apartamente!")
        return
    print(apartamente)

def comenzi():
    apartamente = {}
    comenzi = {
        "afiseaza_apartamente":ui_print,
        "adauga_cheltuiala": ui_adauga_cheltuiala,
        "modifica_cheltuiala": ui_modificare_cheltuiala,
        "stergere_apartament": ui_stergere_apartament,
        "stergere_apartamente_consecutive": ui_stergere_apartamente_consecutive,
        "stergere_cheltuieli_tip": ui_stergere_tip_cheltuiala
    }
    exit_statement = 0
    while exit_statement == 0:
        comanda = input(">>>")
        comanda = comanda.strip()
        comanda = comanda.split(";")
        while len(comanda)>0:
            comanda_curenta = comanda[0]
            comanda.pop(0)
            comanda_curenta = comanda_curenta.strip()
            comanda_curenta = comanda_curenta.strip("")
            if comanda == "":
                continue
            if comanda == "exit":
                return
            parti = comanda_curenta.split()
            nume_comanda = parti[0]
            params = parti[1:]
            if nume_comanda in comenzi:
                comenzi[nume_comanda](apartamente, params)
            else:
                print("comanda invalida!")