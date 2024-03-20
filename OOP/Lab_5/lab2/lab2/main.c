#include "tests.h"
#include "ui.h"
/**
 * set
 * @return
 */
int main() {
    testall();
    Repository* undo_lista = repository_create(medicament_eq);
    Repository* repository = repository_create(medicament_eq);
    Service* s = service_create(repository);
    menu(s, undo_lista);
    service_delete(s);
    for(int i = 0; i < undo_lista->length; i++){
        for(int j = 0; j < repository_get_length(undo_lista->elements[i]); j++) {
            Medicament *medicament = repository_get_element_at(undo_lista->elements[i], j);
            medicament_delete(medicament);
        }
        repository_delete(undo_lista->elements[i]);
    }
    repository_delete(undo_lista);

    return 0;
}
