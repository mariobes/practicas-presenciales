<%@ page import= "com.sanvalero.Dao.Database" %>
<%@ page import= "com.sanvalero.Dao.TeamsDAO" %>
<%@ page import= "com.sanvalero.Dao.PlayersDAO" %>
<%@ page import= "com.sanvalero.Domain.Player" %>
<%@ page import= "com.sanvalero.Dao.PlayerMapper" %>
<%@ page import= "com.sanvalero.Domain.Teams" %>
<%@ page import= "com.sanvalero.Dao.TeamMapper"%>
<%@ page import= "java.util.List" %>


<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<%@include file="includes/header.jsp"%>


<main>

  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">Aplicación para gestionar Jugadores y equipos</h1>
        <p class="lead text-body-secondary">Esta aplicación te va a permitir modificar, añadir y buscar los equipos y jugadores que desees</p>
        <p>
          <a href="team-form.jsp?action=register" class="btn btn-primary my-2">Register team</a>
          <a href="player-form.jsp?action=register" class="btn btn-secondary my-2">Registrar Jugador</a>


        <p>
        <form action="searchTeam" method="post" class="form-inline mt-2 mt-md-0">
                    <input class="form-control mr-sm-2" name="search" method="post" type="text" id="search" placeholder="Search a team" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">BUSCAR</button>
                    </form>
         <form action="searchPlayer" method="post" class="form-inline mt-2 mt-md-0">
                             <input class="form-control mr-sm-2" name="search" method="post" type="text" id="search" placeholder="Search a player" aria-label="Search">
                             <button class="btn btn-outline-success my-2 my-sm-0" type="submit">BUSCAR</button>
                             </form>

          </p>
         </p>
         </div>
      </div>
    </div>
  </section>


  <section class="especie1">

     <h1 class="enca1">TEAMS</h1>
     <div class="container-especie">


            <%
            Class.forName("com.mysql.cj.jdbc.Driver");
                    Database.connect();

            List<Teams> teamList= Database.jdbi.withExtension(TeamsDAO.class, TeamsDAO::getTeams);
                      for (Teams teams : teamList) {

            %>


            <div class="especies1">
            <div class= "info">
          <p><%= teams.getTName()%></p>
           <span class= "">Stadium= <%=teams.getStadium()%></span>
           </div>
          <div class="d-flex justify-content-between align-items-center">
          <div class="btn-group pl">
          <a href="view-details.jsp?id=<%=teams.getIdTeam()%>" class="btn btn-sm btn-outline-dark">View details</a>


            <a href="remove-team?id=<%=teams.getIdTeam()%>" class="btn btn-sm btn-outline-danger"  onclick="return eliminacion()">Delete</a>
                                    </div>
                                    <p class="extincion">City: <%=teams.getCity()%></p>
                                  </div>
                                </div>

                    <%
                                }
                            %>

                        </div>
                       </section>


      <section class= "especie1">
            <h1 class= "enca1">Players</h1>
               <div class="container-especie">


              <%

              List<Player> playerList= Database.jdbi.withExtension(PlayersDAO.class, PlayersDAO::getPlayers);
                        for (Player player : playerList) {

              %>

             <div class="especies1">


                 <div class="info">
                  <p><%= player.getPName()%>  <%=player.getLastname()%></p>
                     <span class= "">Position= <%=player.getPosition()%></span>
                 </div>

                <div class="d-flex justify-content-between align-items-center">
                 <div class="btn-group pl">
              <a href="player-view-details.jsp?id=<%=player.getIdPlayer()%>" class="btn btn-sm btn-outline-dark">View details</a>


                   <a href="remove-player?id=<%=player.getIdPlayer()%>" class="btn btn-sm btn-outline-danger">Remove</a>
                 </div>
                <p class="extincion">Team: <%=player.getTeam().getTName()%></p>
                </div>
               </div>

               <%
                 }
                %>


         </div>

          </section
