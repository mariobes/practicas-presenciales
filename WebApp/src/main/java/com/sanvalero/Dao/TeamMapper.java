package com.sanvalero.Dao;


import com.sanvalero.Domain.Teams;

import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;


import java.sql.ResultSet;
import java.sql.SQLException;

public class TeamMapper implements RowMapper<Teams> {


    @Override
    public Teams map(ResultSet rs, StatementContext ctx) throws SQLException {

        return new Teams(rs.getInt("ID"),
                rs.getString("name"),
                rs.getString("stadium"),
                rs.getString("city"));



    }
}

