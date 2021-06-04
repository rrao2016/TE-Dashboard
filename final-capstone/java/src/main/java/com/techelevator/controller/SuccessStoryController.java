package com.techelevator.controller;

import com.techelevator.dao.SuccessStoryDAO;
import com.techelevator.model.SuccessStory;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class SuccessStoryController {
    private SuccessStoryDAO successStoryDAO;

    public SuccessStoryController (SuccessStoryDAO successStoryDAO) { this.successStoryDAO = successStoryDAO; }

    @RequestMapping(value = "getallstories", method = RequestMethod.GET)
    public List<SuccessStory> getAllStories() {
        try {
            List<SuccessStory> stories = successStoryDAO.getAllSuccessStories();
            return stories;
        } catch (DataAccessException e) {
            System.out.println(e);
        }
        return null;
    }

    @RequestMapping(path = "/savestory", method = RequestMethod.POST)
    public boolean returnStory(@RequestBody SuccessStory successStory) {
        try {
            successStoryDAO.saveStory(successStory);
            return true;
        } catch (DataAccessException e) {
            System.out.println(e);
        }
        return false;
    }

}
