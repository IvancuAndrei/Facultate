package com.example.Analizator_lexical.TS;

public class NodeBST {

    String valoare;
    String tip;
    String pozitie;
    NodeBST left, right;

    public NodeBST(String valoare, String tip, String pozitie) {
        this.valoare = valoare;
        this.tip = tip;
        this.pozitie = pozitie;
        this.left = null;
        this.right = null;
    }
}
