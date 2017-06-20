/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solver.dataTypes;

import java.sql.Timestamp;

/**
 *
 * @author gokhanceyhan
 */
public class MocoJob {

    private Long jobId;
    private Timestamp jobCreationTime;
    private String issuer;
    private String processor;
    private String jobInput;
    private String jobParam;
    private String jobStatus;
    private Timestamp completionTime;
    private String jobOutput;
    private double processTime;

    public MocoJob() {

    }

    /**
     * @return the jobId
     */
    public Long getJobId() {
        return jobId;
    }

    /**
     * @param jobId the jobId to set
     */
    public void setJobId(Long jobId) {
        this.jobId = jobId;
    }

    /**
     * @return the JobCreationTime
     */
    public Timestamp getJobCreationTime() {
        return jobCreationTime;
    }

    /**
     * @param jobCreationTime the JobCreationTime to set
     */
    public void setJobCreationTime(Timestamp jobCreationTime) {
        this.jobCreationTime = jobCreationTime;
    }

    /**
     * @return the issuer
     */
    public String getIssuer() {
        return issuer;
    }

    /**
     * @param issuer the issuer to set
     */
    public void setIssuer(String issuer) {
        this.issuer = issuer;
    }

    /**
     * @return the processor
     */
    public String getProcessor() {
        return processor;
    }

    /**
     * @param processor the processor to set
     */
    public void setProcessor(String processor) {
        this.processor = processor;
    }

    /**
     * @return the jobInput
     */
    public String getJobInput() {
        return jobInput;
    }

    /**
     * @param jobInput the jobInput to set
     */
    public void setJobInput(String jobInput) {
        this.jobInput = jobInput;
    }

    /**
     * @return the jobParam
     */
    public String getJobParam() {
        return jobParam;
    }

    /**
     * @param jobParam the jobParam to set
     */
    public void setJobParam(String jobParam) {
        this.jobParam = jobParam;
    }

    /**
     * @return the jobStatus
     */
    public String getJobStatus() {
        return jobStatus;
    }

    /**
     * @param jobStatus the jobStatus to set
     */
    public void setJobStatus(String jobStatus) {
        this.jobStatus = jobStatus;
    }

    /**
     * @return the completionTime
     */
    public Timestamp getCompletionTime() {
        return completionTime;
    }

    /**
     * @param completionTime the completionTime to set
     */
    public void setCompletionTime(Timestamp completionTime) {
        this.completionTime = completionTime;
    }

    /**
     * @return the jobOutput
     */
    public String getJobOutput() {
        return jobOutput;
    }

    /**
     * @param jobOutput the jobOutput to set
     */
    public void setJobOutput(String jobOutput) {
        this.jobOutput = jobOutput;
    }

    /**
     * @return the processTime
     */
    public double getProcessTime() {
        return processTime;
    }

    /**
     * @param processTime the processTime to set
     */
    public void setProcessTime(double processTime) {
        this.processTime = processTime;
    }

}
