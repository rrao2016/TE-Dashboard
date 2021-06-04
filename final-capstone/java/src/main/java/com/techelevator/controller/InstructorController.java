package com.techelevator.controller;

import com.techelevator.dao.InstructorDAO;
import com.techelevator.model.Instructor;
import com.techelevator.model.Student;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin
public class InstructorController {

    private InstructorDAO instructorDAO;

    public InstructorController(InstructorDAO instructorDAO) {
        this.instructorDAO = instructorDAO;
    }

    @RequestMapping(value = "/instructorprofile", method = RequestMethod.POST)
    public void createInstructorProfile(@Valid @RequestBody Instructor instructor){
        try {
            instructorDAO.create(instructor.getFirstName(),instructor.getLastName(),instructor.getUser_id());
        } catch (DataAccessException e){
            System.out.println(e);
        }
    }

    @RequestMapping(value = "/getinstructorbyid/{id}", method = RequestMethod.GET)
    public Instructor returnInstructorById(@PathVariable Long id){
        try {
            return instructorDAO.getInstructorByUserId(id);
        } catch (DataAccessException e){
            System.out.println(e);
        }
        return null;
    }

    @RequestMapping(value ="/getstudentsbyinstructorid/{id}", method = RequestMethod.GET)
    public  List<Student> returnListOfStudents(@PathVariable Long id){

        try {
            List<Student> students= instructorDAO.getListOfStudents(id);
            return students;
        } catch (DataAccessException e){

            System.out.println(e);
        }
        return null;

    }

}
