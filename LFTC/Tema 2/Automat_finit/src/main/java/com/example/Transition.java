package com.example;

public class Transition {

    private String source_state;
    private String destination_state;
    private String value;

    public Transition(String source_state, String destination_state, String value) {
        this.source_state = source_state;
        this.destination_state = destination_state;
        this.value = value;
    }

    public String getDestination_state() {
        return destination_state;
    }

    public String getSource_state() {
        return source_state;
    }

    public String getValue() {
        return value;
    }

    @Override
    public String toString() {
        return source_state + " -> " + destination_state + " : " + value;
    }
}
