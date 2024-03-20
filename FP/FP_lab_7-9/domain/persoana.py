class Persoana(object):
    def __init__(self, id_persoana, nume, adresa):
        self.__id_persoana = id_persoana
        self.__nume = nume
        self.__adresa = adresa

    def get_id_persoana(self):
        return self.__id_persoana

    def get_nume_persoana(self):
        return self.__nume

    def get_adresa_persoana(self):
        return self.__adresa

    def set_nume_persoana(self, value):
        self.__nume = value

    def set_adresa_persoana(self, value):
        self.__adresa = value

    def __str__(self):
        return  f"Nume:{self.__nume} ID Persoana:{self.__id_persoana} Adresa:{self.__adresa}"

    def __eq__(self, other):
        return self.__id_persoana == other.__id_persoana
