#include "service.h"

Service* service_create(Repository* repository){
    Service* service = malloc(sizeof(Service));
    service->repository = repository;
    return service;
}

int service_length(Service* service)
{
    return repository_get_length(service->repository);
}

Medicament* service_element(Service* service, int index)
{
    if(service_length(service) == 0) return NULL;
    return service->repository->elements[index];
}

int service_add(Service* service, char* cod, char* nume, double concentratie, int cantitate){
    // 1. creez
    Medicament* medicament = medicament_create(cod, nume, concentratie, cantitate);
    // 2. validez
    int cod_eroare = validate_madicament(medicament);
    if(cod_eroare != SUCCESS) {
        medicament_delete(medicament);
        return cod_eroare;
    }
    // 3. adaug
    int index = repository_index_of(service->repository, medicament);
    if(index == NOT_FOUND) {
        repository_add(service->repository, medicament);
        return SUCCESS;
    }
    else{
        int cant_to_add = medicament_get_cantitate(medicament);
        medicament_delete(medicament);
        Medicament* elem = repository_get_element_at(service->repository, index);
        int cant = medicament_get_cantitate(elem);
        medicament_set_cantitate(elem, cant+cant_to_add);
        return SUCCESS;
    }
}

int service_modify(Service* service, char* cod, char* nume, double conc, char* nounume, double nouaconc)
{
    Medicament* medicament = medicament_create(cod, nume, conc, 1);
    int result = validate_madicament(medicament);
    if(result != SUCCESS) { medicament_delete(medicament); return result;}
    result = validate_nume(nounume) + validate_concentratie(nouaconc);
    if(result != SUCCESS) { medicament_delete(medicament); return result;}

    int index = repository_index_of(service->repository, medicament);
    medicament_delete(medicament);
    if(index == NOT_FOUND) return NOT_FOUND;
    medicament = repository_get_element_at(service->repository, index);
    medicament_set_nume(medicament, nounume);
    medicament_set_concentratie(medicament, nouaconc);
    //repository_set_element_at(service->repository, index, medicament);
    return SUCCESS;
}

int service_delete_cant(Service* service, char* cod)
{
    Medicament* medicament = NULL;
    for(int i=0;i< service_length(service);++i)
    {
        medicament = service_element(service, i);
        if(strcmp(medicament_get_cod(medicament), cod)==0)
            break;
        medicament = NULL;
    }
    if(medicament == NULL) return NOT_FOUND;
    medicament_set_cantitate(medicament, 0);
    return SUCCESS;
}

void service_delete(Service* service)
{
    for(int i=0;i< service_length(service);++i)
    {
        Medicament* medicament = service_element(service, i);
        if(medicament!=NULL) medicament_delete(medicament);
    }
    repository_delete(service->repository);
    free(service);
}