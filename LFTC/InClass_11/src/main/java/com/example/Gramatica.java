package com.example;

import java.io.*;
import java.util.*;
import java.util.stream.Collectors;


public class Gramatica {
    private List<String> reguli;
    private Set<Character> neterminali;
    private Set<Character> terminali;


    public Gramatica(String fileName) throws IOException {
        reguli = new ArrayList<>();
        neterminali = new HashSet<>();
        terminali = new HashSet<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String regula = line.trim();
                reguli.add(regula);
                proceseazaSimboluri(regula);
            }
        }
    }

    private void proceseazaSimboluri(String regula) {
        for (char c : regula.toCharArray()) {
            if (Character.isUpperCase(c)) {
                neterminali.add(c);
            } else if (Character.isLowerCase(c)) {
                terminali.add(c);
            }
        }
    }

    public boolean existaNeterminal(char neterminal){
        return neterminali.contains(neterminal);
    }

    public List<String> getReguliCareContinNeterminal(char neterminal) {
        return reguli.stream()
                .filter(regula -> regula.indexOf(neterminal) != -1)
                .collect(Collectors.toList());
    }

}
