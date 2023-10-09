<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.simplilearn.flyawayweb.entity.Airline,java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Airlines</title>

<style>
td {
	text-align: center;
}
</style>

</head>
<body>
	<h1>Airlines</h1>
	<jsp:useBean id="airlineDAO"
		class="com.simplilearn.flyawayweb.dao.implementation.AirlinesDAO"></jsp:useBean>
	<%
		List<Airline> list = airlineDAO.getAirlines();
		request.setAttribute("list", list);
	%>

	<a href="addAirlineForm.jsp">Add New Airline</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="home.jsp">Home</a>
	<br />
	<br />
	<c:out value="${!list.isEmpty()}"></c:out>

	<table border="1" width="50%">
		<tr>
			<th>Name</th>
			<th>Code</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:choose>
			<c:when test="${!list.isEmpty()}">
				<c:forEach items="${list}" var="u">
					<tr>
						<td>${u.getAirlineId()}</td>
						<td>${u.getAirlineCode()}</td>
						<td><a href="addAirlineForm.jsp?id=${u.getAirlineId()}">Edit</a></td>
						<td><a href="deleteAirline.jsp?id=${u.getAirlineId()}">Delete</a></td>
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