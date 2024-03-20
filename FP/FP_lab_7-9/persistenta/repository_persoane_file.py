from domain.persoana import Persoana
from erori.exceptii import RepoError

class persoanaFileRepository:
    def __init__(self):
        self.__fileName = "persistenta/persoane.txt"
        self.__persoane = []
        self.loadFile()

    def get(self, i):
        return self.__persoane[i]

    def __len__(self):
        return len(self.__persoane)

    def adauga_persoana(self, persoana):
        for _persoana in self.__persoane:
            if persoana == _persoana:
                raise RepoError("persoana existenta!")
        self.__persoane.append(persoana)

    def cauta_persoana_dupa_id(self, id_persoana):
        for persoana in self.__persoane:
            if persoana.get_id_persoana() == id_persoana:
                return persoana
        raise RepoError("persoana inexistenta!")

    def modifica_persoana(self, persoana):
        for i in range(len(self.__persoane)):
            if self.__persoane[i] == persoana:
                self.__persoane[i] = persoana
                return
        raise RepoError("persoana inexistenta!")

    def get_all_persoane(self):
        r = []
        for persoana in self.__persoane:
            r.append(persoana)
        return r

    def sterge_persoana_dupa_id(self, id_persoana):
        ok = 0
        for persoana in self.__persoane:
            if persoana.get_id_persoana() == id_persoana:
                ok = 1
                self.__persoane.remove(persoana)
        if ok == 0:
            raise RepoError("persoana inexistenta")

    def loadFile(self):
        with open(self.__fileName, "r") as f:
            for line in f:
                params = line.strip("\n").split(" ")
                persoana = Persoana(int(params[0]), params[1], params[2])
                self.__persoane.append(persoana)

    def saveFile(self):
        with open(self.__fileName, "w") as f:
            for _persoana in self.__persoane:
                line = str(_persoana.get_id_persoana()) + " " + _persoana.get_nume_persoana() + " " + _persoana.get_adresa_persoana() + "\n"
                f.write(line)