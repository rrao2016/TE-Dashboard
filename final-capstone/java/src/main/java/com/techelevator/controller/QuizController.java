package com.techelevator.controller;

import com.techelevator.dao.QuizDAO;
import com.techelevator.model.Answer;
import com.techelevator.model.Quiz;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin
public class QuizController {
    private QuizDAO quizDAO;

    public QuizController(QuizDAO quizDAO) {
        this.quizDAO = quizDAO;
    }

    /**
     * @param id the id of the quiz
     * @return all info for a given quiz
     */
    @RequestMapping(path = "/getquizbyid/{id}", method = RequestMethod.GET )
    public Quiz returnQuizById(@PathVariable Long id) {
        Quiz quiz = new Quiz();
        try{
            quiz = quizDAO.getQuizById(id);
            return quiz;
        }catch (DataAccessException e){
            System.out.println(e);
        }
        return quiz;
    }

    /**
     * @param id the id of the quiz
     * @param student_id the id of the student
     * @return all info for a given quiz including a student's answer
     */
    @RequestMapping(path = "/getquizbyid/{id}/{student_id}", method = RequestMethod.GET )
    public Quiz returnQuizById(@PathVariable Long id, @PathVariable Long student_id) {
        Quiz quiz = new Quiz();
        try{
            quiz = quizDAO.getQuizById(id, student_id, true);
            return quiz;
        }catch (DataAccessException e){
            System.out.println(e);
        }
        return quiz;
    }

    /**
     * @param id the id of the student
     * @return list of all assigned and completed quizes, and scores if completed
     */
    @RequestMapping(path ="/getquizscores/{id}", method = RequestMethod.GET)
    public List<Quiz> returnScoresById(@PathVariable Long id){
        List <Quiz> quiz = new ArrayList<>();
        try{
            quiz = quizDAO.getQuizesAndScore(id);
            return quiz;
        }catch (DataAccessException e){
            System.out.println(e);
        }
        return quiz;
    }

    @RequestMapping(path = "/saveanswer", method = RequestMethod.POST )
    public boolean returnQuizById(@RequestBody List<Answer> answers) {

//        for(Answer answer : answers){
//            System.out.println(answer);
//        }
        try{
            quizDAO.saveStudentQuiz(answers);
            return true;
        }catch (DataAccessException e){
            System.out.println(e);
        }
        return false;
    }

    @RequestMapping(path = "/changeQuizStatus", method = RequestMethod.POST)
    public boolean updateCompletedQuizInfo(@RequestBody Quiz quiz) {
        System.out.println("quiz result: " + quiz);
        try {
            quizDAO.updateQuizInfo(quiz);
            return true;
        }catch (DataAccessException e){
            System.out.println(e);
        }
        return false;
    }


}
