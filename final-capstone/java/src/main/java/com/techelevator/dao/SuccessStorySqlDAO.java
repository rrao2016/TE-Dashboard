package com.techelevator.dao;

import com.techelevator.model.SuccessStory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SuccessStorySqlDAO implements SuccessStoryDAO{
    private JdbcTemplate jdbcTemplate;
    private SuccessStorySqlDAO(JdbcTemplate jdbcTemplate) { this.jdbcTemplate = jdbcTemplate; }

    @Override
    public List<SuccessStory> getAllSuccessStories() {
        List<SuccessStory> stories = new ArrayList<>();
        String sql = "SELECT * FROM stories";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()) {
            SuccessStory story = mapRowToStory(results);
            stories.add(story);
        }
        return stories;
    }

    @Override
    public boolean saveStory(SuccessStory successStory) {
        String sql = "INSERT INTO stories (first_name, title, message) " +
                "VALUES (?, ?, ?)";
        try {
            String firstName = successStory.getFirst_name();
            String title = successStory.getTitle();
            String message = successStory.getMessage();
            jdbcTemplate.update(sql, firstName, title, message);
            return true;
        } catch(DataAccessException e) {
            return false;
        }
    }




    private SuccessStory mapRowToStory(SqlRowSet rs) {
        SuccessStory story = new SuccessStory();
        story.setStory_id(rs.getLong("story_id"));
        story.setFirst_name(rs.getString("first_name"));
        story.setTitle(rs.getString("title"));
        story.setMessage(rs.getString("message"));
        return story;
    }
}
