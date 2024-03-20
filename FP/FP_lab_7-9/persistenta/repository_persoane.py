from erori.exceptii import RepoError
from domain.persoana import *

class RepoPersoane(object):

    def __init__(self):
        #self.__persoane = {}
        self.__persoane = []

    def __len__(self):
        return len(self.__persoane)

    def adauga_persoana(self, persoana):
        # if persoana.get_id_persoana() in self.__persoane:
        #     raise RepoError("persoana existenta!")
        # self.__persoane[persoana.get_id_persoana()]=persoana
        for _persoana in self.__persoane:
            if persoana == _persoana:
                raise RepoError("persoana existenta!")
        self.__persoane.append(persoana)

    def cauta_persoana_dupa_id(self, id_persoana):
        # if id_persoana not in self.__persoane:
        #     raise RepoError("persoana inexistenta!")
        # return self.__persoane[id_persoana]
        for persoana in self.__persoane:
            if persoana.get_id_persoana() == id_persoana:
                return persoana
        raise RepoError("persoana inexistenta!")

    def modifica_persoana(self, persoana):
        # if persoana.get_id_persoana() not in self.__persoane:
        #     raise RepoError("persoana inexistenta!")
        # self.__persoane[persoana.get_id_persoana()] = persoana
        ok = 0
        for i in range(len(self.__persoane)):
            if self.__persoane[i] == persoana:
                self.__persoane[i] = persoana
                return
        raise RepoError("persoana inexistenta!")

    def get_all_persoane(self):
        # r = []
        # for id_persoana in self.__persoane:
        #     persoana = self.__persoane[id_persoana]
        #     r.append(persoana)
        # return r
        r = []
        for persoana in self.__persoane:
            r.append(persoana)
        return r

    def sterge_persoana_dupa_id(self, id_persoana):
        # if id_persoana not in self.__persoane:
        #     raise RepoError("persoana inexistenta")
        # del self.__persoane[id_persoana]
        ok =0
        for persoana in self.__persoane:
            if persoana.get_id_persoana() == id_persoana:
                ok = 1
                self.__persoane.remove(persoana)
        if ok == 0:
            raise RepoError("persoana inexistenta")