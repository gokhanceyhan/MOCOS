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
    private int sequenceNumber;
    private double waitingTime;

    public MocoJob() {

    }

    public MocoJob(Long jobId, Timestamp jobCreationTime, String issuer, String processor, String jobInput,
            String jobParam, String jobStatus, Timestamp completionTime, String jobOutput,
            double processTİme, int sequenceNumber, double waitingTime) {
        this.jobId = jobId;
        this.jobCreationTime = jobCreationTime;
        this.issuer = issuer;
        this.processor = processor;
        this.jobInput = jobInput;
        this.jobParam = jobParam;
        this.jobStatus = jobStatus;
        this.completionTime = completionTime;
        this.jobOutput = jobOutput;
        this.processTime = processTİme;
        this.sequenceNumber = sequenceNumber;
        this.waitingTime = waitingTime;
    }

    public MocoJob(MocoJob that) {
        this(that.jobId, that.jobCreationTime, that.issuer, that.processor, that.jobInput,
                that.jobParam, that.jobStatus, that.completionTime, that.jobOutput,
                that.processTime, that.sequenceNumber, that.waitingTime);
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

    /**
     * @return the sequenceNumber
     */
    public int getSequenceNumber() {
        return sequenceNumber;
    }

    /**
     * @param sequenceNumber the sequenceNumber to set
     */
    public void setSequenceNumber(int sequenceNumber) {
        this.sequenceNumber = sequenceNumber;
    }

    /**
     * @return the waitingTime
     */
    public double getWaitingTime() {
        return waitingTime;
    }

    /**
     * @param waitingTime the waitingTime to set
     */
    public void setWaitingTime(double waitingTime) {
        this.waitingTime = waitingTime;
    }

}
