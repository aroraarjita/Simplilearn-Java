<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.simplilearn.flyawayweb.entity.Flight,java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flights List</title>

<style>
td {
	text-align: center;
}
</style>

</head>
<body>
	<h1>Flights</h1>
	<jsp:useBean id="flightDAO"
		class="com.simplilearn.flyawayweb.dao.implementation.FlightsDAO"></jsp:useBean>
	<%
		List<Flight> list = flightDAO.getFlightList();
		request.setAttribute("list", list);
	%>

	<a href="addFlightForm.jsp">Add New Flight</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="home.jsp">Home</a>
	<br />
	<br />
	<c:out value="${!list.isEmpty()}"></c:out>

	<table border="1" width="50%">
		<tr>
			<th>Name</th>
			<th>Airline</th>
			<th>Way</th>
			<th>Price</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:choose>
			<c:when test="${!list.isEmpty()}">
				<c:forEach items="${list}" var="u">
					<tr>
						<td>${u.getFlightName()}</td>
						<td>${u.getAirlineId().getAirlineName()}</td>
						<td>${u.getSource().getPlaceCode().concat(' - ').concat(u.getDestination().getPlaceCode())}</td>		
						<td><c:out value="${u.getPrice()}"></c:out></td>
						<td><a href="addFlightForm.jsp?id=${u.getFlightId()}">Edit</a></td>
						<td><a href="deleteFlight.jsp?id=${u.getFlightId()}">Delete</a></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan=4>No Data</td>
				</tr>
			</c:otherwise>
		</c:choose>


	</table>


</body>
</html>