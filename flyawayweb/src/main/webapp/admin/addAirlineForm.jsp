<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.simplilearn.flyawayweb.entity.Airline"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a Airline!!</title>
</head>
<body>

	<jsp:useBean id="airlineDAO"
		class="com.simplilearn.flyawayweb.dao.implementation.AirlinesDAO">
	</jsp:useBean>
	<%
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		Airline airline = null;
		if (id != null) {
			airline = airlineDAO.getAirlineDetails(Integer.parseInt(id));
		}
		request.setAttribute("airline", airline);
	%>
	<h1>
		<c:if test="${id ne null}">
                       Edit a Airline
                   </c:if>
		<c:if test="${id eq null}">
                       Add a New Airline
                   </c:if>
	</h1>
	<a href="home.jsp">Back</a>
	<br>

	<c:if test="${id eq null}">
		<form action="addAirline.jsp" method="post">
	</c:if>

	<c:if test="${id ne null}">
		<form action="editAirline.jsp" method="post">
			<input type="hidden" name="airlineId"
				value="${airline.getAirlineId()}" />
	</c:if>
	<table border=1>
		<tr>
			<td>Airline Name</td>
			<td><input type="text" name="airlineName"
				value="<c:out value='${airline.getAirlineName()}'/>" /></td>
		</tr>
		<tr>
			<td>Airline Code</td>
			<td><input type="text" name="airlineCode"
				value="<c:out value='${airline.getAirlineCode()}'/>" /></td>
		</tr>
		<tr>
			<td colspan=2 align="center"><c:if test="${id eq null }">
					<input type="submit" value="Add" />
				</c:if> <c:if test="${id ne null }">
					<input type="submit" value="Update" />
				</c:if></td>
		</tr>
	</table>
	
	</form>
</body>
</html>