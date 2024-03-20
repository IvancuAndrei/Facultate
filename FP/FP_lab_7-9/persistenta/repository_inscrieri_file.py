from domain.persoana import Persoana
from domain.eveniment import Eveniment
from domain.inscriere import Inscriere
from erori.exceptii import RepoError


class inscrieriFileRepository:
    def __init__(self):
        self.__fileName = "persistenta\inscrieri.txt"
        self.__inscrieri = []
        self.loadFile()

    def __len__(self):
        return len(self.__inscrieri)

    def adauga_inscriere(self, inscriere):
        for _inscriere in self.__inscrieri:
            if _inscriere == inscriere:
                raise RepoError("inscriere existenta!")
        self.__inscrieri.append(inscriere)

    def get_all_inscrieri(self):
        return self.__inscrieri

    def sterge_inscriere_dupa_persoana(self, persoana):
        for inscriere in self.__inscrieri:
            if inscriere.get_persoana() == persoana:
                self.__inscrieri.remove(inscriere)


    def sterge_inscriere_dupa_eveniment(self, eveniment):
        for inscriere in self.__inscrieri:
            if inscriere.get_eveniment() == eveniment:
                self.__inscrieri.remove(inscriere)

    def cauta_inscriere_dupa_persoana(self, persoana):
        _inscrieri = []
        for inscriere in self.__inscrieri:
            if inscriere.get_persoana() == persoana:
                _inscrieri.append(inscriere)
        if len(_inscrieri) == 0:
            raise RepoError("persoana inexistenta!")
        return _inscrieri

    def get(self, i):
        return self.__inscrieri[i]

    def loadFile(self):
        with open(self.__fileName, "r") as f:
            for line in f:
                params = line.strip("\n").split(" ")
                persoana = Persoana(int(params[0]), params[1], params[2])
                eveniment = Eveniment(int(params[3]), params[4], params[5], params[6])
                inscriere = Inscriere(persoana, eveniment)
                self.__inscrieri.append(inscriere)

    def saveFile(self):
        with open(self.__fileName, "w") as f:
            for _inscriere in self.__inscrieri:
                line = str(_inscriere.get_persoana().get_id_persoana()) + " " + _inscriere.get_persoana().get_nume_persoana() + " " + _inscriere.get_persoana().get_adresa_persoana() + " " + str(_inscriere.get_eveniment().get_id_eveniment()) + " " + _inscriere.get_eveniment().get_descriere_eveniment() + " " + _inscriere.get_eveniment().get_data_eveniment() + " " + _inscriere.get_eveniment().get_timp_eveniment() + "\n"
                f.write(line)