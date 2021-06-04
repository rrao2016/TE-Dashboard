package com.techelevator.dao;

import com.techelevator.model.Placement;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PlacementSqlDAO implements PlacementDAO{
    private JdbcTemplate jdbcTemplate;
    private PlacementSqlDAO(JdbcTemplate jdbcTemplate) { this.jdbcTemplate = jdbcTemplate; }

    @Override
    public List<Placement> getAllPlacementData() {
        List<Placement> placements = new ArrayList<>();
        String sql = "SELECT * FROM placements";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()) {
            Placement placement = mapRowToPlacement(results);
            placements.add(placement);
        }

        return placements;
    }

    private Placement mapRowToPlacement(SqlRowSet rs) {
        Placement placement = new Placement();
        placement.setPlacement_id(rs.getLong("placement_id"));
        placement.setCompany_name(rs.getString("company_name"));
        placement.setStreet_address(rs.getString("street_address"));
        placement.setCity(rs.getString("city"));
        placement.setState(rs.getString("state"));
        placement.setZipcode(rs.getInt("zipcode"));
        placement.setLatitude(rs.getFloat("lat"));
        placement.setLongitude(rs.getFloat("long"));
        return placement;
    }
}
