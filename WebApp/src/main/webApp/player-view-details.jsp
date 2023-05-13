<%@ page import= "com.sanvalero.Dao.Database" %>
<%@ page import= "com.sanvalero.Dao.PlayersDAO" %>
<%@ page import= "com.sanvalero.Domain.Player" %>
<%@ page import= "com.sanvalero.Dao.PlayerMapper"%>

<%@include file="includes/header.jsp"%>
 <%@page contentType="text/html"%>
    <%@page pageEncoding="UTF-8"%>

    <main class="blue">
    <%
    int idPlayer= Integer.parseInt(request.getParameter("id"));

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            Player player= Database.jdbi.withExtension(PlayersDAO.class, dao-> dao.getPlayer(idPlayer));


    %>

      <section class="details">

           <div class="container-details">


          <div class= "info">
          <h3><%=player.getPName()%> <%=player.getLastname()%><h3>
          <span><%=player.getPosition()%></span>
          </div>
          <div class="resume">
           <p><span class="name">Team:</span><%=player.getTeam().getTName()%></p>
           <p><span class= "stadium">Stadium:</span> <%=player.getTeam().getStadium()%></p>
          <p><span class= "city">City:</span><%=player.getTeam().getCity()%></p>
            <a href="player-form.jsp?id=<%=player.getIdPlayer()%>&action=edit" class="btn btn-sm btn-outline-primary">Modificar</a>


        </div>
      </div>


           </section>



    </main>