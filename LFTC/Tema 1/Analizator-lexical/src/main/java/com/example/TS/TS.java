package com.example.TS;

import com.example.LexicalUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public abstract class TS {

    protected NodeBST root;
    private String pozitie_contor;

    protected File program;
    protected LexicalUtils lexicalUtils = new LexicalUtils();

    public TS(File program) {
        this.root = null;
        pozitie_contor = "r";
        this.program = program;
        try{
            initTS();
        } catch (FileNotFoundException e) {
            System.out.println("Fisierul nu a fost gasit: " + e);
        }
    }

    protected void add(String valoare, String tip) {
        if (this.root == null) {
            this.root = new NodeBST(valoare, tip, pozitie_contor);

        } else {
            this.addRec(this.root, valoare, tip);
        }
    }

    protected void addRec(NodeBST node, String valoare, String tip) {
        if (valoare.compareTo(node.valoare) < 0) {
            if (node.left == null) {
                pozitie_contor += "L";
                node.left = new NodeBST(valoare, tip, this.pozitie_contor);
            } else {
                this.addRec(node.left, valoare, tip);
            }
        } else if(valoare.compareTo(node.valoare) > 0){
            if (node.right == null) {
                pozitie_contor += "R";
                node.right = new NodeBST(valoare, tip, this.pozitie_contor);
            } else {
                this.addRec(node.right, valoare, tip);
            }
        }
    }

    public String getPozitie(String valoare){
        return this.getPozitieRec(this.root, valoare);
    }

    protected String getPozitieRec(NodeBST node, String valoare){
        if(node == null){
            return null;
        }
        if(valoare.compareTo(node.valoare) == 0){
            return node.pozitie;
        }
        if(valoare.compareTo(node.valoare) < 0){
            return this.getPozitieRec(node.left, valoare);
        }
        return this.getPozitieRec(node.right, valoare);
    }

    public String getValoare(String pozitie){
        for(char i: pozitie.toCharArray()){
            if(i == 'L'){
                this.root = this.root.left;
            } else if(i == 'R'){
                this.root = this.root.right;
            }
        }
        return this.root.valoare;
    }


    protected abstract void initTS() throws FileNotFoundException;

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
            printRec(this.root, printWriter);
        } catch (IOException e) {
            System.out.println("Fisierul nu a putut fi deschis: " + e);
        }
    }

    private void printRec(NodeBST node, PrintWriter printWriter) throws IOException{
        if(node != null){
            printRec(node.left, printWriter);
            printWriter.println(node.valoare + " " + node.tip);
            printRec(node.right, printWriter);
        }
    }
}
