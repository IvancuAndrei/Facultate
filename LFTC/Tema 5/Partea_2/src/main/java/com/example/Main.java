package com.example;

import java.io.FileNotFoundException;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws FileNotFoundException {

        Grammar grammar = new Grammar("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 5\\Partea_2\\src\\main\\resources\\gramatica.txt");

        if (grammar.isLeftRecursive() || grammar.checkFirstSetConflict()) {
            System.out.println("Gramatica este ambigua");
            System.exit(0);
        }

        Analyzer analyzer = new Analyzer(grammar);

//        Scanner scanner = new Scanner(System.in);
//        System.out.println("Introduceti sirul: ");
//        String input = scanner.nextLine();
//        if (analyzer.analyze(input).contains("error")) {
//            System.out.println("Sirul nu este corect");
//        } else {
//            System.out.println(analyzer.analyze(input));
//        }

        String fipFile = "D:\\Facultate - Github\\Facultate\\LFTC\\Tema 5\\Partea_2\\src\\main\\resources\\FIP.txt";
        Parser parser = new Parser(analyzer);
        if(parser.parse(fipFile).contains("error")){
            System.out.println("Fisierul nu a putut fi parsat cu succes");
        } else {
            System.out.println(parser.parse(fipFile));
        }




    }


}