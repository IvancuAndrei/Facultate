from business.service_inscrieri import *
from domain.inscriere import *
from persistenta.repository_inscrieri import *
from domain.eveniment import *
from persistenta.repository_evenimente import *
from persistenta.repository_persoane import *

class TesteInscrieri(object):

    def __init__(self):
        id_persoana = 23
        nume = "Andrei"
        adresa = "Valcea"
        id_eveniment = 13
        data = "23 ianuarie"
        timp = "1h 30"
        descriere = "Hustle Festival"
        persoana = Persoana(id_persoana, nume, adresa)
        eveniment = Eveniment(id_eveniment, data, timp, descriere)
        self.__persoana = persoana
        self.__eveniment = eveniment
        self.__inscriere = Inscriere(persoana, eveniment)

    def __ruleaza_teste_domeniu(self):
        assert(self.__inscriere.get_persoana() == self.__persoana)
        assert(self.__inscriere.get_eveniment() == self.__eveniment)
        clona_inscriere = Inscriere(self.__persoana, self.__eveniment)
        assert (self.__inscriere == clona_inscriere)
        assert (self.__inscriere.__eq__(clona_inscriere))

    def __ruleaza_teste_repo(self):
        self.__repo_inscrieri = RepoInscrieri()
        assert (len(self.__repo_inscrieri) == 0)
        self.__repo_inscrieri.adauga_inscriere(self.__inscriere)
        assert (len(self.__repo_inscrieri) == 1)
        self.__repo_inscrieri.sterge_inscriere_dupa_persoana(self.__persoana)
        assert (len(self.__repo_inscrieri) == 0)
        self.__repo_inscrieri.adauga_inscriere(self.__inscriere)
        self.__repo_inscrieri.sterge_inscriere_dupa_eveniment(self.__eveniment)
        assert (len(self.__repo_inscrieri) == 0)

    def __ruleaza_teste_service_inscrieri(self):
        self.__repo_inscrieri = RepoInscrieri()
        self.__repo_evenimente = RepoEvenimente()
        self.__repo_persoane = RepoPersoane()
        self.__service_inscrieri = ServiceInscrieri(self.__repo_inscrieri, self.__repo_evenimente, self.__repo_persoane)
        assert (self.__service_inscrieri.size() == 0)
        self.__service_inscrieri.adauga_inscriere(self.__persoana, self.__eveniment)
        assert (self.__service_inscrieri.size() == 1)
        inscriere_gasita = self.__service_inscrieri.cauta_inscriere_dupa_persoana(self.__persoana)
        assert (len(inscriere_gasita) == 1)
        try:
            self.__service_inscrieri.adauga_inscriere(self.__persoana, self.__eveniment)
            assert False
        except RepoError as re:
            assert (str(re) == "inscriere existenta!")
        self.__persoana_inexistenta = Persoana(10, "Vasile", "Cluj")
        try:
            self.__service_inscrieri.cauta_inscriere_dupa_persoana(self.__persoana_inexistenta)
            assert False
        except RepoError as re:
            assert (str(re) == "persoana inexistenta!")

    def ruleaza_toate_testele(self):
        self.__ruleaza_teste_domeniu()
        self.__ruleaza_teste_repo()
        self.__ruleaza_teste_service_inscrieri()

