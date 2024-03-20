from domain.eveniment import Eveniment
from erori.exceptii import RepoError


class evenimentFileRepository:
    def __init__(self):
        self.__fileName = "persistenta\evenimente.txt"
        self.__evenimente = []
        self.loadFile()

    def get(self, i):
        return self.__evenimente[i]

    def __len__(self):
        return len(self.__evenimente)

    def adauga_eveniment(self, eveniment):
        for i in range(len(self.__evenimente)):
            if self.__evenimente[i].get_id_eveniment() == eveniment.get_id_eveniment():
                raise RepoError("eveniment existent!")
        self.__evenimente.append(eveniment)

    def cauta_eveniment_dupa_id(self, id_eveniment):
        for i in range(len(self.__evenimente)):
            if self.__evenimente[i].get_id_eveniment() == id_eveniment:
                return self.__evenimente[i]
        raise RepoError("eveniment inexistent!")

    def modifica_eveniment(self, eveniment):
        for i in range(len(self.__evenimente)):
            if self.__evenimente[i].get_id_eveniment == eveniment.get_id_eveniment():
                self.__evenimente[i] = eveniment
        raise RepoError("eveniment inexistent!")

    def get_all_evenimente(self):
        r = []
        for i in range(len(self.__evenimente)):
            eveniment = self.__evenimente[i]
            r.append(eveniment)
        return r

    def sterge_eveniment_dupa_id(self, id_eveniment):
        ok = 0
        for i in range(len(self.__evenimente)):
            if self.__evenimente[i].get_id_eveniment() == id_eveniment:
                ok = 1
                self.__evenimente.pop(i)
                break
        if ok == 0:
            raise RepoError("eveniment inexistent")

    def loadFile(self):
        with open(self.__fileName, "r") as f:
            for line in f:
                params = line.strip("\n").split()
                eveniment = Eveniment(int(params[0]), params[1], params[2], params[3])
                self.__evenimente.append(eveniment)

    def saveFile(self):
        with open(self.__fileName, "w") as f:
            for _eveniment in self.__evenimente:
                line = str( _eveniment.get_id_eveniment()) + " " + _eveniment.get_data_eveniment() + " " + _eveniment.get_timp_eveniment() + " " + _eveniment.get_descriere_eveniment() + "\n"
                f.write(line)