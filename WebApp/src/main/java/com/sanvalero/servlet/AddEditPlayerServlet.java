package com.sanvalero.servlet;
import com.sanvalero.Dao.Database;
import com.sanvalero.Dao.PlayersDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/save-player")
@MultipartConfig
public class AddEditPlayerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out= response.getWriter();

        String pName= request.getParameter("pname");
        String lastname= request.getParameter("lastname");
        String position= request.getParameter("position");
        int idTeam= Integer.parseInt(request.getParameter("idteam"));


        int id= 0;


        String action= request.getParameter("action");

        if(action.equals("edit")){
            id = Integer.parseInt(request.getParameter("id"));
        }




        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            if(action.equals("edit")) {
                int idPlayer= id;
                Database.jdbi.withExtension(PlayersDAO.class, dao -> {

                    dao.editPlayer(pName, lastname, position,idTeam, idPlayer);
                    return null;
                });
            }else{
                Database.jdbi.withExtension(PlayersDAO.class, dao -> {
                    dao.addPlayer(pName, lastname, position, idTeam);
                    return null;
                });
            }




            request.getRequestDispatcher("index.jsp").forward(request, response);




        }catch(ClassNotFoundException cnfe){
            cnfe.printStackTrace();
        }
    }


}
