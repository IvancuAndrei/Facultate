package com.example;

import java.io.File;
import java.io.FileNotFoundException;

import com.example.Analizator_lexical.TS.TSID;
import com.example.Analizator_lexical.TS.TSC;
import com.example.Analizator_lexical.FIP.FIP;

public class Main {
    public static void main(String[] args) throws FileNotFoundException {

        File program = new File("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 2\\Lab_2\\src\\main\\resources\\Analizator_lexical\\program.txt");

        TSID tsid = new TSID(program);
        TSC tsc = new TSC(program);
        FIP fip = new FIP(program, tsid, tsc);
        tsid.print("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 2\\Lab_2\\src\\main\\resources\\Analizator_lexical\\TSID.txt");
        tsc.print("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 2\\Lab_2\\src\\main\\resources\\Analizator_lexical\\TSC.txt");
        fip.print("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 2\\Lab_2\\src\\main\\resources\\Analizator_lexical\\FIP.txt");

    }
}