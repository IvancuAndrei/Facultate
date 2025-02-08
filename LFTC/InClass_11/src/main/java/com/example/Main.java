package com.example;

import java.io.*;
import java.util.*;
import java.util.stream.Collectors;
import com.example.Gramatica;

public class Main {

    public static void main(String[] args) {
        try {

            Gramatica gramatica = new Gramatica("D:\\Facultate - Github\\Facultate\\LFTC\\InClass_11\\src\\main\\resources\\gramatica.txt");
            Scanner scanner = new Scanner(System.in);

            while (true) {
                System.out.println("Scrie-ti neterminalul: ");
                String mesaj = scanner.next();
                if(mesaj.equals("stop"))
                    break;

                char neterminal = mesaj.charAt(0);

                if (!gramatica.existaNeterminal(neterminal)) {
                    System.out.println("Nu exista acest neterminal!");
                } else {
                    List<String> reguliCuNeterminal = gramatica.getReguliCareContinNeterminal(neterminal);
                    System.out.println("Reguli care contin neterminalul '" + neterminal + "':");
                    for (String regula : reguliCuNeterminal) {
                        System.out.println(regula);
                    }
                }
            }
        }
        catch (IOException e) {
            System.err.println("Eroare la citirea fisierului: " + e.getMessage());
        }





    }
}