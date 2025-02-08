package com.example;

public class LexicalUtils {

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

    public static boolean isIdentifier(String token){
        return token.matches("[a-zA-Z_][a-zA-Z0-9_]*");
    }

    public static boolean isConstant(String token){
        return token.matches("[0-9]+");
    }

    public static boolean isConstantFloat(String token){
        return token.matches("[0-9]+.[0-9]+");
    }

}
