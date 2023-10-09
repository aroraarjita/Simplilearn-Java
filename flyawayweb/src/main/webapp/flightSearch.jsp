<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.simplilearn.flyawayweb.entity.Place"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flyaway Flight Booking</title>
</head>
<body>

<jsp:useBean id="placesDAO" class="com.simplilearn.flyawayweb.dao.implementation.PlacesDAO">
</jsp:useBean>

<%
List<Place> places = placesDAO.getPlaceList();
request.setAttribute("places", places);
%> 

<h1>Welcome to Flyaway Flight Booking</h1>
<div>
<a href="admin/loginForm.jsp">Admin Login</a>
</div>


<form action="search" method="post">
<table border="1">

<tr>
<td>Date of Travel</td>
<td><input type="date" name="travelDate">
</input>
</td>
</tr>

<tr>
<td>Source</td>
<td>
<select style="width:150px" name="src">
<option value="">Select a Source</option>

<c:forEach items="${places}" var="p">
<option value="${p.getPlaceId()}">${p.getPlaceName()}</option>
</c:forEach>
</select>

</td>
</tr>


<tr>
<td>Destination</td>
<td>
<select style="width:150px" name="dest">
<option value="">Select a Destination</option>

<c:forEach items="${places}" var="p">
<option value="${p.getPlaceId()}">${p.getPlaceName()}</option>
</c:forEach>
</select>


</td>
</tr>

<tr>
<td>No. of Persons</td>
<td><input type="number" min="1" name="totalCount"></input></td>
</tr>


<td colspan="2" align="center">
<input type="submit" value="search"/>
<input type="reset" value="reset" />
</td>


</table>
</form>



</body>
</html>