package com.example.Analizator_lexical;

import com.example.FiniteMachine.FiniteStateMachine;

import java.io.File;


public class LexicalUtils {

    private FiniteStateMachine fsm_identifier;
    private FiniteStateMachine fsm_integer;
    private FiniteStateMachine fsm_real;

    public LexicalUtils(){
        fsm_identifier = new FiniteStateMachine(new File("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 2\\Lab_2\\src\\main\\resources\\FiniteMachines\\identifier.txt"));
        fsm_integer = new FiniteStateMachine(new File("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 2\\Lab_2\\src\\main\\resources\\FiniteMachines\\integer.txt"));
        fsm_real = new FiniteStateMachine(new File("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 2\\Lab_2\\src\\main\\resources\\FiniteMachines\\real.txt"));
    }

    public static boolean isOperator(String c){
        return c.equals("+") || c.equals("-") || c.equals("*") || c.equals("/") || c.equals("%") || c.equals("=") || c.equals("<") || c.equals(">") || c.equals("!=") || c.equals("<=") || c.equals(">=") || c.equals("&&") || c.equals("||") || c.equals("<<") || c .equals(">>") || c.equals("==");
    }

    public static boolean isDelimiter(String c){
        return c.equals("(") || c.equals(")") || c.equals("{") || c.equals("}") ||  c.equals(";") || c.equals(",");
    }

    public static boolean isKeyword(String token){
        String[] keywords = {"struct", "cin", "cout", "if", "int", "double", "float", "while", "for", "else", "endl"};
        for(String keyword : keywords){
            if(token.equals(keyword)){
                return true;
            }
        }
        return false;
    }

    //public static boolean isIdentifier(String token) { return token.matches("[a-zA-Z_][a-zA-Z0-9_]*"); }

    //public static boolean isConstant(String token) { return token.matches("[0-9]+"); }

    //public static boolean isConstantFloat(String token) { return token.matches("[0-9]+.[0-9]+"); }

    public boolean isIdentifierAF(String token){
        return fsm_identifier.isAccepted(token);
    }

    public boolean isIntegerAF(String token){
        return fsm_integer.isAccepted(token);
    }

    public boolean isRealAF(String token){
        return fsm_real.isAccepted(token);
    }



}
