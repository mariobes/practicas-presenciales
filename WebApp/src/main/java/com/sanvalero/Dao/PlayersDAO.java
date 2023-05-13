package com.sanvalero.Dao;
import com.sanvalero.Domain.Player;

import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface PlayersDAO {
    @SqlQuery("SELECT * FROM players WHERE ID= ?")
    @UseRowMapper(PlayerMapper.class)
    Player getPlayer(int idPlayer);


    @SqlQuery("SELECT * FROM players")
    @UseRowMapper(PlayerMapper.class)
    List<Player> getPlayers();

    @SqlUpdate("INSERT INTO players (name,lastname,position, ID_team) VALUES(?,?,?,?)")
    void addPlayer(String name, String lastname, String position, int  ID_team);

    @SqlUpdate("DELETE FROM players WHERE ID= ?")
    void deletePlayer(int ID);

    @SqlUpdate("UPDATE players SET name= ?,lastname= ?,position= ?, ID_team= ? WHERE ID= ?")
    void editPlayer(String name, String lastname, String position, int ID_team, int ID);

    @SqlQuery("SELECT * FROM players WHERE name like ? or position like ?")
    @UseRowMapper(PlayerMapper.class)
    List<Player> searchPlayerByNameorPosition(@Bind("pName") String name, @Bind("position") String position);
}
