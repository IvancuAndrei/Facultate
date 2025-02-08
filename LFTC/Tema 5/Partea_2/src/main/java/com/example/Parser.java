package com.example;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

public class Parser {

    private Analyzer analyzer;

    private static HashMap<Integer, String> atoms = new HashMap<>(){{
        put(0, "id");
        put(1, "const");
        put(2, "<");
        put(3, ">");
        put(4, "<=");
        put(5, ">=");
        put(6, "==");
        put(7, "!=");
        put(8, "+");
        put(9, "-");
        put(10, "*");
        put(11, "/");
        put(12, "=");
        put(13, "%");
        put(14, "&&");
        put(15, "or");
        put(16, "comma");
        put(17, ";");
        put(18, "{");
        put(19, "}");
        put(20, "(");
        put(21, ")");
        put(22, "struct");
        put(23, "cin");
        put(24, "cout");
        put(25, "if");
        put(26, "int");
        put(27, "double");
        put(28, "float");
        put(29, "while");
        put(30, "for");
        put(31, "endl");
        put(32, ">>");
        put(33, "<<");
    }};

    public Parser(Analyzer analyzer) {
        this.analyzer = analyzer;
    }

    public List<String> parse(String f) throws FileNotFoundException {

        File file = new File(f);
        Scanner scanner = new Scanner(file);
        String fip = "";
        boolean init = false;

        while(scanner.hasNextLine()){
            String line = scanner.nextLine().trim();
            if(!init) {
                fip = atoms.get(Integer.parseInt(line));
                init = true;
            }
            else
                fip = fip + " " + atoms.get(Integer.parseInt(line));
        }

        List<String> result = analyzer.analyze(fip);

        return result;

    }




}
