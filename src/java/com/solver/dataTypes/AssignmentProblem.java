/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solver.dataTypes;

import java.io.Externalizable;
import java.io.File;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

/**
 *
 * @author gokhanceyhan
 */
public class AssignmentProblem implements Externalizable {

    private static final int FIRST_VERSION = 0;

    private int numOfJobs;
    private File inputFile;
    
    public AssignmentProblem(){
        numOfJobs = 1;
        inputFile = new File("");
    }

    public AssignmentProblem(int numOfJobs, File inputFile) {
        this.numOfJobs = numOfJobs;
        this.inputFile = inputFile;
    }

    /**
     * @return the numOfJobs
     */
    public int getNumOfJobs() {
        return numOfJobs;
    }

    /**
     * @param numOfJobs the numOfJobs to set
     */
    public void setNumOfJobs(int numOfJobs) {
        this.numOfJobs = numOfJobs;
    }

    /**
     * @return the inputFile
     */
    public File getInputFile() {
        return inputFile;
    }

    /**
     * @param inputFile the inputFile to set
     */
    public void setInputFile(File inputFile) {
        this.inputFile = inputFile;
    }

    @Override
    public void writeExternal(ObjectOutput out) throws IOException {
        // first write the version id
        out.writeInt(FIRST_VERSION);

        // now write the state
        out.writeInt(numOfJobs);
        out.writeObject(inputFile);
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

        numOfJobs = in.readInt();
        inputFile = (File) in.readObject();
    }

}
