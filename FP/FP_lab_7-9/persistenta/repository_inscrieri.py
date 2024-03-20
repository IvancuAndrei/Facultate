from erori.exceptii import RepoError


class RepoInscrieri(object):

    def __init__(self):
        self.__inscrieri = []

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
                ok = 1

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