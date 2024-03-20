class Inscriere(object):
    def __init__(self, persoana, eveniment):
        self.__persoana = persoana
        self.__eveniment = eveniment

    def get_persoana(self):
        return self.__persoana

    def get_eveniment(self):
        return self.__eveniment

    def set_persoana(self, obj):
        self.__persoana = obj

    def set_eveniment(self, obj):
        self.__eveniment = obj

    def __str__(self):
        return f"Persoana:({self.__persoana}) --> Eveniment:({self.__eveniment})"

    def __eq__(self, other):
        return self.__persoana == other.__persoana and self.__eveniment == other.__eveniment