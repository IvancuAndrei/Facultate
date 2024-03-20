from business.service_evenimente import *
from domain.eveniment import *
from validare.validatori_evenimente import *
from erori.exceptii import *
from persistenta.repository_evenimente import *


class TesteEvenimente(object):

    def __init__(self):
        self.__id_eveniment = 23
        self.__data = "23 Ianuarie"
        self.__timp = "1h 30"
        self.__descriere = "Hustle Festival"
        self.__eveniment = Eveniment(self.__id_eveniment, self.__data, self.__timp, self.__descriere)

    def __ruleaza_teste_domeniu(self):
        assert (self.__eveniment.get_id_eveniment() == self.__id_eveniment)
        assert (self.__eveniment.get_data_eveniment() == self.__data)
        assert (self.__eveniment.get_timp_eveniment() == self.__timp)
        assert (self.__eveniment.get_descriere_eveniment() == self.__descriere)
        clona_eveniment = Eveniment(self.__id_eveniment, None, None, None)
        assert (self.__eveniment == clona_eveniment)
        assert (self.__eveniment.__eq__(clona_eveniment))
        assert (self.__eveniment.__str__() == 'Descriere: Hustle Festival Data: 23 Ianuarie Timp: 1h 30 ID Eveniment: 23')

    def __ruleaza_teste_validare_eveniment(self):
        self.__validator_eveniment = ValidatorEvenimente()
        self.__validator_eveniment.valideaza(self.__eveniment)
        self.__id_eveniment_invalid = -23
        self.__data_invalida = ""
        self.__timp_invalid = ""
        self.__descriere_invalida = ""
        self.__eveniment_invalid = Eveniment(self.__id_eveniment_invalid, self.__data_invalida, self.__timp_invalid, self.__descriere_invalida)
        try:
            self.__validator_eveniment.valideaza(self.__eveniment_invalid)
            assert False
        except ValidationError as ve:
            assert (str(ve) == "id invalid!\ndata invalida!\ntimp invalid!\ndescriere invalida!\n")

    def __ruleaza_teste_repo_evenimente(self):
        self.__repo_evenimente = RepoEvenimente()
        assert (len(self.__repo_evenimente) == 0)
        self.__repo_evenimente.adauga_eveniment(self.__eveniment)
        assert (len(self.__repo_evenimente) == 1)
        eveniment_gasit = self.__repo_evenimente.cauta_eveniment_dupa_id(self.__id_eveniment)
        assert (eveniment_gasit.get_data_eveniment() == self.__eveniment.get_data_eveniment())
        try:
            self.__repo_evenimente.adauga_eveniment(self.__eveniment)
            assert False
        except RepoError as re:
            assert (str(re) == "eveniment existent!")
        self.__id_eveniment_inexistent = 24
        try:
            self.__repo_evenimente.cauta_eveniment_dupa_id(self.__id_eveniment_inexistent)
            assert False
        except RepoError as re:
            assert (str(re) == "eveniment inexistent!")
        self.__data_noua = "12 Iunie"
        self.__timp_nou = "2h 30"
        self.__descriere_noua = "Neversea"
        self.__eveniment_modificat = Eveniment(self.__id_eveniment, self.__data_noua, self.__timp_nou, self.__descriere_noua)
        self.__repo_evenimente.modifica_eveniment(self.__eveniment_modificat)
        assert (len(self.__repo_evenimente) == 1)
        eveniment_gasit = self.__repo_evenimente.cauta_eveniment_dupa_id(self.__id_eveniment)
        assert (eveniment_gasit.get_data_eveniment() == self.__data_noua)
        self.__eveniment_inexistent = Eveniment(self.__id_eveniment_inexistent, None, None, None)
        try:
            self.__repo_evenimente.modifica_eveniment(self.__eveniment_inexistent)
            assert False
        except RepoError as re:
            assert (str(re) == "eveniment inexistent!")
        self.__alt_eveniment = Eveniment(self.__id_eveniment_inexistent, self.__data_noua, self.__timp_nou, self.__descriere_noua)
        self.__repo_evenimente.adauga_eveniment(self.__alt_eveniment)
        assert (len(self.__repo_evenimente) == 2)
        evenimente = self.__repo_evenimente.get_all_evenimente()
        assert (len(evenimente) == 2)
        self.__repo_evenimente.sterge_eveniment_dupa_id(self.__id_eveniment)
        assert (len(self.__repo_evenimente) == 1)
        try:
            self.__repo_evenimente.sterge_eveniment_dupa_id(self.__id_eveniment)
            assert False
        except RepoError as re:
            assert (str(re) == "eveniment inexistent")

    def __ruleaza_teste_service_evenimente(self):
        self.__repo_evenimente = RepoEvenimente()
        self.__service_evenimente = ServiceEvenimente(self.__repo_evenimente, self.__validator_eveniment)
        assert (self.__service_evenimente.size() == 0)
        self.__service_evenimente.adauga_eveniment(self.__id_eveniment, self.__data, self.__timp, self.__descriere)
        assert (self.__service_evenimente.size() == 1)
        eveniment_gasit = self.__service_evenimente.cauta_eveniment_dupa_id(self.__id_eveniment)
        assert (eveniment_gasit.get_data_eveniment() == self.__data)
        try:
            self.__service_evenimente.adauga_eveniment(self.__id_eveniment, None, "1h 30", "Light City")
            assert False
        except RepoError as re:
            assert (str(re) == "eveniment existent!")
        try:
            self.__service_evenimente.cauta_eveniment_dupa_id(self.__id_eveniment_inexistent)
            assert False
        except RepoError as re:
            assert (str(re) == "eveniment inexistent!")
        try:
            self.__service_evenimente.adauga_eveniment(self.__id_eveniment_invalid, self.__data_invalida, self.__timp_invalid, self.__descriere_invalida)
            assert False
        except ValidationError as ve:
            assert (str(ve) == "id invalid!\ndata invalida!\ntimp invalid!\ndescriere invalida!\n")
        try:
            self.__service_evenimente.modifica_eveniment(self.__id_eveniment_inexistent, None, "2h 15", "Rock Festival")
            assert False
        except RepoError as re:
            assert (str(re) == "eveniment inexistent!")
        self.__service_evenimente.modifica_eveniment(self.__id_eveniment, self.__data_noua, self.__timp_nou, self.__descriere_noua)
        eveniment_gasit = self.__service_evenimente.cauta_eveniment_dupa_id(self.__id_eveniment)
        assert (eveniment_gasit.get_data_eveniment() == self.__data_noua)
        try:
            self.__service_evenimente.sterge_eveniment_dupa_id(self.__id_eveniment_inexistent)
            assert False
        except RepoError as re:
            assert (str(re) == "eveniment inexistent")
        self.__service_evenimente.sterge_eveniment_dupa_id(self.__id_eveniment)
        assert (self.__service_evenimente.size() == 0)

    def ruleaza_toate_testele(self):
        self.__ruleaza_teste_domeniu()
        self.__ruleaza_teste_validare_eveniment()
        self.__ruleaza_teste_repo_evenimente()
        self.__ruleaza_teste_service_evenimente()





