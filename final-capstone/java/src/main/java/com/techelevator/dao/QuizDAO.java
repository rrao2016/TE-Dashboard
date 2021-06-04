package com.techelevator.dao;

import com.techelevator.model.Answer;
import com.techelevator.model.Quiz;

import java.util.List;

public interface QuizDAO {

    Quiz getQuizById(Long quiz_id);

    Quiz getQuizById(Long quiz_id, Long student_id);

    Quiz getQuizById(Long quiz_id, Long student_id, Boolean allData);

    boolean saveStudentQuiz(List <Answer> answer);

    List<Quiz> getQuizesAndScore(Long student_id);

    boolean updateQuizInfo(Quiz quiz);

}
