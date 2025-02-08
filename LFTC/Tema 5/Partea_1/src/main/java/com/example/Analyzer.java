package com.example;

import java.util.*;

public class Analyzer {
    private Grammar grammar;
    private Map<String, Set<String>> first = new HashMap<>();
    private Map<String, Set<String>> follow = new HashMap<>();
    private Map<String, Map<String, List<String>>> parsingTable = new HashMap<>();

    public Analyzer(Grammar grammar) {
        this.grammar = grammar;
        calculateFirst();
        calculateFollow();
        buildParsingTable();
    }

    private void calculateFirst() {

        List<String> terminals = grammar.getTerminals();
        List<String> nonTerminals = grammar.getNonTerminals();
        List<Rule> rules = grammar.getRules();


        for (String t : terminals) {
            Set<String> s = new HashSet<>();
            s.add(t);
            first.put(t, s);
        }
        for (String nT : nonTerminals) {
            Set<String> s = new HashSet<>();
            first.put(nT, s);
        }
        for (Rule r : rules) {
            for (Production p : r.productions) {
                if (p.isEpsilon())
                    first.get(r.key).add("@");
            }
        }

        boolean changed;

        while (true) {
            changed = false;
            for (Rule r : rules)
                for(Production p : r.productions) {
                    if (p.isEpsilon())
                        continue;
                    for (String s : p.symbols) {
                        if (terminals.contains(s)) {
                            if (!first.get(r.key).contains(s)) {
                                first.get(r.key).add(s);
                                changed = true;
                            }
                            break;
                        } else {
                            for (String f : first.get(s)) {
                            if (!first.get(r.key).contains(f) && !f.equals("@")) {
                                first.get(r.key).add(f);
                                changed = true;
                            }
                        }
                        if (!first.get(s).contains("@"))
                            break;
                    }
                }
                boolean allE = true;
                for (String s : p.symbols)
                    if (!first.get(s).contains("@"))
                        allE = false;
                if(allE)
                    first.get(r.key).add("@");
            }

            if (!changed)
                break;
        }

    }

    private void calculateFollow() {

        List<String> terminals = grammar.getTerminals();
        List<String> nonTerminals = grammar.getNonTerminals();
        List<Rule> rules = grammar.getRules();
        String startSymbol = grammar.getStartSymbol();


        for (String nT : nonTerminals)
            follow.put(nT, new HashSet<>());

        follow.get(startSymbol).add("$");

        boolean changed;

        while (true) {
            changed = false;
            for (Rule r : rules)
                for(Production p: r.productions) {
                    for (int i = 0; i < p.length(); i++) {
                        if (terminals.contains(p.getSymbol(i)) || p.getSymbol(i).equals("@"))
                            continue;
                        boolean notfoundE = false;
                        for (int j = i + 1; j < p.length(); j++) {
                            for (String f : first.get(p.getSymbol(j))) {
                                if (!f.equals("@") && !follow.get(p.getSymbol(i)).contains(f)) {
                                    follow.get(p.getSymbol(i)).add(f);
                                    changed = true;
                                }
                            }
                        if (!first.get(p.getSymbol(j)).contains("@")) {
                            notfoundE = true;
                            break;
                        }

                    }
                    if (!notfoundE) {
                        for (String f : follow.get(r.key)) {
                            if (!follow.get(p.getSymbol(i)).contains(f)) {
                                follow.get(p.getSymbol(i)).add(f);
                                changed = true;
                            }
                        }
                    }
                }
            }
            if (!changed)
                break;
        }
    }

    private void buildParsingTable() {

        List<String> terminals = grammar.getTerminals();
        List<String> nonTerminals = grammar.getNonTerminals();
        List<Rule> rules = grammar.getRules();

        for (String nT : nonTerminals)
            parsingTable.put(nT, new HashMap<>());

        for (String t : terminals)
            parsingTable.put(t, new HashMap<>());

        parsingTable.put("$", new HashMap<>());

        for (String line : parsingTable.keySet()) {
            for (String terminal : grammar.getTerminals())
                parsingTable.get(line).put(terminal, new ArrayList<>());
            parsingTable.get(line).put("$", new ArrayList<>());
        }

        for (Rule r : grammar.getRules())
            for(Production p: r.productions) {
                if (p.isEpsilon() || first.get(p.getSymbol(0)).contains("@")) {
                    for (String f : follow.get(r.key))
                        parsingTable.get(r.key).put(f, p.symbols);
                } else {
                    for (String f : first.get(p.getSymbol(0))) {
                        parsingTable.get(r.key).put(f, p.symbols);

                    }
            }
        }

        for (String t : terminals) {
            List<String> temp = new ArrayList<>();
            temp.add("pop");
            parsingTable.get(t).put(t, temp);
        }
        List<String> t = new ArrayList<>();
        t.add("acc");
        parsingTable.get("$").put("$", t);

        for (String line : parsingTable.keySet()) {
            for (String column : parsingTable.get(line).keySet()) {
                if (parsingTable.get(line).get(column).isEmpty()) {
                    List<String> temp = new ArrayList<>();
                    temp.add("error");
                    parsingTable.get(line).put(column, temp);
                }
            }
        }

    }


    public List<String> analyze(String input) {

        List<String> workingStack = new ArrayList<>();
        workingStack.add(grammar.getStartSymbol());
        workingStack.add("$");

        List<String> inputStack = new ArrayList<>();
        for (String s : input.split(" "))
            inputStack.add(s);
        inputStack.add("$");

        List<String> output = new ArrayList<>();

        boolean accepted = true;

        while (true) {
            if (workingStack.get(0).equals("@")) {
                workingStack = workingStack.subList(1, workingStack.size());
                continue;
            }

            // Pop operation
            if (parsingTable.get(workingStack.get(0)).get(inputStack.get(0)).get(0).equals("pop")) {
                output.add("POP: Removing " + workingStack.get(0) + " from working stack\n");
                workingStack = workingStack.subList(1, workingStack.size());
                inputStack = inputStack.subList(1, inputStack.size());
            }
            // Accept operation
            else if (parsingTable.get(workingStack.get(0)).get(inputStack.get(0)).get(0).equals("acc")) {
                output.add("ACCEPT: Input accepted\n");
                break;
            }
            // Error operation
            else if (parsingTable.get(workingStack.get(0)).get(inputStack.get(0)).get(0).equals("error")) {
                output.add("ERROR: No valid production for " + workingStack.get(0) + " and " + inputStack.get(0) + "\n");
                break;
            }
            // Production application
            else {
                List<String> production = parsingTable.get(workingStack.get(0)).get(inputStack.get(0));
                String appliedProduction = workingStack.get(0) + " -> " + String.join(" ", production);

                output.add("APPLY PRODUCTION: " + appliedProduction + "\n");

                workingStack = workingStack.subList(1, workingStack.size());
                for (int i = production.size() - 1; i >= 0; i--) {
                    List<String> temp = new ArrayList<>();
                    temp.add(production.get(i));
                    for (int j = 0; j < workingStack.size(); j++)
                        temp.add(workingStack.get(j));
                    workingStack = temp;
                }
            }

            // Add current state of stacks to output for better clarity
            output.add("WORKING STACK: " + String.join(" ", workingStack) + "\n");
            output.add("INPUT STACK: " + String.join(" ", inputStack) + "\n");
            output.add("----------------------------------\n");
        }

        return output;
    }

    public void printParsingTable(){
        // print the parsing table in a nice format where i can see the lines and columns
        System.out.println("Parsing Table:");
        for (String line : parsingTable.keySet()) {
            for (String column : parsingTable.get(line).keySet()) {
                System.out.print(line + " " + column + " ");
                for (String s : parsingTable.get(line).get(column))
                    System.out.print(s + " ");
                System.out.println();
            }
        }
    }
}


