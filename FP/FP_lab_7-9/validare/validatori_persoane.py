from erori.exceptii import ValidationError


class ValidatorPersoane(object):

    def valideaza(self, persoana):
        erori = ""
        if persoana.get_id_persoana() < 0:
            erori += "id invalid!\n"
        if persoana.get_nume_persoana() == "":
            erori += "nume invalid!\n"
        if persoana.get_adresa_persoana() == "":
            erori += "adresa invalida!\n"
        if len(erori) > 0:
            raise ValidationError(erori)