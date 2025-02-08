package com.example;

import java.util.List;

public class Rule {
    String key;
    List<Production> productions;

    public Rule(String key, List<Production> productions) {
        this.key = key;
        this.productions = productions;
    }

    public String getKey(){
        return key;
    }

    public List<Production> getProductions(){
        return productions;
    }

    public Production getProduction(int index){
        return productions.get(index);
    }

    public int size(){
        return productions.size();
    }


}
