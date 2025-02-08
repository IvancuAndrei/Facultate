package com.example.FIP;

public class ElementFIP {
    private int index;
    private String pozitie;

    public ElementFIP(int index, String pozitie) {
        this.index = index;
        this.pozitie = pozitie;
    }

    public int getIndex() {
        return index;
    }

    public String getPozitie() {
        return pozitie;
    }

    @Override
    public String toString() {
        return  index + " " + pozitie;
    }
}
