<%@ page import= "com.sanvalero.Dao.Database" %>
<%@ page import= "com.sanvalero.Dao.TeamsDAO" %>
<%@ page import= "com.sanvalero.Domain.Teams" %>
<%@ page import= "com.sanvalero.Dao.TeamMapper"%>

<%@include file="includes/header.jsp"%>
 <%@page contentType="text/html"%>
    <%@page pageEncoding="UTF-8"%>

    <main class="black">
    <%
    int idTeam= Integer.parseInt(request.getParameter("id"));

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            Teams teams= Database.jdbi.withExtension(TeamsDAO.class, dao-> dao.getTeam(idTeam));


    %>

        <section class="details">

    <div class="container-details">

        <div class= "info">
        <h3><%=teams.getTName()%></h3>
        <span><%=teams.getCity()%></span>
        </div>
        <div class= "resume">
        <p><span class=""></span><%=teams.getStadium()%></p>
        <a href="team-form.jsp?id=<%=teams.getIdTeam()%>&action=edit" class="btn btn-sm btn-outline-primary">Modificar</a>
      </div>

    </div>


         </section>



    </main>