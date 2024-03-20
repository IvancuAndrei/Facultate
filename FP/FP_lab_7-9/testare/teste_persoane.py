from business.service_persoane import *
from domain.persoana import *
from validare.validatori_persoane import *
from erori.exceptii import *
from persistenta.repository_persoane import *


class TestePersoane(object):

    def __init__(self):
        self.__id_persoana = 23
        self.__nume = "Andrei"
        self.__adresa = "Valcea"
        self.__persoana = Persoana(self.__id_persoana, self.__nume, self.__adresa)

    def __ruleaza_teste_domeniu(self):
        assert (self.__persoana.get_id_persoana() == self.__id_persoana)
        assert (self.__persoana.get_nume_persoana() == self.__nume)
        assert (self.__persoana.get_adresa_persoana() == self.__adresa)
        clona_persoana=Persoana(self.__id_persoana, None, None)
        assert (self.__persoana == clona_persoana)
        assert (self.__persoana.__eq__(clona_persoana))
        assert (self.__persoana.__str__() == 'Nume:Andrei ID Persoana:23 Adresa:Valcea')

    def __ruleaza_teste_validare_persoana(self):
        self.__validator_persoana = ValidatorPersoane()
        self.__validator_persoana.valideaza(self.__persoana)
        self.__id_persoana_invalid = -23
        self.__nume_invalid = ""
        self.__adresa_invalida = ""
        self.__persoana_invalida = Persoana(self.__id_persoana_invalid, self.__nume_invalid, self.__adresa_invalida)
        try:
            self.__validator_persoana.valideaza(self.__persoana_invalida)
            assert False
        except ValidationError as ve:
            assert (str(ve)=="id invalid!\nnume invalid!\nadresa invalida!\n")

    def __ruleaza_teste_repo_persoane(self):
        self.__repo_persoane = RepoPersoane()
        assert (len(self.__repo_persoane) == 0)
        self.__repo_persoane.adauga_persoana(self.__persoana)
        assert (len(self.__repo_persoane) == 1)
        persoana_gasita = self.__repo_persoane.cauta_persoana_dupa_id(self.__id_persoana)
        assert (persoana_gasita.get_nume_persoana() == self.__persoana.get_nume_persoana())
        try:
            self.__repo_persoane.adauga_persoana(self.__persoana)
            assert False
        except RepoError as re:
            assert (str(re) == "persoana existenta!")
        self.__id_persoana_inexistenta = 24
        try:
            self.__repo_persoane.cauta_persoana_dupa_id(self.__id_persoana_inexistenta)
            assert False
        except RepoError as re:
            assert (str(re) == "persoana inexistenta!")
        self.__nume_nou = "Robert"
        self.__adresa_noua = "Vaslui"
        self.__persoana_modificata = Persoana(self.__id_persoana, self.__nume_nou, self.__adresa_noua)
        self.__repo_persoane.modifica_persoana(self.__persoana_modificata)
        assert (len(self.__repo_persoane) == 1)
        persoana_gasita = self.__repo_persoane.cauta_persoana_dupa_id(self.__id_persoana)
        assert (persoana_gasita.get_nume_persoana() == self.__nume_nou)
        self.__persoana_inexistenta = Persoana(self.__id_persoana_inexistenta, None, None)
        try:
            self.__repo_persoane.modifica_persoana(self.__persoana_inexistenta)
            assert False
        except RepoError as re:
            assert (str(re) == "persoana inexistenta!")
        self.__alta_persoana = Persoana(self.__id_persoana_inexistenta, self.__nume_nou, self.__adresa_noua)
        self.__repo_persoane.adauga_persoana(self.__alta_persoana)
        assert (len(self.__repo_persoane) == 2)
        _persoane = self.__repo_persoane.get_all_persoane()
        assert (len(_persoane) == 2)
        self.__repo_persoane.sterge_persoana_dupa_id(self.__id_persoana)
        _persoane = self.__repo_persoane.get_all_persoane()
        assert (len(_persoane) == 1)
        try:
            self.__repo_persoane.sterge_persoana_dupa_id(self.__id_persoana)
            assert False
        except RepoError as re:
            assert (str(re) == "persoana inexistenta")

    def __ruleaza_teste_service_persoane(self):
        self.__repo_persoane = RepoPersoane()
        self.__service_persoane = ServicePersoane(self.__repo_persoane, self.__validator_persoana)
        assert (self.__service_persoane.size()==0)
        self.__service_persoane.adauga_persoana(self.__id_persoana, self.__nume, self.__adresa)
        assert (self.__service_persoane.size()==1)
        persoana_gasita = self.__service_persoane.cauta_persoana_dupa_id(self.__id_persoana)
        assert (persoana_gasita.get_nume_persoana() == self.__nume)
        try:
            self.__service_persoane.adauga_persoana(self.__id_persoana, None, "Budesti")
            assert False
        except RepoError as re:
            assert (str(re)=="persoana existenta!")
        try:
            self.__service_persoane.cauta_persoana_dupa_id(self.__id_persoana_inexistenta)
            assert False
        except RepoError as re:
            assert (str(re)=="persoana inexistenta!")
        try:
            self.__service_persoane.adauga_persoana(self.__id_persoana_invalid, self.__nume_invalid, self.__adresa_invalida)
            assert False
        except ValidationError as ve:
            assert (str(ve)=="id invalid!\nnume invalid!\nadresa invalida!\n")
        try:
            self.__service_persoane.modifica_persoana(self.__id_persoana_inexistenta, None, "Goranu")
            assert False
        except RepoError as re:
            assert (str(re)=="persoana inexistenta!")
        self.__service_persoane.modifica_persoana(self.__id_persoana, self.__nume_nou, self.__adresa_noua)
        persoana_gasita = self.__service_persoane.cauta_persoana_dupa_id(self.__id_persoana)
        assert (persoana_gasita.get_nume_persoana()==self.__nume_nou)
        try:
            self.__service_persoane.sterge_persoana_dupa_id(self.__id_persoana_inexistenta)
            assert False
        except RepoError as re:
            assert (str(re)=="persoana inexistenta")
        self.__service_persoane.sterge_persoana_dupa_id(self.__id_persoana)
        assert (self.__service_persoane.size() == 0)

    def ruleaza_toate_testele(self):
        self.__ruleaza_teste_domeniu()
        self.__ruleaza_teste_validare_persoana()
        self.__ruleaza_teste_repo_persoane()
        self.__ruleaza_teste_service_persoane()





