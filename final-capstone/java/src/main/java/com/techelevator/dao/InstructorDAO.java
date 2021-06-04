package com.techelevator.dao;

import com.techelevator.model.Instructor;
import com.techelevator.model.Student;

import java.util.List;

public interface InstructorDAO {
    Instructor getInstructorByUserId(Long user_id);

    List<Student> getListOfStudents(Long instructor_id);


    boolean create(String firstName, String lastName, Long user_id);
}
