package com.example;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class FiniteStateMachine {

    private List<String> alphabet = new ArrayList<>();
    private List<String> states = new ArrayList<>();
    private List<String> final_states = new ArrayList<>();
    private List<Transition> transitions = new ArrayList<>();
    private String initial_state;

    private File file;

    public FiniteStateMachine(File file) {
        this.file = file;
        init();
    }

    private void init(){

       try(Scanner reader = new Scanner(file)) {

           alphabet = List.of(reader.nextLine().split(","));
           states = List.of(reader.nextLine().split(","));
           initial_state = reader.nextLine();
           final_states = List.of(reader.nextLine().split(","));

           while (reader.hasNextLine()) {
               String[] transition = reader.nextLine().split(",");
               transitions.add(new Transition(transition[0], transition[1], transition[2]));
           }
       }catch (FileNotFoundException e){
           System.out.println("File not found" + e);
       }

    }

    public void printFiniteStateMachine() {
        System.out.println("Alphabet: " + alphabet);
        System.out.println("States: " + states);
        System.out.println("Initial state: " + initial_state);
        System.out.println("Final states: " + final_states);
        System.out.println("Transitions: ");
        transitions.forEach(System.out::println);
    }

    public String longestPrefix(String input) {
        String current_state = initial_state;
        String longest_prefix = "";
        String prefix = "";

        for (int i = 0; i < input.length(); i++) {
            String current_char = String.valueOf(input.charAt(i));
            boolean found = false;

            for(Transition transition : transitions) {
                if (transition.getSource_state().equals(current_state) && transition.getValue().equals(current_char)) {
                    current_state = transition.getDestination_state();
                    prefix += current_char;
                    found = true;
                    break;
                }
            }
            if(final_states.contains(current_state)) {
                longest_prefix = prefix;
            }
            if(!found) {
                break;
            }

        }
        return longest_prefix;

    }

    public boolean isAccepted(String input){
        return input.equals(longestPrefix(input));
    }

}


