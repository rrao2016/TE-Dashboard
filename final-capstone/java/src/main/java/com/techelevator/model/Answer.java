package com.techelevator.model;

public class Answer {
    private Long choiceId;
    private Long questionId;
    private String answer;
    private boolean correct;
    private Long studentId;
    private boolean studentSelected;

    public Answer() {
    }

    public Long getChoiceId() {
        return choiceId;
    }

    public void setChoice_id(Long choiceId) {
        this.choiceId = choiceId;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public boolean isCorrect() {
        return correct;
    }

    public void setCorrect(boolean correct) {
        this.correct = correct;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public boolean isStudentSelected() {
        return studentSelected;
    }

    public void setStudentSelected(boolean studentSelected) {
        this.studentSelected = studentSelected;
    }

    @Override
    public String toString() {
        return "Answer{" +
                "choiceId=" + choiceId +
                ", questionId=" + questionId +
                ", answer='" + answer + '\'' +
                ", correct=" + correct +
                ", studentId=" + studentId +
                ", studentSelected=" + studentSelected +
                '}';
    }
}
