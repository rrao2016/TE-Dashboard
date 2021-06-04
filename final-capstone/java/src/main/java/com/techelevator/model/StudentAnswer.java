package com.techelevator.model;

public class StudentAnswer {
    private long selectedAnswerId;
    private long questionId;
    private long studentId;
    private long choiceId;

    public StudentAnswer() {
    }

    public long getSelectedAnswerId() {
        return selectedAnswerId;
    }

    public void setSelectedAnswerId(long selectedAnswerId) {
        this.selectedAnswerId = selectedAnswerId;
    }

    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }

    public long getStudentId() {
        return studentId;
    }

    public void setStudentId(long studentId) {
        this.studentId = studentId;
    }

    public long getChoiceId() {
        return choiceId;
    }

    public void setChoiceId(long choiceId) {
        this.choiceId = choiceId;
    }
}
