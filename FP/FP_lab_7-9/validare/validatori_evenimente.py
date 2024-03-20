from erori.exceptii import ValidationError


class ValidatorEvenimente(object):

    def valideaza(self, eveniment):
        erori = ""
        if eveniment.get_id_eveniment() < 0:
            erori += "id invalid!\n"
        if eveniment.get_data_eveniment() == "":
            erori += "data invalida!\n"
        if eveniment.get_timp_eveniment() == "":
            erori += "timp invalid!\n"
        if eveniment.get_descriere_eveniment() == "":
            erori += "descriere invalida!\n"
        if len(erori) > 0:
            raise ValidationError(erori)