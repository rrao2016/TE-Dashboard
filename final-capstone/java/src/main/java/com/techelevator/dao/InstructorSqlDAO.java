package com.techelevator.dao;

import com.techelevator.model.Instructor;
import com.techelevator.model.Student;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Service
public class InstructorSqlDAO implements InstructorDAO{

    private JdbcTemplate jdbcTemplate;

    public InstructorSqlDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Instructor getInstructorByUserId(Long userId) {
        String sql = "SELECT * FROM instructors WHERE user_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, userId);
        Instructor instructor = new Instructor();
        if(result.next()){
            instructor.setInstructor_id(result.getLong("instructor_id"));
            instructor.setUser_id(result.getLong("user_id"));
            instructor.setFirstName(result.getString("firstname"));
            instructor.setLastName(result.getString("lastname"));
        }

        return instructor;
    }

    @Override
    public boolean create(String firstName, String lastName, Long user_id) {

        String insertInstructor = "INSERT INTO instructors (firstname, lastname, user_id) VALUES(?,?,?)";
        try{
            jdbcTemplate.update(insertInstructor,firstName,lastName,user_id);
        } catch (DataAccessException e){
            System.out.println(e);
            return false;
        }
        return false;
    }

    @Override
    public List<Student> getListOfStudents(Long instructorId){
        List<Student> students= new ArrayList<>();

        String search = "SELECT * FROM students " +
                "WHERE instructor_id = ?";

        try{
            SqlRowSet results = jdbcTemplate.queryForRowSet(search,instructorId);

            while(results.next()){
                Student student = new Student();
                student.setFirstName(results.getString("firstname"));
                student.setLastName(results.getString("lastname"));
                student.setStudent_id(results.getLong("student_id"));
                students.add(student);
            }

        } catch(DataAccessException e){
            System.out.println(e);
        }

        return students;
    }
}
