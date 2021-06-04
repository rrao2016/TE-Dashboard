package com.techelevator.controller;

import com.techelevator.dao.InstructorCommentDAO;
import com.techelevator.model.InstructorComment;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin
public class InstructorCommentController {
    private InstructorCommentDAO instructorCommentDAO;

    public InstructorCommentController(InstructorCommentDAO instructorCommentDAO) {
        this.instructorCommentDAO = instructorCommentDAO;
    }

    @RequestMapping(path="/saveinstructorfeedback", method = RequestMethod.POST)
    public boolean saveInstructorFeedback(@RequestBody InstructorComment instructorComment){

        try {
            instructorCommentDAO.postInstructorComment(instructorComment);
            return true;
        } catch (DataAccessException e){
            System.out.println(e);
        }
        return false;
    }

    @RequestMapping(path="/getinstructorfeedback/{instructor_id}/{student_id}", method = RequestMethod.GET)
    public List<InstructorComment> getInstructorFeedback(@PathVariable Long instructor_id, @PathVariable Long student_id){
        List<InstructorComment> instructorComments = new ArrayList<>();
        try {
            instructorComments = instructorCommentDAO.getInstructorCommentByInstructorId(instructor_id, student_id);
            return instructorComments;
        } catch (DataAccessException e){
            System.out.println(e);
        }
        return instructorComments;
    }

    @RequestMapping(path="/getinstructorfeedback/{instructor_id}", method = RequestMethod.GET)
    public List<InstructorComment> getInstructorFeedback(@PathVariable Long instructor_id){
        List<InstructorComment> instructorComments = new ArrayList<>();
        try {
            instructorComments = instructorCommentDAO.getInstructorCommentByInstructorId(instructor_id);
            return instructorComments;
        } catch (DataAccessException e){
            System.out.println(e);
        }
        return instructorComments;
    }

}
