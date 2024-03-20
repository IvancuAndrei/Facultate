class Eveniment(object):
    def __init__(self, id_eveniment, data, timp, descriere):
        self.__id_eveniment = id_eveniment
        self.__data = data
        self.__timp = timp
        self.__descriere = descriere

    def get_id_eveniment(self):
        return self.__id_eveniment

    def get_data_eveniment(self):
        return self.__data

    def get_timp_eveniment(self):
        return self.__timp

    def get_descriere_eveniment(self):
        return self.__descriere

    def set_data_eveniment(self, value):
        self.__data = value

    def set_timp_eveniment(self, value):
        self.__timp = value

    def set_descriere_eveniment(self, value):
        self.__descriere = value

    def get_data_in_zile_eveniment(self):
        _data = self.__data.split(".")
        return int(_data[0]) + 30 * int(_data[1])


    def __str__(self):
        return  f"Descriere: {self.__descriere} Data: {self.__data} Timp: {self.__timp} ID Eveniment: {self.__id_eveniment}"

    def __eq__(self, other):
        return self.__id_eveniment == other.__id_eveniment

    def __lt__(self, other):
        if self.get_descriere_eveniment() == other.get_descriere_eveniment():
            _data = self.__data.split(".")
            _data2 = other.__data.split(".")
            return int(_data[0]) + 30 * int(_data[1]) > int(_data2[0]) + 30 * int(_data2[1])
        return self.get_descriere_eveniment() < other.get_descriere_eveniment()
