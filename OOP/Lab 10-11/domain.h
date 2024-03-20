#pragma once
#include <bits/stdc++.h>
using namespace std;

class Student{
private:
    int nrMatricol;
    string nume;
    int varsta;
    string facultate;
public:
    Student(int nrMatricol, string nume, int varsta, string facultate): nrMatricol{nrMatricol}, nume{nume}, varsta{varsta}, facultate{facultate}{}

    int getNrMatricol() const{
        return nrMatricol;
    }

    string getNume() const{
        return nume;
    }

    int getVarsta() const{
        return varsta;
    }

    string getFacultate() const{
        return facultate;
    }

    void setNrMatricol(int nrMatricol){
        this->nrMatricol = nrMatricol;
    }

    void setNume(string nume){
        this->nume = nume;
    }

    void setVarsta(int varsta){
        this->varsta = varsta;
    }

    void setFacultate(string facultate){
        this->facultate = facultate;
    }

    bool operator==(const Student& s){
        return nrMatricol == s.nrMatricol;
    }

    friend ostream& operator<<(ostream& os, const Student& s){
        os << s.nrMatricol << " " << s.nume << " " << s.varsta << " " << s.facultate << endl;
        return os;
    }

    friend istream& operator>>(istream& is, Student& s){
        is >> s.nrMatricol >> s.nume >> s.varsta >> s.facultate;
        return is;
    }

    void operator=(const Student& s){
        nrMatricol = s.nrMatricol;
        nume = s.nume;
        varsta = s.varsta;
        facultate = s.facultate;
    }







};

