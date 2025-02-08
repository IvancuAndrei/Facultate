package com.example;

import java.io.File;
import java.io.FileNotFoundException;

import com.example.TS.TSID;
import com.example.TS.TSC;
import com.example.FIP.FIP;


public class Main {
            public static void main(String[] args) throws FileNotFoundException {

                File program = new File("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 1\\Analizator-lexical\\src\\main\\resources\\program.txt");

                TSID tsid = new TSID(program);
                TSC tsc = new TSC(program);
                FIP fip = new FIP(program, tsid, tsc);
        tsid.print("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 1\\Analizator-lexical\\src\\main\\resources\\TSID.txt");
        tsc.print("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 1\\Analizator-lexical\\src\\main\\resources\\TSC.txt");
        fip.print("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 1\\Analizator-lexical\\src\\main\\resources\\FIP.txt");

    }
}