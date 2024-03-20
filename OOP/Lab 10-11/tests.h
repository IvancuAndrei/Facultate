#pragma once
#include <bits/stdc++.h>
using namespace std;

#include "service.h"

void testDomain(){
    Student s{1, "a", 1, "info"};
    assert(s.getNrMatricol() == 1);
    assert(s.getNume() == "a");
    assert(s.getVarsta() == 1);
    assert(s.getFacultate() == "info");

}

void testAddRepository(){
    StudentRepository repo = StudentRepository("tests.txt");
    Student student{1, "a", 1, "info"};
    repo.addStudent(student);

    assert(repo.getAllStudents().size() == 1);
    assert(repo.getAllStudents()[0] == student);

}

void testRemoveRepository(){
    StudentRepository repo = StudentRepository("tests.txt");
    Student student{1, "a", 1, "info"};
    repo.addStudent(student);
    repo.removeStudent(1);

    assert(repo.getAllStudents().size() == 0);
}

void testAddService(){
    StudentRepository repo = StudentRepository("tests.txt");
    StudentService service = StudentService(repo);
    service.addStudent(1, "a", 1, "info");

    assert(service.getAllStudents().size() == 1);
    assert(service.getAllStudents()[0].getNrMatricol() == 1);
    assert(service.getAllStudents()[0].getNume() == "a");
    assert(service.getAllStudents()[0].getVarsta() == 1);
    assert(service.getAllStudents()[0].getFacultate() == "info");
}

void testRemoveService(){
    StudentRepository repo = StudentRepository("tests.txt");
    StudentService service = StudentService(repo);
    service.addStudent(1, "a", 1, "info");
    service.removeStudent(1);

    assert(service.getAllStudents().size() == 0);
}



void testAll(){
    testDomain();
    testAddRepository();
    testRemoveRepository();
    testAddService();
    testRemoveService();
}

