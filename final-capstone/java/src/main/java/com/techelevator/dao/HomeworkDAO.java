package com.techelevator.dao;

import com.techelevator.model.Homework;

import java.util.List;

public interface HomeworkDAO {
    List<Homework> getHomeworkByStudentId(Long student_id);
}
