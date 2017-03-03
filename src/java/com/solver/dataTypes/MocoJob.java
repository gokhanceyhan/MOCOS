/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solver.dataTypes;

import java.sql.Timestamp;
import java.util.Calendar;

/**
 *
 * @author gokhanceyhan
 */
public class MocoJob {
    
    private Timestamp JobCreationTime;

    public MocoJob() {
        this.JobCreationTime = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
    }
    
}
