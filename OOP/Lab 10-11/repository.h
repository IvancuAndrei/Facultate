#pragma once
#include <bits/stdc++.h>
#include "domain.h"
using namespace std;

class StudentRepository {
private:
    vector<Student> students;
    string filename;
public:

    StudentRepository(string filename):filename{filename}{
        loadFile(filename);
    }

    void addStudent(Student& student){
        students.push_back(student);
        sort(students.begin(), students.end(), [](const Student& s1, const Student& s2){
            return s1.getVarsta() < s2.getVarsta();
        });
    }

    void removeStudent(int id){
        for(auto it = students.begin(); it != students.end(); ++it)
            if(it->getNrMatricol() == id){
                students.erase(it);
                return;
            }
    }

    void intinerire(){
        for(auto it = students.begin(); it != students.end(); ++it)
            it->setVarsta(it->getVarsta() - 1);
    }

    void imbatranire(){
        for(auto it = students.begin(); it != students.end(); ++it)
            it->setVarsta(it->getVarsta() + 1);
    }

    vector<Student> getAllStudents(){
        return students;
    }

    void loadFile(string filename){
        ifstream fin(filename);
        int nrMatricol, varsta;
        string nume, facultate;
        while(fin >> nrMatricol >> nume >> varsta >> facultate){
            Student student(nrMatricol, nume, varsta, facultate);
            students.push_back(student);
        }
        sort(students.begin(), students.end(), [](const Student& s1, const Student& s2){
            return s1.getVarsta() < s2.getVarsta();
        });
        fin.close();
    }

    void saveFile(string filename){
        ofstream fout(filename);
        for(auto s: students)
            fout << s;
        fout.close();
    }

    Student getStudent(int id){
        for(auto s: students)
            if(s.getNrMatricol() == id)
                return s;
    }


};