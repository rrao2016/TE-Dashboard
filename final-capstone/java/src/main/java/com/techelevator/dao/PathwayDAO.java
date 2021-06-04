package com.techelevator.dao;

import com.techelevator.model.Pathway;

import java.util.List;

public interface PathwayDAO {

    List<Pathway> getPathwayByStudentId(Long student_id);
}
