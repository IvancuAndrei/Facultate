package com.example;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Scanner;

public class Main {

    private static void printReadMenu(){
        System.out.println("0 - Exit");
        System.out.println("1 - Read from file");
        System.out.println("2 - Read from keyboard");
    }

    private static void printCommands(){
        System.out.println("0 - Exit");
        System.out.println("1 - Print finite state machine's elements");
        System.out.println("2 - Longest prefix");
        System.out.println("3 - Check if a word is accepted");
    }

    private static void writeToFile(File file)  {
        try (PrintWriter writer = new PrintWriter(file)) {
            Scanner scanner = new Scanner(System.in);
            System.out.print("Alphabet: ");
            String alphabet = scanner.nextLine();
            writer.println(alphabet);
            System.out.print("States: ");
            String states = scanner.nextLine();
            writer.println(states);
            System.out.print("Initial state: ");
            String initial_state = scanner.nextLine();
            writer.println(initial_state);
            System.out.print("Final states: ");
            String final_states = scanner.nextLine();
            writer.println(final_states);
            System.out.println("Transitions: ");
            while (true) {
                System.out.print("Source state, destination state, value: ");
                String transition = scanner.nextLine();
                writer.println(transition);
                System.out.println("Do you want to add another transition? (y/n)");
                System.out.print(">>");
                String answer = scanner.nextLine();
                if (answer.equals("n")) {
                    break;
                }
            }
        }catch (FileNotFoundException e){
            System.out.print("File not found" + e);
        }
    }

    public static void main(String[] args) {

        File file = new File("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 2\\Automat_finit\\src\\main\\resources\\constants.txt");


        while(true){
            printReadMenu();

            Scanner scanner = new Scanner(System.in);
            System.out.print(">>");

            int command = scanner.nextInt();

            if(command == 0){
                break;
            }
            if(command == 1){
                FiniteStateMachine fsm = new FiniteStateMachine(file);
                while(true){
                    printCommands();
                    System.out.print(">>");
                    command = scanner.nextInt();
                    if(command == 0){
                        break;
                    }
                    if(command == 1){
                        fsm.printFiniteStateMachine();
                    }
                    if(command == 2){
                        System.out.print("Input: ");
                        String input = scanner.next();
                        System.out.println(fsm.longestPrefix(input));
                    }
                    if(command == 3){
                        System.out.print("Input: ");
                        String input = scanner.next();
                        System.out.println(fsm.isAccepted(input));
                    }
                }

            }
            if(command == 2){

                File newFile = new File("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 2\\Automat_finit\\src\\main\\resources\\constants_cmd.txt");
                writeToFile(newFile);


                FiniteStateMachine fsm = new FiniteStateMachine(newFile);
                while(true){
                    printCommands();
                    System.out.print(">>");
                    command = scanner.nextInt();
                    if(command == 0){
                        break;
                    }
                    if(command == 1){
                        fsm.printFiniteStateMachine();
                    }
                    if(command == 2){
                        System.out.print("Input: ");
                        String input = scanner.next();
                        System.out.println(fsm.longestPrefix(input));
                    }
                    if(command == 3){
                        System.out.print("Input: ");
                        String input = scanner.next();
                        System.out.println(fsm.isAccepted(input));
                    }
                }
            }

        }


    }
}