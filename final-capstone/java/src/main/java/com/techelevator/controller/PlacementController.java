package com.techelevator.controller;

import com.techelevator.dao.PlacementDAO;
import com.techelevator.model.Placement;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class PlacementController {
    private PlacementDAO placementDAO;

    public PlacementController (PlacementDAO placementDAO) {
        this.placementDAO = placementDAO;
    }

    @RequestMapping(value = "getallplacements", method = RequestMethod.GET)
    public List<Placement> getAllPlacements() {
        try {
            List<Placement> placements = placementDAO.getAllPlacementData();
            return placements;
        } catch (DataAccessException e) {
            System.out.println(e);
        }
        return null;
    }
}
