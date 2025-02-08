package com.example.FIP;

import com.example.LexicalUtils;
import com.example.TS.TS;


import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.io.File;


public class FIP {


    private List<ElementFIP> elements = new ArrayList<>();

    private File program;
    private LexicalUtils lexicalUtils = new LexicalUtils();
    private TS tsid, tsc;

    private static HashMap<String, Integer> atoms = new HashMap<>(){{
        put("ID", 0);
        put("CONST", 1);
        put("<", 2);
        put(">", 3);
        put("<=", 4);
        put(">=", 5);
        put("==", 6);
        put("!=", 7);
        put("+", 8);
        put("-", 9);
        put("*", 10);
        put("/", 11);
        put("=", 12);
        put("%", 13);
        put("&&", 14);
        put("||", 15);
        put(",", 16);
        put(";", 17);
        put("{", 18);
        put("}", 19);
        put("(", 20);
        put(")", 21);
        put("struct", 22);
        put("cin", 23);
        put("cout", 24);
        put("if", 25);
        put("int", 26);
        put("double", 27);
        put("float", 28);
        put("while", 29);
        put("for", 30);
        put("else", 31);
        put("endl", 32);
        put(">>", 33);
        put("<<", 34);
    }};

    public FIP(File program, TS tsid, TS tsc){
        this.program = program;
        this.tsid = tsid;
        this.tsc = tsc;
        try{
            initFIP();
        } catch (Exception e) {
            System.out.println("Fisierul nu a fost gasit: " + e);
        }
    }

    private boolean processToken(String token){
        if (lexicalUtils.isKeyword(token)) {
            elements.add(new ElementFIP(atoms.get(token), null));
            return true;
        } else if (lexicalUtils.isIdentifier(token)) {
            elements.add(new ElementFIP(atoms.get("ID"), tsid.getPozitie(token)));
            return true;
        } else if (lexicalUtils.isConstant(token)) {
            elements.add(new ElementFIP(atoms.get("CONST"), tsc.getPozitie(token)));
            return true;
        } else if (lexicalUtils.isConstantFloat(token)) {
            elements.add(new ElementFIP(atoms.get("CONST"), tsc.getPozitie(token)));
            return true;
        } else if (lexicalUtils.isDelimiter(token)) {
            elements.add(new ElementFIP(atoms.get(token), null));
            return true;
        }
        else if(lexicalUtils.isOperator(token)){
            elements.add(new ElementFIP(atoms.get(token), null));
            return true;
        }
        return false;
    }

    private void initFIP() throws FileNotFoundException {

        Scanner reader = new Scanner(program);

        for (int i = 1; reader.hasNextLine(); i++) {
            String line = reader.nextLine();
            line = line.trim();

            StringBuilder token = new StringBuilder();
            for (int j = 0; j < line.length(); j++) {
                char c = line.charAt(j);

                if(Character.isLetter(c)){
                    if(!token.toString().isEmpty()){
                        if(lexicalUtils.isDelimiter(token.toString())){
                            elements.add(new ElementFIP(atoms.get(token.toString()), null));
                            token = new StringBuilder();
                        } else if(lexicalUtils.isOperator(token.toString())){
                            elements.add(new ElementFIP(atoms.get(token.toString()), null));
                            token = new StringBuilder();
                        }
                    }
                        token.append(c);
                } else if(Character.isDigit(c)){
                    if (!token.toString().isEmpty()){
                        if(lexicalUtils.isDelimiter(token.toString())){
                            elements.add(new ElementFIP(atoms.get(token.toString()), null));
                            token = new StringBuilder();
                        } else if(lexicalUtils.isOperator(token.toString())){
                            elements.add(new ElementFIP(atoms.get(token.toString()), null));
                            token = new StringBuilder();
                        }
                    }
                    token.append(c);
                } else if (lexicalUtils.isOperator(Character.toString(c))) {
                    if (!token.toString().isEmpty()) {
                        if (!lexicalUtils.isOperator(token.toString()) && !processToken(token.toString())) {
                            System.out.println("Eroare la linia " + i + " si coloana " + j);
                        }
                        token = new StringBuilder();
                    }
                    token.append(c);

                } else if (lexicalUtils.isDelimiter(Character.toString(c))){
                    if (!token.toString().isEmpty()) {
                        if (!lexicalUtils.isDelimiter(token.toString()) && !processToken(token.toString())) {
                            System.out.println("Eroare la linia " + i + " si coloana " + j);
                        }
                        token = new StringBuilder();
                    }
                    token.append(c);
                }
                else if(c == ' '){
                    if (!token.toString().isEmpty()) {
                        if (!processToken(token.toString()))
                            System.out.println("Eroare la linia " + i + " si coloana " + j);
                        token = new StringBuilder();
                    }
                } else {
                    token.append(c);
                }

            }
            if (!token.toString().isEmpty()) {
                if (!processToken(token.toString()))
                    System.out.println("Eroare la linia " + i + " si coloana " + line.length());
            }
        }
    }

    public void print(String filename){
        File file = new File(filename);

        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                System.out.println("Fisierul nu a putut fi creat: " + e);
            }
        }
        try(PrintWriter printWriter = new PrintWriter(file)){
            for(ElementFIP element : elements){
                printWriter.println(element);
            }
        } catch (IOException e) {
            System.out.println("Fisierul nu a putut fi deschis: " + e);
        }

    }


}
