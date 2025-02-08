package com.example;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Grammar grammar = new Grammar("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 5\\Partea_1\\src\\main\\resources\\gramatica.txt");

        if (grammar.isLeftRecursive() || grammar.checkFirstSetConflict()) {
            System.out.println("Gramatica este ambigua");
            System.exit(0);
        }

        Analyzer analyzer = new Analyzer(grammar);

        Scanner scanner = new Scanner(System.in);
        System.out.println("Introduceti sirul de analizat: ");
        String input = scanner.nextLine();

        if (analyzer.analyze(input).contains("error")) {
            System.out.println("Sirul nu este corect");
        } else {
            System.out.println(analyzer.analyze(input));
        }



    }


}