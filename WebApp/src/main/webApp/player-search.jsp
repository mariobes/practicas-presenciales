<%@ page import="java.util.List" %>
<%@ page import="com.sanvalero.Domain.Player" %>

<%@ include file="includes/header.jsp" %>
<main>
<br>

<!DOCTYPE html>
<html lang="es">
    <%@page contentType="text/html"%>
    <%@page pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

<body>
<div class="container">

       <h1>Players</h1>
          <table class="table">
              <thread>
                <tr>
                    <th>Player name</th>
                    <th>Player lastname</th>
                    <th>Position</th>
                    <th>Team</th>


                </tr>
              </thread>

        <% for (Player player : (List<Player>)request.getAttribute("players")) { %>
            <tr>
                <td><%= player.getPName() %></td>
                <td><%= player.getLastname() %></td>
                <td><%= player.getPosition() %></td>
                <td><%= player.getTeam().getTName() %></td>



                <td><a href="player-view-details.jsp?id=<%= player.getIdPlayer()%>" class="btn btn-sm btn-outline-secondary">View details</a></td>
            </tr>
        <% } %>
        <div class="container  d-flex justify-content-center">
                <a href="index.jsp" type="button" class="btn btn-primary col-4" style="margin-top: 30px; margin-bottom: 30px;">Volver al inicio</a>
        </div>

</body>
</table>
</div>
</html>