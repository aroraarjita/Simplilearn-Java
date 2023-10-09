<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.simplilearn.flyawayweb.entity.Place"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a Place!!</title>
</head>
<body>

	<jsp:useBean id="placeDAO"
		class="com.simplilearn.flyawayweb.dao.implementation.PlacesDAO">
	</jsp:useBean>
	<%
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		Place place = null;
		if (id != null) {
			place = placeDAO.getPlaceDetail(Integer.parseInt(id));
		}
		request.setAttribute("place", place);
	%>
	<h1>
		<c:if test="${id ne null}">
                       Edit a Place
                   </c:if>
		<c:if test="${id eq null}">
                       Add a New Place
                   </c:if>
	</h1>
	<a href="home.jsp">Back</a>
	<br>

	<c:if test="${id eq null}">
		<form action="addPlace.jsp" method="post">
	</c:if>

	<c:if test="${id ne null}">
		<form action="editPlace.jsp" method="post">
			<input type="hidden" name="placeId"
				value="${place.getPlaceId()}" />
	</c:if>
	<table border=1>
		<tr>
			<td>Place Name</td>
			<td><input type="text" name="placeName"
				value="<c:out value='${place.getPlaceName()}'/>" /></td>
		</tr>
		<tr>
			<td>Place Code</td>
			<td><input type="text" name="placeCode"
				value="<c:out value='${place.getPlaceCode()}'/>" /></td>
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