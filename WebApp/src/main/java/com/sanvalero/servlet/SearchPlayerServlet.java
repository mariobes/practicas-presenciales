package com.sanvalero.servlet;

import com.sanvalero.Dao.Database;
import com.sanvalero.Dao.PlayersDAO;
import com.sanvalero.Domain.Player;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/searchPlayer")
@MultipartConfig

public class SearchPlayerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");



        String pName = "%" + request.getParameter("search") + "%";
        String lastname = "%" + request.getParameter("search") + "%";
        String position = "%" + request.getParameter("search") + "%";


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();


            List<Player> players = Database.jdbi.withExtension(PlayersDAO.class, dao -> {
                return dao.searchPlayerByNameorPosition(pName, position);
            });



            request.setAttribute("players", players);
            request.getRequestDispatcher("player-search.jsp").forward(request, response);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
