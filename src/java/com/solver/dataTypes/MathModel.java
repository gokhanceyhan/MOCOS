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
public class MathModel implements Externalizable{
    
    private static final int FIRST_VERSION = 0;

    private String inputFile;
    
    public MathModel(){
        inputFile = "";
    }

    public MathModel(String inputFile) {
        this.inputFile = inputFile;
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

        inputFile = (String) in.readObject();
    }

}
