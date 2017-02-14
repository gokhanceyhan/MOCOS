/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solver.dataTypes;

/**
 *
 * @author gokhanceyhan
 */
public class Input {
    
    private InputType inputType;
    private ProblemType problemType;
    private int numOfObjectives;
    

    public Input() {
    }

    /**
     * @return the inputType
     */
    public InputType getInputType() {
        return inputType;
    }

    /**
     * @param inputType the inputType to set
     */
    public void setInputType(InputType inputType) {
        this.inputType = inputType;
    }

    /**
     * @return the problemType
     */
    public ProblemType getProblemType() {
        return problemType;
    }

    /**
     * @param problemType the problemType to set
     */
    public void setProblemType(ProblemType problemType) {
        this.problemType = problemType;
    }

    /**
     * @return the numOfObjectives
     */
    public int getNumOfObjectives() {
        return numOfObjectives;
    }

    /**
     * @param numOfObjectives the numOfObjectives to set
     */
    public void setNumOfObjectives(int numOfObjectives) {
        this.numOfObjectives = numOfObjectives;
    }


}
