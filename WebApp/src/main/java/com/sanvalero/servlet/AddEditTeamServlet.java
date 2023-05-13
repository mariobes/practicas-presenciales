package com.sanvalero.servlet;

import com.sanvalero.Dao.Database;
import com.sanvalero.Dao.TeamsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/save-team")
@MultipartConfig
public class AddEditTeamServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out= response.getWriter();

        String tName= request.getParameter("tname");
        String stadium= request.getParameter("stadium");
        String city= request.getParameter("city");

        int id= 0;


        String action= request.getParameter("action");

        if(action.equals("edit")){
            id = Integer.parseInt(request.getParameter("id"));
        }




        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            if(action.equals("edit")) {
                int idTeam= id;
                Database.jdbi.withExtension(TeamsDAO.class, dao -> {

                    dao.editTeam(tName, stadium, city,idTeam);
                    return null;
                });
            }else{
                Database.jdbi.withExtension(TeamsDAO.class, dao -> {
                    dao.addTeam(tName, stadium, city);
                    return null;
                });
            }




            request.getRequestDispatcher("index.jsp").forward(request, response);




        }catch(ClassNotFoundException cnfe){
            cnfe.printStackTrace();
        }
    }


}
