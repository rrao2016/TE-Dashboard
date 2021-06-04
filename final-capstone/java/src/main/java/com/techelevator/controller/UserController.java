package com.techelevator.controller;

import com.techelevator.dao.GlobalUserDAO;
import com.techelevator.dao.UserDAO;
import com.techelevator.dao.UserSqlDAO;
import com.techelevator.model.GlobalUserListItem;
import com.techelevator.model.Student;
import com.techelevator.model.User;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin

public class UserController {

    private GlobalUserDAO globalUserDAO;

    public UserController (GlobalUserDAO globalUserDAO){
        this.globalUserDAO = globalUserDAO;

    }

    @RequestMapping(value = "/getallusers", method = RequestMethod.GET)
    public List<GlobalUserListItem> getAllUsers(){
        try {
           List<GlobalUserListItem> users= globalUserDAO.findAllGlobalUsers();
           return users;
        } catch (DataAccessException e) {
            System.out.println(e);
        }
        return null;
    }

    @RequestMapping(value="/getallusersdata", method = RequestMethod.GET)
    public List<GlobalUserListItem> getAllUsersData() {
            try{
            List<GlobalUserListItem> users = globalUserDAO.getAllData();
            return users;
        } catch (DataAccessException e) {
                System.out.println(e);
                return null;
        }

    }

}
