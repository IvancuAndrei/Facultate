from domain.inscriere import *
import copy

class ServiceInscrieri:

    def __init__(self, __repo_inscrieri, __repo_evenimente, __repo_persoane):
        self.__repo_inscrieri = __repo_inscrieri
        self.__repo_evenimente = __repo_evenimente
        self. __repo_persoane = __repo_persoane

    def size(self):
        return len(self.__repo_inscrieri)

    def adauga_inscriere(self, persoana, eveniment):
        inscriere = Inscriere(persoana, eveniment)
        self.__repo_inscrieri.adauga_inscriere(inscriere)

    def cauta_inscriere_dupa_persoana(self, persoana):
        return self.__repo_inscrieri.cauta_inscriere_dupa_persoana(persoana)

    def sterge_inscriere_dupa_persoana(self, persoana):
        self.__repo_persoane.sterge_persoana_dupa_id(persoana.get_id_persoana())
        self.__repo_inscrieri.sterge_inscriere_dupa_persoana(persoana)

    def sterge_inscriere_dupa_eveniment(self, eveniment):
        self.__repo_evenimente.sterge_eveniment_dupa_id(eveniment.get_id_eveniment())
        self.__repo_inscrieri.sterge_inscriere_dupa_eveniment(eveniment)

    def get_all_inscrieri(self):
        return self.__repo_inscrieri.get_all_inscrieri()

    def raport_1(self, id_persoana):
        Persoana = self.__repo_persoane.cauta_persoana_dupa_id(id_persoana)
        Evenimente = []
        answear = ""
        for i in range(len(self.__repo_inscrieri)):
            if self.__repo_inscrieri.get(i).get_persoana() == Persoana:
                Evenimente.append(self.__repo_inscrieri.get(i).get_eveniment())
        # Evenimente = sorted(Evenimente, key = lambda x: (x.get_descriere_eveniment(), x.get_data_in_zile_eveniment()))
        self.selectionSortRec(Evenimente, 0, len(Evenimente))
        # Evenimente = self.shakeSort(Evenimente)
        if len(Evenimente):
            answear = f"{Persoana} ➜  {len(Evenimente)} evenimente:\n\n" if len(Evenimente) != 1 else f"{len(Evenimente)} eveniment:\n\n"
            for _eveniment in Evenimente:
                answear = answear + str(_eveniment) + "\n"
        return answear

    def raport_2(self):
        max = 0
        pFreq = [0 for _ in range(1000)]
        maxPersoane = []
        answear = ""
        for i in range(len(self.__repo_inscrieri)):
            pFreq[self.__repo_inscrieri.get(i).get_persoana().get_id_persoana()] += 1
            if pFreq[self.__repo_inscrieri.get(i).get_persoana().get_id_persoana()] > max:
                max = pFreq[self.__repo_inscrieri.get(i).get_persoana().get_id_persoana()]
                maxPersoane.clear()
                maxPersoane.append(self.__repo_inscrieri.get(i).get_persoana())
            elif pFreq[self.__repo_inscrieri.get(i).get_persoana().get_id_persoana()] == max:
                maxPersoane.append(self.__repo_inscrieri.get(i).get_persoana())
        if max:
            for _persoana in maxPersoane:
                answear = answear + f"{_persoana} ➜  {max} evenimente\n" if max != 1 else f"{_persoana} ➜  {max} eveniment\n"
        return answear

    def raport_4(self):
        max = 99999
        pFreq = [0 for _ in range(1000)]
        maxPersoane = []
        answear = ""
        for i in range(len(self.__repo_inscrieri)):
            pFreq[self.__repo_inscrieri.get(i).get_persoana().get_id_persoana()] += 1
            if pFreq[self.__repo_inscrieri.get(i).get_persoana().get_id_persoana()] < max:
                max = pFreq[self.__repo_inscrieri.get(i).get_persoana().get_id_persoana()]
                maxPersoane.clear()
                maxPersoane.append(self.__repo_inscrieri.get(i).get_persoana())
            elif pFreq[self.__repo_inscrieri.get(i).get_persoana().get_id_persoana()] == max:
                maxPersoane.append(self.__repo_inscrieri.get(i).get_persoana())
        if max:
            for _persoana in maxPersoane:
                answear = answear + f"{_persoana} ➜  {max} evenimente\n" if max != 1 else f"{_persoana} ➜  {max} eveniment\n"
        return answear

    def raport_3(self):
        __dict = {
            "eveniment": 0,
            "freq": 0
        }
        eFreq = [copy.deepcopy(__dict) for _ in range(1000)]
        evenimenteLen = 0
        answear = ""
        for i in range(len(self.__repo_inscrieri)):
            if eFreq[self.__repo_inscrieri.get(i).get_eveniment().get_id_eveniment()]["freq"] == 0:
                evenimenteLen += 1
            eFreq[self.__repo_inscrieri.get(i).get_eveniment().get_id_eveniment()]["freq"] += 1
            eFreq[self.__repo_inscrieri.get(i).get_eveniment().get_id_eveniment()]["eveniment"] = self.__repo_inscrieri.get(i).get_eveniment()
        eFreq = sorted(eFreq, key = lambda x: x["freq"], reverse = True)
        PrimiiLen = int(evenimenteLen * .2)
        if PrimiiLen:
            answear = f"{PrimiiLen} = 20% din {evenimenteLen} evenimente totale:\n\n" if evenimenteLen != 1 else f"{PrimiiLen} = 20% din {evenimenteLen} eveniment total:\n\n"
            for i in range(PrimiiLen):
                Eveniment = eFreq[i]["eveniment"]
                Freq = eFreq[i]["freq"]
                answear = answear + f"{Eveniment.get_descriere_eveniment()}(id: {Eveniment.get_id_eveniment()}, data: {Eveniment.get_data_eveniment()}, timp: {Eveniment.get_timp_eveniment()}) ➜  nr participanti: {Freq}\n"
        return answear

    def saveFile(self):
        self.__repo_inscrieri.saveFile()

    def cmpKey(self, a, b):
        return a < b

    def get_index_min(self, v, st, dr):
        minIndex = st
        for i in range(st, dr):
            if self.cmpKey(v[i], v[minIndex]):
                minIndex = i
        return minIndex

    def selectionSortRec(self, v, st, dr):
        if st == dr:
            return
        minIndex = self.get_index_min(v, st, dr)
        (v[st], v[minIndex]) = (v[minIndex], v[st])
        self.selectionSortRec(v, st + 1, dr)

    def shakeSort(self, v):
        sorted = False
        st = 0
        dr = len(v) - 1
        while (sorted == False):
            sorted = True
            for i in range(st, dr):
                if self.cmpKey(v[i + 1], v[i]):
                    v[i], v[i + 1] = v[i + 1], v[i]
                    sorted = False

            if sorted == True:
                return
            sorted = True

            dr = dr - 1
            for i in range(dr - 1, st - 1, -1):
                if self.cmpKey(v[i + 1], v[i]):
                    v[i], v[i + 1] = v[i + 1], v[i]
                    sorted = False
            st = st + 1
        return v