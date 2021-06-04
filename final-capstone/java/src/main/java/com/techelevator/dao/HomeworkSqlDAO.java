package com.techelevator.dao;

import com.techelevator.model.Homework;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class HomeworkSqlDAO implements HomeworkDAO {

    private JdbcTemplate jdbcTemplate;

    public HomeworkSqlDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Homework> getHomeworkByStudentId(Long student_id){
        String search2 = "select * from student_homework inner join homework on student_homework.homework_id = homework.homework_id where student_homework.student_id =?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(search2, student_id);

        List<Homework> resultsArray = new ArrayList<>();

        while(results.next()){
            Homework homework = new Homework();
            long homeworkId = results.getLong("homework_id");
            long studentId = results.getLong("student_id");
            int score = results.getInt("score");
            String homeworkName = results.getString("name");
            String feedback = results.getString("feedback");
            long moduleId = results.getLong("module_id");
            homework.setHomework_id(homeworkId);
            homework.setStudent_id(studentId);
            homework.setScore(score);
            homework.setFeedback(feedback);
            homework.setName(homeworkName);
            homework.setModuleId(moduleId);

            resultsArray.add(homework);
        }

        return resultsArray;
    }
}
