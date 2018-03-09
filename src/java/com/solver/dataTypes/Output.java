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
public class Output implements Externalizable {

    private static final int FIRST_VERSION = 0;
    
    private String outputFile;

    public Output(String outputFile) {
        this.outputFile = outputFile;
    }

    /**
     * @return the outputFile
     */
    public String getOutputFile() {
        return outputFile;
    }

    /**
     * @param outputFile the outputFile to set
     */
    public void setOutputFile(String outputFile) {
        this.outputFile = outputFile;
    }

    @Override
    public void writeExternal(ObjectOutput out) throws IOException {
        // first write the version id
        out.writeInt(FIRST_VERSION);

        // now write the state
        out.writeObject(outputFile);
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

        outputFile = (String) in.readObject();
    }

}
