
<%@ page import= "com.sanvalero.Dao.Database" %>
<%@ page import= "com.sanvalero.Dao.PlayersDAO" %>
<%@ page import= "com.sanvalero.Domain.Player" %>
<%@ page import= "com.sanvalero.Dao.PlayerMapper"%>
<%@ page import= "java.util.List" %>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<%
String action = request.getParameter("action");

%>


<main class= "container pad">
<form class="row g-3" method= "post" action="save-player" enctype="multipart/form-data">
  <div class="col-md-6">
    <label for="pname" class="form-label">Player Name</label>
    <input type="text" class="form-control" id="pname" name= "pname">
  </div>
  <div class="col-md-6">
    <label for="lastname" class="form-label">Player lastname</label>
    <input type="text" class="form-control" id="lastname" name= "lastname">
  </div>
  <div class="col-12">
    <label for="position" class="form-label">Position</label>
    <select class="form-control" id="position" name= "position">
    <option value="attack">Attack</option>
     <option value="defense">Defense</option>
      <option value="midfield">Midfield</option>
      <option value="goalkeeper">Goalkeeper</option>
    </select>
  </div>
  <div class="col-12">
        <label for="idTeam" class="form-label">ID team</label>
        <input type="text" class="form-control" id="idteam" name= "idteam">
      </div>



    <input type="hidden" name= "action" value="<%= action %>"/>
    <%
    if(action.equals("edit")){
        int id= Integer.parseInt(request.getParameter("id"));
    %>

<input type="hidden" name= "id" value="<%= id %>"/>

     <%
     }
     %>
  <div class="col-12">
    <input type="submit" value= "Registrar"/>
  </div>
</form>
<div id="result"></div>

</main>