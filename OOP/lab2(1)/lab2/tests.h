#ifndef LAB2_TESTS_H
#define LAB2_TESTS_H

#include "domain.h"
#include "validator.h"
#include "repository.h"
#include "service.h"

#include "assert.h"
#include "stdlib.h"

void test_medicament_getters(); // testez toti getterii
void test_medicament_setters(); // testez toti setterii
void test_medicament_externs(); // testez operatiile externe: egalitate, stergere stoc

void test_validator(); // testez validatorul

void test_repo_getters(); // testez getterii repo-ului
void test_repo_setters(); // testez setterii repo-ului
void test_repo_externs(); // testez operatiile externe: interschimbarea

// testez functionalitatile
void test_service();

void testall(); // apelez toate functiile de test

#endif //LAB2_TESTS_H
