package com.example;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

public class Grammar {
    private List<String> terminals = new ArrayList<>();
    private List<String> nonTerminals = new ArrayList<>();
    private List<Rule> rules = new ArrayList<>();
    private String startSymbol;


    public Grammar(String filename){
        try{
            initializeGrammar(filename);
        } catch (FileNotFoundException e){
            System.out.println("File not found");
        }
    }

    private void initializeGrammar(String filename) throws FileNotFoundException {
        File file = new File(filename);
        Scanner scanner = new Scanner(file);

        String[] nT = scanner.nextLine().replaceAll("\\s", "").split(",");
        for (String s : nT){
            nonTerminals.add(s);
        }

        String[] t = scanner.nextLine().replaceAll("\\s", "").split(",");
        for (String s : t){
            terminals.add(s);
        }

        startSymbol = scanner.nextLine();

        while (scanner.hasNextLine()){
            String line = scanner.nextLine().trim();
            String[] parts = line.split(":");
            String key = parts[0];

            List<Production> productions = new ArrayList<>();
            String[] prod = parts[1].split("\\|");
            for(String p : prod){
                List<String> symbols = new ArrayList<>();
                for(String s : p.split(" ")){
                    if(!s.equals(""))
                        symbols.add(s);
                }
                productions.add(new Production(symbols));
            }
            rules.add(new Rule(key, productions));
        }
    }

    public boolean isLeftRecursive(){
        for (Rule r : rules){
            for(Production p : r.productions){
                if(p.symbols.get(0).equals(r.key))
                    return true;
            }
        }
        return false;
    }

    public boolean checkFirstSetConflict(){
        for(Rule r: rules){
            for(int i = 0; i < r.productions.size(); i++)
                for(int j = i + 1; j < r.productions.size(); j++){
                    if(r.productions.get(i).symbols.get(0).equals(r.productions.get(j).symbols.get(0)))
                        return true;
                }
        }
        return false;
    }

    public List<String> getTerminals() {
        return terminals;
    }

    public void setTerminals(List<String> terminals) {
        this.terminals = terminals;
    }

    public List<String> getNonTerminals() {
        return nonTerminals;
    }

    public void setNonTerminals(List<String> nonTerminals) {
        this.nonTerminals = nonTerminals;
    }

    public List<Rule> getRules() {
        return rules;
    }

    public void setRules(List<Rule> rules) {
        this.rules = rules;
    }

    public String getStartSymbol() {
        return startSymbol;
    }

    public void setStartSymbol(String startSymbol) {
        this.startSymbol = startSymbol;
    }


    public void print(){
        System.out.println("Terminals: ");
        for(String s : terminals){
            System.out.print(s + " ");
        }
        System.out.println();
        System.out.println("Non-terminals: ");
        for(String s : nonTerminals){
            System.out.print(s + " ");
        }
        System.out.println();
        System.out.println("Start symbol: " + startSymbol);
        System.out.println("Rules: ");
        for(Rule r : rules){
            System.out.print(r.key + " -> ");
            for(Production p : r.productions){
                System.out.print(p.size() + " ");
                for(String s : p.symbols){
                    System.out.print(s + ", ");
                }
                System.out.print("| ");
            }
            System.out.println();
        }
    }

}
