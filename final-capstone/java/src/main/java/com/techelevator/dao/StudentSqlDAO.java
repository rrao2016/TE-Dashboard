package com.techelevator.dao;

import com.techelevator.model.Student;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

@Service
public class StudentSqlDAO implements StudentDAO{

    private JdbcTemplate jdbcTemplate;

    public StudentSqlDAO(JdbcTemplate jdbcTemplate){ this.jdbcTemplate = jdbcTemplate;}

    @Override
    public Student getStudentByUserId(Long userId) {
        String sql = "SELECT * FROM students where user_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, userId);
        Student student = null;
        if (result.next()) {
            Long id2 = result.getLong("user_id");
            Long instructorId = result.getLong("instructor_id");
            String fName = result.getString("firstname");
            String lName = result.getString("lastname");
            Long studentId = result.getLong("student_id");
            student = new Student(fName, lName,id2, studentId,instructorId);
        }

        return student;
    }

    @Override
    public boolean create(String firstName, String lastName, Long user_id) {

        // create student
        String insertStudent = "INSERT INTO students (firstname, lastname, user_id) VALUES(?,?,?)";
        try {
            jdbcTemplate.update(insertStudent, firstName, lastName, user_id);
        } catch (DataAccessException e) {
            System.out.println(e);
            return false;
        }


        return true;
    }
}
