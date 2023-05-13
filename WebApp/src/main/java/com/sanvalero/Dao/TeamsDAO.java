package com.sanvalero.Dao;
import com.sanvalero.Domain.Teams;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;
public interface TeamsDAO {
    @SqlQuery("SELECT * FROM teams")
    @UseRowMapper(TeamMapper.class)
    List<Teams> getTeams();



    @SqlQuery("SELECT * FROM teams WHERE ID= ?")
    @UseRowMapper(TeamMapper.class)
    Teams getTeam(int ID);





    @SqlUpdate("INSERT INTO teams (name,stadium,city) VALUES(?,?,?)")
    void addTeam(String name, String stadium, String city);

    @SqlUpdate("DELETE FROM teams WHERE ID= ?")
    void deleteTeam(int ID);

    @SqlUpdate("UPDATE teams SET name= ?,stadium= ?, city= ?  WHERE ID= ?")
    void editTeam (String name, String stadium, String city, int ID);

    @SqlQuery("SELECT * FROM teams WHERE name like ? or stadium like ? or city like ?")
    @UseRowMapper(TeamMapper.class)
    List<Teams> searchTeamByNameorstadiumorcity(@Bind("name") String name, @Bind("stadium") String stadium, @Bind("city") String city);

}
