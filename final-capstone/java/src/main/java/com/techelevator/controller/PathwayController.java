package com.techelevator.controller;

import com.techelevator.dao.PathwayDAO;
import com.techelevator.model.Pathway;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin
public class PathwayController {
    private PathwayDAO pathwayDAO;

    public PathwayController(PathwayDAO pathwayDAO) {
        this.pathwayDAO = pathwayDAO;
    }

    @RequestMapping(path="/getpathwaybyid/{id}", method = RequestMethod.GET)
    public List<Pathway> returnPathwayById(@PathVariable Long id){
        List<Pathway> pathways = new ArrayList<>();
        try {
            pathways = pathwayDAO.getPathwayByStudentId(id);
            return pathways;
        } catch(DataAccessException e){
            System.out.println(e);
        }
        return pathways;
    }
}
