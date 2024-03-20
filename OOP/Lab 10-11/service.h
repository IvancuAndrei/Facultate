#pragma once
#include <bits/stdc++.h>
using namespace std;

#include "repository.h"
#include "observer.h"

class StudentService:public Observable{
private:
    StudentRepository& repo;
public:

    StudentService(StudentRepository& repo): repo{repo}{}

    void addStudent(int nrMatricol, string nume, int varsta, string facultate){
        Student student{nrMatricol, nume, varsta, facultate};
        repo.addStudent(student);
        notify();
    }

    void removeStudent(int nrMatricol){
        Student student{nrMatricol, "a",1,"info"};
        repo.removeStudent(nrMatricol);
        notify();
    }

    void intinerire(){
        repo.intinerire();
        notify();
    }

    void imbatranire(){
        repo.imbatranire();
        notify();
    }

    vector<Student> getAllStudents(){
        return repo.getAllStudents();
    }


};