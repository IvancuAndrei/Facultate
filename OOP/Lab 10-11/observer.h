#pragma once
#include <bits/stdc++.h>


using namespace std;

class Observer{
public:
    virtual void update() = 0;
    virtual ~Observer() = default;
};

class Observable{
private:
    vector<Observer*> observers;
public:
    void addObserver(Observer* obs){
        observers.push_back(obs);
    }

    void notify(){
        for(auto obs: observers){
            obs->update();
        }
    }
};