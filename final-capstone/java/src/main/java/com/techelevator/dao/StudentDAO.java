package com.techelevator.dao;

import com.techelevator.model.Student;

public interface StudentDAO {
    Student getStudentByUserId(Long userId);

    boolean create(String firstName, String lastName, Long user_id);

}
