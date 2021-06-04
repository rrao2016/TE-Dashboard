package com.techelevator.dao;

import com.techelevator.model.InstructorComment;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class InstructorCommentSqlDAO implements InstructorCommentDAO{

    private JdbcTemplate jdbcTemplate;

    public InstructorCommentSqlDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<InstructorComment> getInstructorCommentByInstructorId(Long instructor_id) {
        String search = "SELECT * FROM instructor_comments " +
                "JOIN students ON instructor_comments.student_id = students.student_id " +
                "WHERE instructor_comments.instructor_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(search,instructor_id);
        List<InstructorComment> instructorComments = new ArrayList<>();

        while(results.next()){
            InstructorComment instructorComment = new InstructorComment();
            instructorComment.setComment(results.getString("comment"));
            instructorComment.setInstructorId(results.getLong("instructor_id"));
            instructorComment.setStudentId(results.getLong("student_id"));

            instructorComment.setStudentFirstName(results.getString("firstname"));
            instructorComment.setStudentLastName(results.getString("lastname"));


            instructorComment.setDate(results.getDate("date"));
            instructorComments.add(instructorComment);
        }
        return instructorComments;
    }

    @Override
    public List<InstructorComment> getInstructorCommentByInstructorId(Long instructor_id, Long student_id) {
        String search = "SELECT * FROM instructor_comments " +
                "WHERE instructor_id = ? AND student_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(search,instructor_id, student_id);
        List<InstructorComment> instructorComments = new ArrayList<>();
        while(results.next()){
            InstructorComment instructorComment = new InstructorComment();
            instructorComment.setComment(results.getString("comment"));
            instructorComment.setInstructorId(results.getLong("instructor_id"));
            instructorComment.setStudentId(results.getLong("student_id"));
            instructorComment.setDate(results.getDate("date"));
            instructorComments.add(instructorComment);
        }
        return instructorComments;
    }

    @Override
    public boolean postInstructorComment(InstructorComment instructorComment) {
        String insert  = "INSERT INTO instructor_comments (instructor_id, student_id, comment) " +
                "VALUES(?,?,?)";

        try {
            jdbcTemplate.update(insert,instructorComment.getInstructorId(), instructorComment.getStudentId(), instructorComment.getComment());
            return true;
        } catch(DataAccessException e){
            System.out.println(e);
        }
        return false;
    }

}
