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
public class KnapsackProblem implements Externalizable {

    private static final int FIRST_VERSION = 0;

    private int numOfKnapsacks;
    private int numOfItems;
    private String inputFile;
    
    public KnapsackProblem(){
        numOfKnapsacks = 1;
        numOfItems = 1;
        inputFile = "";
    }

    public KnapsackProblem(int numOfKnapsacks, int numOfItems, String inputFile) {
        this.numOfKnapsacks = numOfKnapsacks;
        this.numOfItems = numOfItems;
        this.inputFile = inputFile;
    }

    /**
     * @return the numOfKnapsacks
     */
    public int getNumOfKnapsacks() {
        return numOfKnapsacks;
    }

    /**
     * @param numOfKnapsacks the numOfKnapsacks to set
     */
    public void setNumOfKnapsacks(int numOfKnapsacks) {
        this.numOfKnapsacks = numOfKnapsacks;
    }

    /**
     * @return the numOfItems
     */
    public int getNumOfItems() {
        return numOfItems;
    }

    /**
     * @param numOfItems the numOfItems to set
     */
    public void setNumOfItems(int numOfItems) {
        this.numOfItems = numOfItems;
    }

    /**
     * @return the inputFile
     */
    public String getInputFile() {
        return inputFile;
    }

    /**
     * @param inputFile the inputFile to set
     */
    public void setInputFile(String inputFile) {
        this.inputFile = inputFile;
    }

    @Override
    public void writeExternal(ObjectOutput out) throws IOException {
        // first write the version id
        out.writeInt(FIRST_VERSION);

        // now write the state
        out.writeInt(numOfKnapsacks);
        out.writeInt(numOfItems);
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

        numOfKnapsacks = in.readInt();
        numOfItems = in.readInt();
        inputFile = (String) in.readObject();

    }
}
