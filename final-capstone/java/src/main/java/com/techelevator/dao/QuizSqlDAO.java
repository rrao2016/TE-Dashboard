package com.techelevator.dao;

import com.techelevator.model.Answer;
import com.techelevator.model.Question;
import com.techelevator.model.Quiz;
import com.techelevator.model.StudentAnswer;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class QuizSqlDAO implements QuizDAO {
    private JdbcTemplate jdbcTemplate;

    public QuizSqlDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    // not used, probably deleted
    @Override
    public Quiz getQuizById(Long quiz_id, Long student_id){

        String searchAlt = "SELECT questions.question_id, questions.question_text, questions.quiz_id, quizes.quiz_title, student_quizes.student_id, student_quizes.quiz_status, student_quizes.score, student_quizes.max_score FROM questions " +
                "JOIN quizes ON questions.quiz_id = quizes.quiz_id " +
                "JOIN student_quizes ON quizes.quiz_id = student_quizes.quiz_id " +
                "WHERE questions.quiz_id = ? AND student_quizes.student_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(searchAlt, quiz_id, student_id);
        Quiz quiz = new Quiz();
        List<Question> resultsArray = new ArrayList<>();

        while(results.next()){
//            System.out.println("hit loop");
//            System.out.println(results.getString("quiz_title"));
            quiz.setQuizName(results.getString("quiz_title"));
            quiz.setQuizId(results.getLong("quiz_id"));
            quiz.setStudentId(results.getLong("student_id"));
            quiz.setQuizStatus(results.getString("quiz_status"));
            String search3 = "SELECT * from answers " +
                    "WHERE question_id = ?";
            Long questionId = results.getLong("question_id");
            SqlRowSet results3 = jdbcTemplate.queryForRowSet(search3,questionId );

            Question question = new Question();
            question.setQuestionId(results.getLong("question_id"));
            question.setQuestion(results.getString("question_text"));
            question.setQuizId(results.getLong("quiz_id"));
            List<Answer> answers = new ArrayList<>();
            while(results3.next()){
                Answer answer = new Answer();
                answer.setAnswer(results3.getString("answer_text"));
                answer.setQuestionId(results3.getLong("question_id"));
                answer.setChoice_id(results3.getLong("choice_id"));
                answer.setCorrect(results3.getBoolean("correct"));
                answers.add(answer);
            }
            question.setAnswers(answers);
            resultsArray.add(question);
        }
        quiz.setQuestions(resultsArray);

        return quiz;
    }

    @Override
    public List <Quiz> getQuizesAndScore(Long student_id) {
        String search = "SELECT * FROM student_quizes " +
                "JOIN quizes ON student_quizes.quiz_id = quizes.quiz_id " +
                "WHERE student_id = ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(search,student_id);

        List<Quiz> resultsArray = new ArrayList<>();

        while(results.next()){
            Quiz quiz = new Quiz();
            quiz.setQuizStatus(results.getString("quiz_status"));
            quiz.setScore(results.getInt("score"));
            quiz.setQuizId(results.getLong("quiz_id"));
            quiz.setMaxScore(results.getInt("max_score"));
            quiz.setQuizName(results.getString("quiz_title"));
            quiz.setModuleId(results.getLong("module_id"));
            resultsArray.add(quiz);
        }

        return resultsArray;
    }

    // Query quiz info only, no student info
    @Override
    public Quiz getQuizById(Long quiz_id){
        String search2 = "SELECT * FROM questions " +
           "JOIN quizes ON questions.quiz_id = quizes.quiz_id " +
           "WHERE questions.quiz_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(search2, quiz_id);
        Quiz quiz = new Quiz();
        List<Question> resultsArray = new ArrayList<>();
        while(results.next()){
            quiz.setQuizName(results.getString("quiz_title"));
            quiz.setQuizId(results.getLong("quiz_id"));
            String search3 = "SELECT * from answers " +
            "WHERE question_id = ?";
            Long questionId = results.getLong("question_id");
            SqlRowSet results3 = jdbcTemplate.queryForRowSet(search3,questionId );

            Question question = new Question();
            question.setQuestionId(results.getLong("question_id"));
            question.setQuestion(results.getString("question_text"));
            question.setQuizId(results.getLong("quiz_id"));
            List<Answer> answers = new ArrayList<>();
            while(results3.next()){
                Answer answer = new Answer();
                answer.setAnswer(results3.getString("answer_text"));
                answer.setQuestionId(results3.getLong("question_id"));
                answer.setChoice_id(results3.getLong("choice_id"));
                answer.setCorrect(results3.getBoolean("correct"));
                answers.add(answer);
                           }
            question.setAnswers(answers);
            resultsArray.add(question);
        }
        quiz.setQuestions(resultsArray);



        return quiz;
    }


    // grabs all quiz info - call from instructors - wrap in get student list
    @Override
    public Quiz getQuizById(Long quiz_id, Long student_id, Boolean allData){
        // get quiz data
        String search2 = "SELECT * FROM questions " +
                "JOIN quizes ON questions.quiz_id = quizes.quiz_id " +
                "WHERE questions.quiz_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(search2, quiz_id);
        Quiz quiz = new Quiz();
        List<Question> resultsArray = new ArrayList<>();

        String checkforStudentAnswer = "SELECT 1 FROM student_selected_answers " +
                "WHERE student_id =? AND question_id = ? AND choice_id =?";

        String studentAnswersSearch = "SELECT * FROM student_selected_answers " +
                "WHERE student_id = ? AND question_id = ?";

        // Loop results which are a list of questions
        while(results.next()){

            quiz.setQuizName(results.getString("quiz_title"));
            quiz.setQuizId(results.getLong("quiz_id"));
            String search3 = "SELECT * from answers " +
                    "WHERE question_id = ?";
            Long questionId = results.getLong("question_id");
            SqlRowSet results3 = jdbcTemplate.queryForRowSet(search3,questionId );

            Question question = new Question();
            Long returnedQuestionId = results.getLong("question_id");
            question.setQuestionId(results.getLong("question_id"));
            question.setQuestion(results.getString("question_text"));
            question.setQuizId(results.getLong("quiz_id"));
            List<Answer> answers = new ArrayList<>();

            // loop through results which are the list of answers.
            while(results3.next()){
                Answer answer = new Answer();
                answer.setAnswer(results3.getString("answer_text"));
                answer.setQuestionId(results3.getLong("question_id"));
                answer.setChoice_id(results3.getLong("choice_id"));
                answer.setCorrect(results3.getBoolean("correct"));


                SqlRowSet studentAnswerResults = jdbcTemplate.queryForRowSet(checkforStudentAnswer, student_id,results3.getLong("question_id"),results3.getLong("choice_id") );
                if(studentAnswerResults.next()){
                    answer.setStudentSelected(true);
                }

                answers.add(answer);
            }

            SqlRowSet studentAnswersResults = jdbcTemplate.queryForRowSet(studentAnswersSearch, returnedQuestionId, student_id);
            List<StudentAnswer> studentAnswersArray = new ArrayList<>();

            // loop through results which contain student answer for each question
            while(studentAnswersResults.next()){
                StudentAnswer studentAnswer = new StudentAnswer();
                studentAnswer.setChoiceId(studentAnswersResults.getLong("choice_id"));
                studentAnswer.setStudentId(studentAnswersResults.getLong("student_id"));
                studentAnswer.setQuestionId(studentAnswersResults.getLong("question_id"));
                studentAnswersArray.add(studentAnswer);
            }
            question.setAnswers(answers);
            question.setStudentAnswer(studentAnswersArray);
            resultsArray.add(question);
        }
        quiz.setQuestions(resultsArray);

        return quiz;

    }

    @Override
    public boolean saveStudentQuiz(List <Answer> answers){

        String insert = "INSERT INTO student_selected_answers (question_id, student_id,choice_id) " +
                "VALUES (?,?,?)";
        for(Answer answer : answers){

            try {

                jdbcTemplate.update(insert, answer.getQuestionId(), answer.getStudentId(), answer.getChoiceId());
            } catch(DataAccessException e){
                return false;
            }
        }

        return true;
    }

    @Override
    public boolean updateQuizInfo(Quiz quiz) {

        String updateQuiz = "UPDATE student_quizes SET quiz_status = 'completed', score = ?, max_score = ? " +
                "WHERE quiz_id = ? AND student_id = ?";
        try {
            jdbcTemplate.update(updateQuiz, quiz.getScore(), quiz.getMaxScore(), quiz.getQuizId(), quiz.getStudentId());
        } catch(DataAccessException e){
            return false;
        }

        return true;
    }
}
