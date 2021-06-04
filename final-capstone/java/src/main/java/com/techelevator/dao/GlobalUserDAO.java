package com.techelevator.dao;

import com.techelevator.model.GlobalUserListItem;
import com.techelevator.model.User;

import java.util.List;

public interface GlobalUserDAO {
    List<GlobalUserListItem> findAllGlobalUsers();
    List<GlobalUserListItem> getAllData();

}
