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

    private SolverType solverType;
    private double timeLimit;
    private int pointLimit;
    private double delta;
    private InputType inputType;
    private ProblemType problemType;
    private int numOfObjectives;
    private KnapsackProblem knapsackProblem;
    private AssignmentProblem assignmentProblem;
    private MathModel mathModel;

    public InputData() {
        knapsackProblem = new KnapsackProblem();
        assignmentProblem = new AssignmentProblem();
        mathModel = new MathModel();
    }

    public InputData(SolverType solverType, double timeLimit, int pointLimit, double delta, InputType inputType, ProblemType problemType, int numOfObjectives, KnapsackProblem knapsackProblem) {
        this.solverType = solverType;
        this.timeLimit = timeLimit;
        this.pointLimit = pointLimit;
        this.delta = delta;
        this.inputType = inputType;
        this.problemType = problemType;
        this.numOfObjectives = numOfObjectives;
        this.knapsackProblem = knapsackProblem;
    }

    public InputData(SolverType solverType, double timeLimit, int pointLimit, double delta, InputType inputType, ProblemType problemType, int numOfObjectives, AssignmentProblem assignmentProblem) {
        this.solverType = solverType;
        this.timeLimit = timeLimit;
        this.pointLimit = pointLimit;
        this.delta = delta;
        this.inputType = inputType;
        this.problemType = problemType;
        this.numOfObjectives = numOfObjectives;
        this.assignmentProblem = assignmentProblem;
    }

    public InputData(SolverType solverType, double timeLimit, int pointLimit, double delta, InputType inputType, ProblemType problemType, int numOfObjectives, MathModel mathModel) {
        this.solverType = solverType;
        this.timeLimit = timeLimit;
        this.pointLimit = pointLimit;
        this.delta = delta;
        this.inputType = inputType;
        this.problemType = problemType;
        this.numOfObjectives = numOfObjectives;
        this.mathModel = mathModel;
    }

    /**
     * @return the solverType
     */
    public SolverType getSolverType() {
        return solverType;
    }

    /**
     * @param solverType the solverType to set
     */
    public void setSolverType(SolverType solverType) {
        this.solverType = solverType;
    }

    /**
     * @return the timeLimit
     */
    public double getTimeLimit() {
        return timeLimit;
    }

    /**
     * @param timeLimit the timeLimit to set
     */
    public void setTimeLimit(double timeLimit) {
        this.timeLimit = timeLimit;
    }

    /**
     * @return the pointLimit
     */
    public int getPointLimit() {
        return pointLimit;
    }

    /**
     * @param pointLimit the pointLimit to set
     */
    public void setPointLimit(int pointLimit) {
        this.pointLimit = pointLimit;
    }

    /**
     * @return the delta
     */
    public double getDelta() {
        return delta;
    }

    /**
     * @param delta the delta to set
     */
    public void setDelta(double delta) {
        this.delta = delta;
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
        out.writeObject(solverType);
        out.writeObject(timeLimit);
        out.writeObject(pointLimit);
        out.writeObject(delta);
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
        
        solverType = (SolverType) in.readObject();
        timeLimit =  in.readDouble();
        pointLimit = in.readInt();
        delta = in.readDouble();
        inputType = (InputType) in.readObject();
        problemType = (ProblemType) in.readObject();
        numOfObjectives = in.readInt();
        knapsackProblem = (KnapsackProblem) in.readObject();
        assignmentProblem = (AssignmentProblem) in.readObject();
        mathModel = (MathModel) in.readObject();

    }

}
