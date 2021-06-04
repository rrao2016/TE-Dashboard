package com.techelevator.model;

public class QuizScoreSummary {

    private Long QuizId;
    private Integer QuizScore;
    private Integer QuizMaxScore;
    private String QuizName;
    private String QuizStatus;

    public QuizScoreSummary() {
    }

    public String getQuizStatus() {
        return QuizStatus;
    }

    public void setQuizStatus(String quizStatus) {
        QuizStatus = quizStatus;
    }

    public String getQuizName() {
        return QuizName;
    }

    public void setQuizName(String quizName) {
        QuizName = quizName;
    }

    public Long getQuizId() {
        return QuizId;
    }

    public void setQuizId(Long quizId) {
        QuizId = quizId;
    }

    public Integer getQuizScore() {
        return QuizScore;
    }

    public void setQuizScore(Integer quizScore) {
        QuizScore = quizScore;
    }

    public Integer getQuizMaxScore() {
        return QuizMaxScore;
    }

    public void setQuizMaxScore(Integer quizMaxScore) {
        QuizMaxScore = quizMaxScore;
    }

    @Override
    public String toString() {
        return "QuizScoreSummary{" +
                "QuizId=" + QuizId +
                ", QuizScore=" + QuizScore +
                ", QuizMaxScore=" + QuizMaxScore +
                ", QuizName='" + QuizName + '\'' +
                ", QuizStatus='" + QuizStatus + '\'' +
                '}';
    }
}
