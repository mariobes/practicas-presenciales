
<%@ page import= "com.sanvalero.Dao.Database" %>
<%@ page import= "com.sanvalero.Dao.TeamsDAO" %>
<%@ page import= "com.sanvalero.Domain.Teams" %>
<%@ page import= "com.sanvalero.Dao.TeamMapper"%>
<%@ page import= "java.util.List" %>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<%
String action = request.getParameter("action");

%>


<main class= "container pad">
<form class="row g-3" method= "post" action="save-team" enctype="multipart/form-data">
  <div class="col-md-6">
    <label for="tname" class="form-label">Team name</label>
    <input type="text" class="form-control" id="tname" name= "tname">
  </div>
  <div class="col-md-6">
    <label for="stadium" class="form-label">Stadium</label>
    <input type="text" class="form-control" id="stadium" name= "stadium">
  </div>
  <div class="col-12">
    <label for="city" class="form-label">City</label>
    <input type="text" class="form-control" id="city" name= "city">
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