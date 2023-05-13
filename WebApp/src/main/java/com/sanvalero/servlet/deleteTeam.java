package com.sanvalero.servlet;

import com.sanvalero.Dao.Database;
import com.sanvalero.Dao.TeamsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/remove-team")
public class deleteTeam extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out= response.getWriter();
        int id= Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            Database.jdbi.withExtension(TeamsDAO.class, dao -> {
                dao.deleteTeam(id);
                return null;
            });

            response.sendRedirect("index.jsp");


        }catch(ClassNotFoundException cnfe){
            cnfe.printStackTrace();
        }
    }



}
