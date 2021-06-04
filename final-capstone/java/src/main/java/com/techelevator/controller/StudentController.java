package com.techelevator.controller;

import com.techelevator.dao.StudentDAO;
import com.techelevator.model.Student;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@CrossOrigin
public class StudentController {

    private StudentDAO studentDAO;

    public StudentController(StudentDAO studentDAO) {
        this.studentDAO = studentDAO;
    }

    @RequestMapping(value = "/studentprofile", method = RequestMethod.POST)
    public void createStudentProfile(@Valid @RequestBody Student student){
        System.out.println(student);
        try {
            studentDAO.create(student.getFirstName(), student.getLastName(), student.getUser_id());
        } catch (DataAccessException e) {
            System.out.println(e);
        }
    }

    @RequestMapping(path = "/getstudentbyid/{id}", method=RequestMethod.GET )
    public Student returnStudentById(@PathVariable Long id) { //TODO may be an int instead of Long
        try {
            Student student = studentDAO.getStudentByUserId(id);
            System.out.println(student);
            return student;
        } catch(DataAccessException e){
            System.out.println(e);
        }
        return null;
    }


}
