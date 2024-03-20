from erori.exceptii import RepoError, ValidationError


class UI(object):

    def print_meniu(self):
        print("•Adaugă persoana                                                     - add1  [id] [nume] [adresa]")
        print("•Modifică persoana                                                   - mod1  [id] [nume] [adresa]")
        print("•Sterge persoana                                                     - del1 [id_persoana]")
        print("•Adauga eveniment                                                    - add2 [id] [data] [timp] [descriere]")
        print("•Modifică eveniment                                                  - mod2 [id] [data] [timp] [descriere]")
        print("•Sterge eveniment                                                    - del2 [id_eveniment]")
        print("•Afiseaza persoane                                                   - print1")
        print("•Afiseaza eveniment                                                  - print2")
        print("•Cauta persoana                                                      - search1 [id_persoana]")
        print("•Cauta eveniment                                                     - search2 [id_eveniment]")
        print("•Adauga inscriere                                                    - add3 [id_persoana] [id_eveniment]")
        print("•Afiseaza inscrieri                                                  - print3")
        print("•Adauga persoane random                                              - add4 [numar_persoane]")
        print("•Afiseaza evenimentele la care participa o persoana ordonate dupa    - rap1 [id_persoana]")
        print(" nume si data")
        print("•Afiseaza persoanele participante la cele mai multe evenimente       - rap2")
        print("•Afiseaza primele 20% din evenimente cu cei mai multi participanti   - rap3")
        print("•Afiseaza persoanele participante la cele mai putine evenimente      - rap4")

    def __init__(self, service_persoana, service_eveniment, service_inscrieri, isFile):
        self.__service_persoana = service_persoana
        self.__service_eveniment = service_eveniment
        self.__service_inscrieri = service_inscrieri
        self.__isFile = isFile
        self.__comenzi = {
            "add1":self.__ui_adauga_persoana,
            "mod1":self.__ui_modifica_persoana,
            "del1":self.__ui_sterge_persoana,
            "print1":self.__ui_print_persoane,
            "add2":self.__ui_adauga_eveniment,
            "mod2":self.__ui_modifica_eveniment,
            "del2":self.__ui_sterge_eveniment,
            "print2":self.__ui_print_evenimente,
            "add3":self.__ui_adauga_inscriere,
            "search1":self.__ui_cauta_persoana,
            "search2":self.__ui_cauta_eveniment,
            "print3":self.__ui_print_inscrieri,
            "add4":self.__ui_adauga_persoane_random,
            "rap1":self.__ui_raport_1,
            "rap2":self.__ui_raport_2,
            "rap3":self.__ui_raport_3,
            "rap4":self.__ui_raport_4

        }

    def __ui_adauga_persoana(self):
        if len(self.__params) != 3:
            print("numar parametri invalid!")
            return
        id_persoana = int(self.__params[0])
        nume = self.__params[1]
        adresa = self.__params[2]
        self.__service_persoana.adauga_persoana(id_persoana, nume, adresa)

    def __ui_modifica_persoana(self):
        if len(self.__params) != 3:
            print("numar parametri invalid!")
            return
        id_persoana = int(self.__params[0])
        nume = self.__params[1]
        adresa = self.__params[2]
        self.__service_persoana.modifica_persoana(id_persoana, nume, adresa)

    def __ui_sterge_persoana(self):
        if len(self.__params) != 1:
            print("numar parametri invalid!")
            return
        id_persoana = int(self.__params[0])
        persoana = self.__service_persoana.cauta_persoana_dupa_id(id_persoana)
        self.__service_inscrieri.sterge_inscriere_dupa_persoana(persoana)

    def __ui_print_persoane(self):
        if len(self.__params) != 0:
            print("numar parametri invalid!")
            return
        persoane = self.__service_persoana.get_all_persoane()
        if len(persoane) == 0:
            print("nu exista persoane inregistrate")
            return
        for persoana in persoane:
            print(persoana)

    def __ui_adauga_eveniment(self):
        if len(self.__params) != 4:
            print("numar parametri invalid!")
            return
        id_eveniment = int(self.__params[0])
        data = self.__params[1]
        timp = self.__params[2]
        descriere = self.__params[3]
        self.__service_eveniment.adauga_eveniment(id_eveniment, data, timp, descriere)

    def __ui_modifica_eveniment(self):
        if len(self.__params) != 4:
            print("numar parametri invalid!")
            return
        id_eveniment = int(self.__params[0])
        data = self.__params[1]
        timp = self.__params[2]
        descriere = self.__params[3]
        self.__service_eveniment.modifica_eveniment(id_eveniment, data, timp, descriere)

    def __ui_sterge_eveniment(self):
        if len(self.__params) != 1:
            print("numar parametri invalid!")
            return
        id_eveniment = int(self.__params[0])
        eveniment = self.__service_eveniment.cauta_eveniment_dupa_id(id_eveniment)
        self.__service_inscrieri.sterge_inscriere_dupa_eveniment(eveniment)

    def __ui_print_evenimente(self):
        if len(self.__params) != 0:
            print("numar parametri invalid!")
            return
        evenimente = self.__service_eveniment.get_all_evenimente()
        if len(evenimente) == 0:
            print("nu exista evenimente inregistrate")
            return
        for eveniment in evenimente:
            print(eveniment)

    def __ui_adauga_inscriere(self):
        if len(self.__params) != 2:
            print("numar parametri invalid!")
            return
        id_persoana = int(self.__params[0])
        id_eveniment = int(self.__params[1])
        persoana = self.__service_persoana.cauta_persoana_dupa_id(id_persoana)
        eveniment = self.__service_eveniment.cauta_eveniment_dupa_id(id_eveniment)
        self.__service_inscrieri.adauga_inscriere(persoana, eveniment)

    def __ui_cauta_persoana(self):
        if len(self.__params) != 1:
            print("numar parametri invalid!")
            return
        id_persoana = int(self.__params[0])
        #print(self.__service_persoana.cauta_persoana_dupa_id(id_persoana))
        self.__service_persoana.cauta_persoana_dupa_id_rec(id_persoana)

    def __ui_cauta_eveniment(self):
        if len(self.__params) != 1:
            print("numar parametri invalid!")
            return
        id_eveniment = int(self.__params[0])
        print(self.__service_eveniment.cauta_eveniment_dupa_id(id_eveniment))

    def __ui_print_inscrieri(self):
        if len(self.__params) != 0:
            print("numar parametri invalid!")
            return
        inscrieri = self.__service_inscrieri.get_all_inscrieri()
        if len(inscrieri) == 0:
            print("nu exista inscrieri inregistrate")
            return
        for inscriere in inscrieri:
            print(inscriere)

    def __ui_adauga_persoane_random(self):
        if len(self.__params) != 1:
            print("numar parametri invalid!")
            return
        numar_persoane = int(self.__params[0])
        self.__service_persoana.creeaza_persoane_random(numar_persoane)

    def __ui_raport_1(self):
        if len(self.__params) != 1:
            print("numar parametri invalid!")
            return
        id = int(self.__params[0])
        answear = self.__service_inscrieri.raport_1(id)
        print(answear)

    def __ui_raport_2(self):
        if len(self.__params) != 0:
            print("numar parametri invalid!")
            return
        answear = self.__service_inscrieri.raport_2()
        print(answear)

    def __ui_raport_3(self):
        if len(self.__params) != 0:
            print("numar parametri invalid!")
            return
        answear = self.__service_inscrieri.raport_3()
        print(answear)

    def __ui_raport_4(self):
        if len(self.__params) != 0:
            print("numar parametri invalid!")
            return
        answear = self.__service_inscrieri.raport_4()
        print(answear)

    def run(self):
         self.print_meniu()
         while True:
            comanda = input(">>>")
            comanda = comanda.strip()
            if comanda == "":
                continue
            if comanda == "exit":
                if self.__isFile == 0:
                    return
                else:
                    self.__service_eveniment.saveFile()
                    self.__service_persoana.saveFile()
                    self.__service_inscrieri.saveFile()
                    return
            parti = comanda.split()
            nume_comanda = parti[0]
            self.__params = parti[1:]
            if nume_comanda in self.__comenzi:
                try:
                    self.__comenzi[nume_comanda]()
                except ValueError as ve:
                    print(ve)
                except ValidationError as ve:
                    print(ve)
                except RepoError as re:
                    print(re)
            else:
                print("comanda invalida!")
