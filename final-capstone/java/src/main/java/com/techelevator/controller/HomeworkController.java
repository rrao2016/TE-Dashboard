package com.techelevator.controller;

import com.techelevator.dao.HomeworkDAO;
import com.techelevator.model.Homework;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin
public class HomeworkController {

    private HomeworkDAO homeworkDAO;

    public HomeworkController(HomeworkDAO homeworkDAO) {
        this.homeworkDAO = homeworkDAO;
    }

    @RequestMapping(path = "/gethomeworkbyid/{id}", method = RequestMethod.GET )
    public List<Homework> returnHomeworkById(@PathVariable Long id) {
        List<Homework> homework = new ArrayList<>();
        try{
            homework = homeworkDAO.getHomeworkByStudentId(id);
            return homework;
        }catch (DataAccessException e){
            System.out.println(e);
        }
        return homework;
    }
}
