package com.example;

import java.util.List;

public class Production {
    List<String> symbols;

    public Production(List<String> symbols){
        this.symbols = symbols;
    }

    public List<String> getSymbols(){
        return symbols;
    }

    public String getSymbol(int index){
        return symbols.get(index);
    }

    public int size(){
        return symbols.size();
    }

    public boolean isEpsilon(){
        return symbols.size() == 1 && symbols.get(0).equals("@");
    }

    public int length(){
        return symbols.size();
    }

}
