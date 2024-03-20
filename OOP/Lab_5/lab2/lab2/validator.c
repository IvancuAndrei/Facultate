#include "validator.h"

int validate_cod(char* cod){
    if(cod == NULL)
        return EROARE_COD;
    if(strlen(cod) == 0)
        return EROARE_COD;
    for(int i=0; cod[i]; ++i)
        if(!isalnum(cod[i]))
            return EROARE_COD;
    return VALIDATOR_OK;
}
int validate_nume(char* nume){
    if(nume==NULL)
        return EROARE_NUME;
    if(strlen(nume) == 0)
        return EROARE_NUME;
    for(int i=0; nume[i]; ++i)
        if(!isalpha(nume[i]) && !isblank(nume[i]))
            return EROARE_NUME;
    return VALIDATOR_OK;
}
int validate_concentratie(double concentratie){
    if(concentratie<=0 || concentratie>100.0)
        return EROARE_CONC;
    return VALIDATOR_OK;
}
int validate_cantitate(int cantitate){
    if(cantitate > 0)
        return VALIDATOR_OK;
    return EROARE_CANT;
}
int validate_madicament(Medicament* medicament){
    return  validate_cod(medicament_get_cod(medicament)) |
            validate_nume(medicament_get_nume(medicament)) |
            validate_concentratie(medicament_get_concentratie(medicament)) |
            validate_cantitate(medicament_get_cantitate(medicament));
}