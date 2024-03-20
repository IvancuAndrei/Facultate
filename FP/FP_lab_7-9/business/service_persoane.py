from domain.persoana import *
from erori.exceptii import *
import random
import string

class ServicePersoane:

    def __init__(self, __repo_persoane, __validator_persoana):
        self.__repo_persoane = __repo_persoane
        self.__validator_persoana = __validator_persoana

    def size(self):
        return len(self.__repo_persoane)

    def adauga_persoana(self, id_persoana, nume, adresa):
        persoana = Persoana(id_persoana, nume, adresa)
        self.__validator_persoana.valideaza(persoana)
        self.__repo_persoane.adauga_persoana(persoana)

    def cauta_persoana_dupa_id(self, id_persoana):
        return self.__repo_persoane.cauta_persoana_dupa_id(id_persoana)

    def cauta_persoana_dupa_id_rec(self, id_persoana, result = "", i = 0):
        if i >= len(self.__repo_persoane):
            if len(result):
                print(result)
            else:
                print("persoana inexistenta!")
            return
        if self.__repo_persoane.get(i).get_id_persoana() == id_persoana:
            result = result + str(self.__repo_persoane.get(i)) + "\n"
        self.cauta_persoana_dupa_id_rec(id_persoana, result, i + 1)

    def modifica_persoana(self, id_persoana, nume, adresa):
        persoana = Persoana(id_persoana, nume, adresa)
        self.__validator_persoana.valideaza(persoana)
        self.__repo_persoane.modifica_persoana(persoana)

    def sterge_persoana_dupa_id(self, id_persoana):
        self.__repo_persoane.sterge_persoana_dupa_id(id_persoana)

    def get_all_persoane(self):
        return self.__repo_persoane.get_all_persoane()

    def creeaza_persoane_random(self, nr_persoane):
        nr = 1
        while nr <= nr_persoane:
            id_persoana = random.randint(0, 4)
            nume = ''.join(random.choices(string.ascii_letters, k=5))
            adresa = ''.join(random.choices(string.ascii_letters, k=5))
            persoana = Persoana(id_persoana, nume, adresa)
            try:
                self.__repo_persoane.adauga_persoana(persoana)
            except RepoError:
                nr -= 1
            nr += 1

    def saveFile(self):
        self.__repo_persoane.saveFile()