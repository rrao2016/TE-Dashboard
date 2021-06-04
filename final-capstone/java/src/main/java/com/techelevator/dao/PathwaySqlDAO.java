package com.techelevator.dao;

import com.techelevator.model.Pathway;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PathwaySqlDAO implements PathwayDAO{

    private JdbcTemplate jdbcTemplate;

    public PathwaySqlDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Pathway> getPathwayByStudentId(Long student_id) {
        String search = "SELECT * FROM students " +
                "JOIN student_pathway ON students.student_id = student_pathway.student_id " +
                "JOIN pathway ON pathway.pathway_id = student_pathway.pathway_id " +
                "Where students.student_id = ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(search, student_id);

        List<Pathway> pathways = new ArrayList<>();

        while(results.next()){
            Pathway pathway = new Pathway();
            pathway.setFeedback(results.getString("feedback"));
            pathway.setScore(results.getInt("score"));
            pathway.setPathway_id(results.getLong("pathway_id"));
            pathway.setStudent_id(results.getLong("student_id"));
            pathway.setName(results.getString("name"));
            pathway.setModuleId(results.getLong("module_id"));
            pathways.add(pathway);
        }

        return pathways;
    }
}
