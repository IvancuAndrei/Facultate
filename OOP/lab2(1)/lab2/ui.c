#include "ui.h"

void medicament_print(Medicament* medicament){
    printf("Cod: %s\tNume: %s\tConcentratie: %0.2f\tCantitate: %d\n",
           medicament_get_cod(medicament),
           medicament_get_nume(medicament),
           medicament_get_concentratie(medicament),
           medicament_get_cantitate(medicament)
    );
}

void citire_conc(double* nr)
{
    char* endptr;
    char sconc[10];
    printf("Concentratie:");
    scanf("%s", sconc);
    *nr = strtod(sconc, &endptr);
    if(IS_ERROR(ERANGE)) {
        printf("Concentratie introdusa gresit!\n");
        CLEAR_ERRORS;
        *nr = EROARE_CONC;
    }
}

Medicament* medicament_scan(){
    char nume[LGMAX_NUME], cod[LGMAX_COD], scant[10], sconc[10];
    double conc;
    int cant=0;
    printf("Cod:");
    scanf("%s", cod);
    printf("Nume:");
    scanf("%s", nume);
    printf("Concentratie:");
    scanf("%s", sconc);
    printf("Cantitate:");
    scanf("%s", scant);
    // convert strings to numeric
    for(int i=0;sconc[i];++i)
        if(!(isdigit(sconc[i]) || sconc[i]=='.')) {
            printf("Concentratie introdusa gresit!\n");
            return NULL;
        }
    for(int i=0;scant[i];++i)
        if(!isdigit(scant[i])){
            printf("Cantitate introdusa gresit!\n");
            return NULL;
        }
    char *endptr1, *endptr2;
    conc = strtod(sconc, &endptr1);
    if(IS_ERROR(ERANGE)) {
        printf("Concentratie introdusa gresit!\n");
        CLEAR_ERRORS;
        return NULL;
    }
    cant = strtol(scant, &endptr2, 10);
    if(IS_ERROR(ERANGE)){
        printf("Cantitate introdusa gresit!\n");
        CLEAR_ERRORS;
        return NULL;
    }
    Medicament* rez = medicament_create(cod, nume, conc, cant);
    return rez;
}

void repo_print(Repository* repository)
{
    int length = repository_get_length(repository);
    for(int i=0; i<length;++i)
        medicament_print(repository_get_element_at(repository, i));
}

void print_errs(int cod_eroare){
    if(cod_eroare>=EROARE_CANT)
        printf("Cantitatea introdusa gresit!\n"),
        cod_eroare -= EROARE_CANT;
    if(cod_eroare>=EROARE_CONC)
        printf("Concentratie introdusa gresit!\n"),
        cod_eroare -= EROARE_CONC;
    if(cod_eroare>=EROARE_NUME)
        printf("Nume introdus gresit!\n"),
        cod_eroare -= EROARE_NUME;
    if(cod_eroare>=EROARE_COD)
        printf("Cod introdus gresit!\n"),
        cod_eroare -= EROARE_COD;
}

void menu(Service* service, Repository* undo_lista){
    start:
    printf("\tMeniu:\n\na) Adaugare de noi medicamente. Daca medicamentul este deja in stoc trebuie actualizat cantitatea\n"
           "b) Actualizare medicamente (modificare nume, concentratie pentru un medicament din stoc)\n"
           "c) Stergerea intregului stoc dintr-un medicament dat\n"
           "d) Vizualizare medicamente din stoc, ordonat dupa nume, cantitate (crescator/descrescator)\n"
           "e) Vizualizare lista de medicamente filtrate dupa un criteriu (stoc/nume/concentratie).\n"
           "f) Undo.\n"
           "i) Iesire din aplicatie\n\n");
    read:
    printf("Introduceti comanda:");
    char cmd;
    scanf("%c", &cmd);
    cmd = tolower(cmd);
    if(isblank(cmd) || cmd=='\n' || cmd == '\0' || cmd == ' ') goto read;
    else if(cmd=='a') opt1(service, undo_lista);
    else if(cmd=='b') opt2(service, undo_lista);
    else if(cmd=='c') opt3(service, undo_lista);
    else if(cmd=='d') opt4(service);
    else if(cmd=='e') opt5(service);
    else if(cmd =='f') opt6(service, undo_lista);
    else if(cmd=='i') goto end;
    else printf("Comanda invalida!\n\n");
    goto start;
    end:
    return;
}
void opt1(Service* service, Repository *undo_lista){
    adauga_pas_undo(undo_lista, service->repository);
    Medicament* medicament = medicament_scan();
    if(medicament==NULL) return;
    int result = service_add(service, medicament_get_cod(medicament), medicament_get_nume(medicament),
                             medicament_get_concentratie(medicament), medicament_get_cantitate(medicament));
    medicament_delete(medicament);
    if(result != SUCCESS)
        print_errs(result);
    else
        printf("Operatie efectuata cu succes!\n");

}

void opt2(Service* service, Repository *undo_lista){
    adauga_pas_undo(undo_lista, service->repository);
    char nume[LGMAX_NUME], nounume[LGMAX_NUME], cod[LGMAX_COD];
    double conc, nouaconc;
    printf("Cod:");
    scanf("%s", cod);
    printf("Nume:");
    scanf("%s", nume);
    citire_conc(&conc);
    if(conc == EROARE_CONC) return;
    // noi
    printf("Nume nou:");
    scanf("%s", nounume);
    citire_conc(&nouaconc);
    if(nouaconc == EROARE_CONC) return;
    // service
    int result = service_modify(service, cod, nume, conc, nounume, nouaconc);
    if(result == SUCCESS)
    {
        printf("Operatie efectuata cu succes!\n");
        return;
    }
    if(result == NOT_FOUND)
    {
        printf("Medicamentul nu a fost gasit!\n");
        return;
    }
    print_errs(result);
}

void opt3(Service* service, Repository *undo_lista){
    adauga_pas_undo(undo_lista, service->repository);
    char cod[LGMAX_COD];
    printf("Cod:");
    scanf("%s", cod);
    int result = service_delete_cant(service, cod);
    if(result == NOT_FOUND)
        printf("Medicamentul nu a fost gasit!\n");
    else
        printf("Operatie efectuata cu succes!\n");


}

void opt4(Service* service){
    char ordine[20];
    printf("Introduceti ordinea:");
    scanf("%s", ordine);
    if(tolower(ordine[0])=='c') // crescator
        repository_sort(service->repository, medicament_compare, NORMAL);
    else if(tolower(ordine[0])=='d') // descrescator
        repository_sort(service->repository, medicament_compare, REVERSED);
    else{
        printf("Comanda invalida! Introduceti crescator sau descrescator!\n");
        return;
    }
    repo_print(service->repository);
}

void opt5(Service* service){
    char sfiltru[20];
    printf("Introduceti filtrul:");
    scanf("%s", sfiltru);
    if(tolower(sfiltru[0]) == 's') // cantitate
    {
        printf("Introduceti stocul maxim:");
        int stoc_max;
        scanf("%d", &stoc_max);
        Medicament* filtru = medicament_create_default();
        medicament_set_cantitate(filtru, stoc_max);
        Repository* filtrate = repository_filter(service->repository, filtru, filtru_cantitate);
        repo_print(filtrate);
        medicament_delete(filtru);
        repository_delete(filtrate);
        return;
    }
    if(tolower(sfiltru[0])=='n') // nume
    {
        printf("Introduceti caracterul cu care sa inceapa numele:");
        char lit[]="%";
        scanf(" %c", &lit[0]);
        Medicament* filtru = medicament_create_default();
        medicament_set_nume(filtru, lit);
        Repository* filtrate = repository_filter(service->repository, filtru, filtru_nume);
        repo_print(filtrate);
        medicament_delete(filtru);
        repository_delete(filtrate);
        return;
    }
    if(tolower(sfiltru[0]) == 'c')//concentratie
    {
        printf("Introduceti concentratia maxima:");
        double conc_max;
        scanf("%lf", &conc_max);
        Medicament* filtru = medicament_create_default();
        medicament_set_concentratie(filtru, conc_max);
        Repository* filtrate = repository_filter(service->repository, filtru, filtru_concentratie);
        repo_print(filtrate);
        medicament_delete(filtru);
        repository_delete(filtrate);
        return;
    }
    printf("Comanda invalida! Introduceti stoc sau nume!\n");
}

void opt6(Service *service, Repository *undo_lista){
    service->repository = executa_pas_undo(undo_lista, service->repository);
    printf("Operatia a fost efectuata cu succes!\n");
}
