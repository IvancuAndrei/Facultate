package com.example.TS;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class TSID extends TS{

    public TSID(File program) {
        super(program);
    }

    protected void initTS() throws FileNotFoundException {
        String lastKeyword = "";
        Scanner reader = new Scanner(program);

        for(int i = 1; reader.hasNextLine(); i++){
            String line = reader.nextLine();
            line.trim();
            StringBuilder token = new StringBuilder();

            for(char c : line.toCharArray()){
                if(lexicalUtils.isOperator(Character.toString(c)) || lexicalUtils.isDelimiter(Character.toString(c)) || c == ' '){
                    if(!token.toString().isEmpty()){
                        if(lexicalUtils.isKeyword(token.toString())){
                            lastKeyword = token.toString();
                        } else if(lexicalUtils.isIdentifier(token.toString())) {
                            this.add(token.toString(), lastKeyword);
                        }
                        token = new StringBuilder();
                    }
                }
                else
                    token.append(c);

            }
            if(!token.toString().isEmpty()){
                if(lexicalUtils.isKeyword(token.toString())){
                    lastKeyword = token.toString();
                } else if(lexicalUtils.isIdentifier(token.toString())){
                    this.add(token.toString(), lastKeyword);
                }
            }
        }
    }


}
