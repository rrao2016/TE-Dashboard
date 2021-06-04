package com.techelevator.dao;

import com.techelevator.model.SuccessStory;

import java.util.List;

public interface SuccessStoryDAO {
    List<SuccessStory> getAllSuccessStories();

    boolean saveStory(SuccessStory successStory);
}
