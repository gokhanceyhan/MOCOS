/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solver.dataTypes;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

/**
 *
 * @author gokhanceyhan
 */
public class InputData implements Externalizable {

    // initial version id
    private static final int FIRST_VERSION = 0;

    private InputType inputType;
    private ProblemType problemType;
    private int numOfObjectives;
    private KnapsackProblem knapsackProblem;
    private AssignmentProblem assignmentProblem;
    private MathModel mathModel;

    public InputData() {
    }

    public InputData(InputType inputType, ProblemType problemType, int numOfObjectives, KnapsackProblem knapsackProblem) {
        this.inputType = inputType;
        this.problemType = problemType;
        this.numOfObjectives = numOfObjectives;
        this.knapsackProblem = knapsackProblem;
    }

    public InputData(InputType inputType, ProblemType problemType, int numOfObjectives, AssignmentProblem assignmentProblem) {
        this.inputType = inputType;
        this.problemType = problemType;
        this.numOfObjectives = numOfObjectives;
        this.assignmentProblem = assignmentProblem;
    }

    public InputData(InputType inputType, ProblemType problemType, int numOfObjectives, MathModel mathModel) {
        this.inputType = inputType;
        this.problemType = problemType;
        this.numOfObjectives = numOfObjectives;
        this.mathModel = mathModel;
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
     * @return the knapsackProblem
     */
    public KnapsackProblem getKnapsackProblem() {
        return knapsackProblem;
    }

    /**
     * @param knapsackProblem the knapsackProblem to set
     */
    public void setKnapsackProblem(KnapsackProblem knapsackProblem) {
        this.knapsackProblem = knapsackProblem;
    }

    /**
     * @return the assignmentProblem
     */
    public AssignmentProblem getAssignmentProblem() {
        return assignmentProblem;
    }

    /**
     * @param assignmentProblem the assignmentProblem to set
     */
    public void setAssignmentProblem(AssignmentProblem assignmentProblem) {
        this.assignmentProblem = assignmentProblem;
    }

    /**
     * @return the mathModel
     */
    public MathModel getMathModel() {
        return mathModel;
    }

    /**
     * @param mathModel the mathModel to set
     */
    public void setMathModel(MathModel mathModel) {
        this.mathModel = mathModel;
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

    @Override
    public void writeExternal(ObjectOutput out) throws IOException {
        // first write the version id
        out.writeInt(FIRST_VERSION);

        // now write the state
        out.writeObject(inputType);
        out.writeObject(problemType);
        out.writeObject(numOfObjectives);
        out.writeObject(knapsackProblem);
        out.writeObject(assignmentProblem);
        out.writeObject(mathModel);

    }

    @Override
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        // read the version id
        int oldVersion = in.readInt();
        if (oldVersion < FIRST_VERSION) {
            throw new IOException("Corrupt data stream.");
        }
        if (oldVersion > FIRST_VERSION) {
            throw new IOException("Can't deserialize from the future.");
        }

        inputType = (InputType) in.readObject();
        problemType = (ProblemType) in.readObject();
        numOfObjectives = in.readInt();
        knapsackProblem = (KnapsackProblem) in.readObject();
        assignmentProblem = (AssignmentProblem) in.readObject();
        mathModel = (MathModel) in.readObject();

    }

}
