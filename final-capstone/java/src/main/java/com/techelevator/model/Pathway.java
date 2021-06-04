package com.techelevator.model;

public class Pathway {

    private Integer score;
    private Long student_id;
    private Long pathway_id;
    private String feedback;
    private String name;
    private Long moduleId;

    public Pathway() {
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Long getStudent_id() {
        return student_id;
    }

    public void setStudent_id(Long student_id) {
        this.student_id = student_id;
    }

    public Long getPathway_id() {
        return pathway_id;
    }

    public void setPathway_id(Long pathway_id) {
        this.pathway_id = pathway_id;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getModuleId() {
        return moduleId;
    }

    public void setModuleId(Long moduleId) {
        this.moduleId = moduleId;
    }
}
