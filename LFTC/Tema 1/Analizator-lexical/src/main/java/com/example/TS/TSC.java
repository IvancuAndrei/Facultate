package com.example.TS;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public class TSC extends TS{

    public TSC(File program) {
        super(program);
    }

    @Override
    protected void initTS() throws FileNotFoundException{
        Scanner reader = new Scanner(program);

        String lastKeyword = "";

        for(int i = 1; reader.hasNextLine(); i++){
            String line = reader.nextLine();
            line.trim();
            StringBuilder token = new StringBuilder();

            for(char c : line.toCharArray()){
                if(lexicalUtils.isOperator(Character.toString(c)) || lexicalUtils.isDelimiter(Character.toString(c)) || c == ' '){
                    if(!token.toString().isEmpty()){
                        if(lexicalUtils.isConstant(token.toString())){
                            this.add(token.toString(), "int");
                        } else if(lexicalUtils.isConstantFloat(token.toString())){
                            this.add(token.toString(), "float");
                        }
                        token = new StringBuilder();
                    }
                }
                else
                    token.append(c);

            }
            if(!token.toString().isEmpty()){
                if(lexicalUtils.isConstant(token.toString())){
                    this.add(token.toString(), "int");
                } else if(lexicalUtils.isConstantFloat(token.toString())){
                    this.add(token.toString(), "float");
                }
            }
        }

    }



}
