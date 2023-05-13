package com.sanvalero.servlet;

import com.sanvalero.Dao.Database;
import com.sanvalero.Dao.TeamsDAO;
import com.sanvalero.Domain.Teams;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/searchTeam")
@MultipartConfig

public class SearchTeamServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");



        String Tname = "%" + request.getParameter("search") + "%";
        String stadium = "%" + request.getParameter("search") + "%";
        String city = "%" + request.getParameter("search") + "%";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();


            List<Teams> teams = Database.jdbi.withExtension(TeamsDAO.class, dao -> {
                return dao.searchTeamByNameorstadiumorcity(Tname, stadium, city);
            });



            request.setAttribute("teams", teams);
            request.getRequestDispatcher("team-search.jsp").forward(request, response);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
