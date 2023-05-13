<%@ page import="java.util.List" %>
<%@ page import="com.sanvalero.Domain.Teams" %>

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

       <h1>Equipo</h1>
          <table class="table">
              <thread>
                <tr>
                    <th>ID</th>
                    <th>Team name</th>
                    <th>stadium</th>
                    <th>City</th>

                </tr>
              </thread>

        <% for (Teams teams : (List<Teams>)request.getAttribute("teams")) { %>
            <tr>
                <td><%= teams.getIdTeam() %></td>
                <td><%= teams.getTName() %></td>
                <td><%= teams.getStadium() %></td>
                <td><%= teams.getCity() %></td>
                <td><a href="view-details.jsp?id=<%= teams.getIdTeam()%>" class="btn btn-sm btn-outline-secondary">View details</a></td>
            </tr>
        <% } %>
        <div class="container  d-flex justify-content-center">
                <a href="index.jsp" type="button" class="btn btn-primary col-4" style="margin-top: 30px; margin-bottom: 30px;">Volver al inicio</a>
        </div>

</body>
</table>
</div>
</html>