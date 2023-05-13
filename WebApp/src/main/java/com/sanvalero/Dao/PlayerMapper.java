package com.sanvalero.Dao;

import com.sanvalero.Domain.Player;

import com.sanvalero.Domain.Teams;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;


public class PlayerMapper  implements RowMapper<Player>  {
    @Override
    public Player map(ResultSet rs, StatementContext ctx) throws SQLException {

        Database.connect();
        Teams team = Database.jdbi.withExtension(TeamsDAO.class,
                dao -> dao.getTeam(rs.getInt("ID_team")));

        return new Player(rs.getInt("ID"),
                rs.getString("name"),
                rs.getString("lastname"),
                rs.getString("position"),
                team);



    }

}
