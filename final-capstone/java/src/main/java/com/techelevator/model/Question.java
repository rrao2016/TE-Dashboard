package com.techelevator.model;

import java.util.List;

public class Question {
    private Long questionId;
    private Long quizId;
    private String question;
    private List<Answer> answers;
    private List<StudentAnswer> studentAnswer;


    public Question() {
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public Long getQuizId() {
        return quizId;
    }

    public void setQuizId(Long quizId) {
        this.quizId = quizId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<StudentAnswer> getStudentAnswer() {
        return studentAnswer;
    }

    public void setStudentAnswer(List<StudentAnswer> studentAnswer) {
        this.studentAnswer = studentAnswer;
    }

    @Override
    public String toString() {
        return "Question{" +
                "questionId=" + questionId +
                ", quizId=" + quizId +
                ", question='" + question + '\'' +
                ", answers=" + answers +
                ", studentAnswer=" + studentAnswer +
                '}';
    }
}
