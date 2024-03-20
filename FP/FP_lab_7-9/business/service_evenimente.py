from domain.eveniment import *


class ServiceEvenimente:

    def __init__(self, __repo_evenimente, __validator_eveniment):
        self.__repo_evenimente = __repo_evenimente
        self.__validator_eveniment = __validator_eveniment

    def size(self):
        return len(self.__repo_evenimente)

    def adauga_eveniment(self, id_eveniment, data, timp, descriere):
        eveniment = Eveniment(id_eveniment, data, timp, descriere)
        self.__validator_eveniment.valideaza(eveniment)
        self.__repo_evenimente.adauga_eveniment(eveniment)

    def cauta_eveniment_dupa_id(self, id_eveniment):
        return self.__repo_evenimente.cauta_eveniment_dupa_id(id_eveniment)

    def modifica_eveniment(self, id_eveniment, data, timp, descriere):
        eveniment = Eveniment(id_eveniment, data, timp, descriere)
        self.__validator_eveniment.valideaza(eveniment)
        self.__repo_evenimente.modifica_eveniment(eveniment)

    def sterge_eveniment_dupa_id(self, id_eveniment):
        self.__repo_evenimente.sterge_eveniment_dupa_id(id_eveniment)

    def get_all_evenimente(self):
        return self.__repo_evenimente.get_all_evenimente()

    def saveFile(self):
        self.__repo_evenimente.saveFile()