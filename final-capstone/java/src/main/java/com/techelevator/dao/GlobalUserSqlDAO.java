package com.techelevator.dao;

import com.techelevator.model.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service

public class GlobalUserSqlDAO implements GlobalUserDAO {

    private JdbcTemplate jdbcTemplate;
    private QuizSqlDAO quizSqlDAO;
    public GlobalUserSqlDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<GlobalUserListItem> findAllGlobalUsers() {
        List<GlobalUserListItem> users = new ArrayList<>();
        String sql = "select users.user_id,users.academic_status, " +
                "students.firstname as student_firstname,students.student_id,students.lastname as student_lastname, students.instructor_id as assignedInstructor, " +
                "instructors.instructor_id,instructors.firstname as instructor_fname,instructors.lastname as instructor_lname " +
                "from users " +
                "FULL join instructors on users.user_id = instructors.user_id "+
                "FULL join students on users.user_id =students.user_id";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()) {

            GlobalUserListItem user = mapRowToUser(results);
            users.add(user);
        }
        return users;
    }

    @Override
    public List<GlobalUserListItem> getAllData(){
        List<GlobalUserListItem> users = new ArrayList<>();

        String search1 = "SELECT * FROM students ";
        SqlRowSet results1 = jdbcTemplate.queryForRowSet(search1);

        // results1 contain a list of all students
        while(results1.next()){
            // Create single GlobalUserListItem user to later add to users ArrayList
            GlobalUserListItem user = new GlobalUserListItem();

            // Create Quiz list for each User
            List<Quiz> quizes = new ArrayList<>();
//            Integer quizAvg = 0;

            // Add data to user object
            Long studentId = results1.getLong("student_id");
            user.setStudentId(studentId);
            user.setStudentFirstName(results1.getString("firstname"));
            user.setStudentLastName(results1.getString("lastname"));
            user.setInstructorId(results1.getLong("instructor_id"));
            user.setUserid(results1.getLong("user_id"));

            // Get homework Scores for each student
            String searchHw = " SELECT * FROM students " +
                    "JOIN student_homework ON students.student_id = student_homework.student_id " +
                    "JOIN homework ON homework.homework_id = student_homework.homework_id " +
                    "WHERE students.student_id = ?";
            SqlRowSet resultHw = jdbcTemplate.queryForRowSet(searchHw,studentId);

            List<Homework> homeworks = new ArrayList<>();
            while(resultHw.next()){
                Homework homework = new Homework();
                homework.setFeedback(resultHw.getString("feedback"));
                homework.setScore(resultHw.getInt("score"));
                homework.setHomework_id(resultHw.getLong("homework_id"));
                homework.setStudent_id(resultHw.getLong("student_id"));
                homework.setName(resultHw.getString("name"));
                homework.setModuleId(resultHw.getLong("module_id"));

                homeworks.add(homework);
            }
            user.setHomeworkSummaries(homeworks);

            // Get pathway Scores for each student
            String searchPathway = "SELECT * FROM students " +
                    "JOIN student_pathway ON students.student_id = student_pathway.student_id " +
                    "JOIN pathway ON pathway.pathway_id = student_pathway.pathway_id " +
                    "Where students.student_id = ?";
            SqlRowSet searchPathwayResults = jdbcTemplate.queryForRowSet(searchPathway, studentId);

            List<Pathway> pathways = new ArrayList<>();
            while(searchPathwayResults.next()){
                Pathway pathway = new Pathway();
                pathway.setFeedback(searchPathwayResults.getString("feedback"));
                pathway.setScore(searchPathwayResults.getInt("score"));
                pathway.setPathway_id(searchPathwayResults.getLong("pathway_id"));
                pathway.setStudent_id(searchPathwayResults.getLong("student_id"));
                pathway.setName(searchPathwayResults.getString("name"));
                pathway.setModuleId(searchPathwayResults.getLong("module_id"));
                pathways.add(pathway);
            }
            user.setPathwaySummaries(pathways);


            // Get all quizes assigned to Student
            String search2 = "SELECT * FROM student_quizes " +
                    "WHERE student_id = ?";
            SqlRowSet results2 = jdbcTemplate.queryForRowSet(search2, studentId);

            String checkforStudentAnswer = "SELECT * FROM student_selected_answers " +
                    "WHERE student_id =? AND question_id = ? AND choice_id =?";


            List<QuizScoreSummary> quizScoreSummaries = new ArrayList<>();
            // Loop through list of quizes for each student.
            while(results2.next()){
                QuizScoreSummary quizScoreSummary = new QuizScoreSummary();

//                System.out.println("results2 while loop running " + results2.getLong("quiz_id"));
                Long quizId = results2.getLong("quiz_id");

                // get all questions per quiz
                String search3 = "SELECT * FROM questions " +
                        "JOIN quizes ON questions.quiz_id = quizes.quiz_id " +
                        "WHERE questions.quiz_id = ?";
                SqlRowSet results3 = jdbcTemplate.queryForRowSet(search3, quizId);

                // Create Quiz and set basic info
                Quiz quiz = new Quiz();

                List<Question> resultsArray = new ArrayList<>();

                Integer amountQuestions = 0;
                Integer amountCorrect = 0; // for whole quiz
                quizScoreSummary.setQuizId(quizId);
                quizScoreSummary.setQuizStatus(results2.getString("quiz_status"));

                // Loop through questions so we can combine the answers to their questions
                while(results3.next()){
                    quizScoreSummary.setQuizName(results3.getString("quiz_title"));
//                    System.out.println("results3 list of questions " + results3.getLong("question_id"));
                    quiz.setQuizName(results3.getString("quiz_title"));
                    quiz.setQuizId(results3.getLong("quiz_id"));
                    String search4 = "SELECT * from answers " +
                            "WHERE question_id = ?";
                    Long questionId = results3.getLong("question_id");
                    SqlRowSet results4 = jdbcTemplate.queryForRowSet(search4,questionId );

                    Question question = new Question();
                    question.setQuestionId(results3.getLong("question_id"));
                    question.setQuestion(results3.getString("question_text"));
                    question.setQuizId(results3.getLong("quiz_id"));
                    List<Answer> answers = new ArrayList<>();
                    amountQuestions ++;
                    // Loop through lists of answers for each question
                    Integer amountOfCorrectAnswers = 0; //for each question
                    Integer amountOfSelectedCorrectAnswers =0;
                    while(results4.next()){

                        Answer answer = new Answer();
                        answer.setAnswer(results4.getString("answer_text"));
                        answer.setQuestionId(results4.getLong("question_id"));
                        answer.setChoice_id(results4.getLong("choice_id"));
                        answer.setCorrect(results4.getBoolean("correct"));

                        if(results4.getBoolean("correct") == true){
                            amountOfCorrectAnswers ++;
                            SqlRowSet studentAnswerResults1 =  jdbcTemplate.queryForRowSet(checkforStudentAnswer, studentId,results4.getLong("question_id"),results4.getLong("choice_id") );
                            if(studentAnswerResults1.next()){
//                                System.out.println("Student answered "  + results4.getLong("question_id") + " choice id " + results4.getLong("choice_id"));
                                amountOfSelectedCorrectAnswers ++;
                            }


                        }

                    // Check if student selected this answer, update boolean
                        SqlRowSet studentAnswerResults = jdbcTemplate.queryForRowSet(checkforStudentAnswer, studentId,results4.getLong("question_id"),results4.getLong("choice_id") );
                        if(studentAnswerResults.next()){
                            answer.setStudentSelected(true);
                        }

                        answers.add(answer);

                    }
                    // todo only add to amountCorrect if it is actually the right answer, not just the number selected = number required answers
                    if(amountOfCorrectAnswers ==amountOfSelectedCorrectAnswers ){
                        amountCorrect ++;
                    }

                    question.setAnswers(answers);
                    resultsArray.add(question);

                }
            quiz.setQuestions(resultsArray);
                quizScoreSummary.setQuizScore(amountCorrect);
                quizScoreSummary.setQuizMaxScore(amountQuestions);
                quizScoreSummaries.add(quizScoreSummary);
                quiz.setMaxScore(amountQuestions);
                quiz.setScore(amountCorrect);
                quizes.add(quiz);
            }
            // Add list of quizes to user
            user.setQuizScoreSummaries(quizScoreSummaries);
            user.setStudentQuizes(quizes);
            users.add(user);
        }

        return users;
    }

    private GlobalUserListItem mapRowToUser(SqlRowSet rs) {
        GlobalUserListItem user = new GlobalUserListItem();
        user.setUserid(rs.getLong("user_id"));
        user.setAcademic_status(rs.getString("academic_status"));
        user.setStudentId(rs.getLong("student_id"));
        user.setStudentFirstName(rs.getString("student_firstname"));
        user.setStudentLastName(rs.getString("student_lastname"));
        user.setAssignedInstructorId(rs.getLong("assignedinstructor"));

        user.setInstructorId(rs.getLong("instructor_id"));
        user.setInstructorFirstName(rs.getString("instructor_fname"));
        user.setInstructorLastName(rs.getString("instructor_lname"));


        return user;
    }

}
