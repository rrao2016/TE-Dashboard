package com.techelevator.dao;

import com.techelevator.model.Instructor;
import com.techelevator.model.InstructorComment;

import java.util.List;

public interface InstructorCommentDAO {

    List<InstructorComment> getInstructorCommentByInstructorId(Long instructor_id);

    List<InstructorComment> getInstructorCommentByInstructorId(Long instructor_id, Long student_id);

    boolean postInstructorComment(InstructorComment instructorComment);


}
