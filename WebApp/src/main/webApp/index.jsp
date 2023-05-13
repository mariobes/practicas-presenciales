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

<script>
$(document).ready(function() {
  $("a[href^='remove-team'],a[href^='remove-player']").click(function(event) {
    event.preventDefault();
    var url = $(this).attr("href");
    var message = $(this).attr("data-message");
    if (typeof message === "undefined") {
      message = "¿Are you sure you want to delete?";
    }
    if (confirm(message)) {
      window.location.href = url;
    }
  });

});



</script>





<main>

  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">Application to manage players and teams</h1>
        <p class="lead text-body-secondary">This application will allow you to modify, add, delete and search for the teams and players you want</p>
        <p>
          <a href="team-form.jsp?action=register" class="btn btn-primary my-2">Register Team</a>
          <a href="player-form.jsp?action=register" class="btn btn-secondary my-2">Register Player</a>


        <p>
        <form action="searchTeam" method="post" class="form-inline mt-2 mt-md-0">
                    <input class="form-control mr-sm-2" name="search" method="post" type="text" id="search" placeholder="Search a team" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
         <form action="searchPlayer" method="post" class="form-inline mt-2 mt-md-0">
                             <input class="form-control mr-sm-2" name="search" method="post" type="text" id="search" placeholder="Search a player" aria-label="Search">
                             <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                             </form>

          </p>
         </p>
         </div>
      </div>
    </div>
  </section>


  <section class="team">

     <h1 class="thead">TEAMS</h1>
     <div class="container-team">


            <%
            Class.forName("com.mysql.cj.jdbc.Driver");
                    Database.connect();

            List<Teams> teamList= Database.jdbi.withExtension(TeamsDAO.class, TeamsDAO::getTeams);
                      for (Teams teams : teamList) {

            %>


            <div class="teams">
            <div class= "info">
          <p><%= teams.getTName()%></p>
           <span class= ""> <%=teams.getStadium()%></span>
           </div>
          <div class="d-flex justify-content-between align-items-center">
          <div class="btn-group pl">
          <a href="view-details.jsp?id=<%=teams.getIdTeam()%>" class="btn btn-sm btn-outline-dark">View details</a>


            <a href="remove-team?id=<%=teams.getIdTeam()%>" class="btn btn-sm btn-outline-danger">Delete</a>
                                    </div>
                                    <p class="idteam">ID: <%=teams.getIdTeam()%></p>
                                  </div>
                                </div>

                    <%
                                }
                            %>

                        </div>
                       </section>


      <section class= "player">
            <h1 class= "thead">PLAYERS</h1>
               <div class="container-team">


              <%

              List<Player> playerList= Database.jdbi.withExtension(PlayersDAO.class, PlayersDAO::getPlayers);
                        for (Player player : playerList) {

              %>

             <div class="teams">


                 <div class="info">
                  <p><%= player.getPName()%>  <%=player.getLastname()%></p>
                     <span class= ""> <%=player.getPosition()%></span>
                 </div>

                <div class="d-flex justify-content-between align-items-center">
                 <div class="btn-group pl">
              <a href="player-view-details.jsp?id=<%=player.getIdPlayer()%>" class="btn btn-sm btn-outline-dark">View details</a>


                   <a href="remove-player?id=<%=player.getIdPlayer()%>" class="btn btn-sm btn-outline-danger">Remove</a>
                 </div>
                <p class="idteam"><%=player.getTeam().getTName()%></p>
                </div>
               </div>

               <%
                 }
                %>


         </div>

          </section
