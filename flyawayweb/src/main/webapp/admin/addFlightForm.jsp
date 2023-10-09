<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.simplilearn.flyawayweb.entity.Flight,
	com.simplilearn.flyawayweb.entity.Place,
	com.simplilearn.flyawayweb.entity.Airline,
	java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a Flight!</title>
</head>
<body>

	<jsp:useBean id="airlineDAO"
		class="com.simplilearn.flyawayweb.dao.implementation.AirlinesDAO"></jsp:useBean>
	<jsp:useBean id="placeDAO"
		class="com.simplilearn.flyawayweb.dao.implementation.PlacesDAO"></jsp:useBean>
	<jsp:useBean id="flightDAO"
		class="com.simplilearn.flyawayweb.dao.implementation.FlightsDAO"></jsp:useBean>
	<%
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		Flight flight = null;
		if (id != null) {
			flight = flightDAO.getFlightDetails(Integer.parseInt(id));
		}
		request.setAttribute("flight", flight);
		List<Place> places = placeDAO.getPlaceList();
		List<Airline> airlines = airlineDAO.getAirlines();
		request.setAttribute("places", places);
		request.setAttribute("airlines", airlines);
	%>
	<h1>
		<c:if test="${id ne null}">
                       Edit a Flight
                   </c:if>
		<c:if test="${id eq null}">
                       Add a Flight
                   </c:if>
	</h1>
	<a href="home.jsp">Back</a>
	<br>

	<c:if test="${id eq null}">
		<form action="addFlight.jsp" method="post">
	</c:if>
	<c:if test="${id ne null}">
		<input type="hidden" name="flightId" value="${flight.getFlightId()}" />
	</c:if>
	<table border=1>
		<tr>
			<td>Flight Name</td>
			<td><input type="text" name="flightName"
				value="<c:out value='${flight.getFlightName()}'/>" /></td>
		</tr>


		<tr>
			<td>Airline Name</td>
			<td><select style="width: 150px;" name="airlineId">
					<option value="">Select an Airline</option>
					<c:forEach items="${airlines}" var="s">
						<option value="${s.getAirlineId()}"
							${s.getAirlineId() == flight.getAirlineId().getAirlineId() ? 'selected="selected"' : ''}>${s.getAirlineName()}</option>
					</c:forEach>
			</select></td>

		</tr>

		<tr>
			<td>Source</td>
			<td><select style="width: 150px;" name="source">
					<option value="">Select an Source</option>
					<c:forEach items="${places}" var="p">
						<option value="${p.getPlaceId()}"
							${p.getPlaceId() == flight.getSource().getPlaceId() ? 'selected="selected"' : ''}>${p.getPlaceName()}</option>
					</c:forEach>
			</select></td>

		</tr>


		<tr>
			<td>Destination</td>
			<td><select style="width: 150px;" name="destination">
					<option value="">Select a Destination</option>
					<c:forEach items="${places}" var="p">
						<option value="${p.getPlaceId()}"
							${p.getPlaceId() == flight.getDestination().getPlaceId() ? 'selected="selected"' : ''}>${p.getPlaceName()}</option>
					</c:forEach>
			</select></td>
		</tr>

		<tr>
			<td>Price</td>
			<td><input type="number" name="flightPrice" min="1000"
				value="<c:out value='${flight.getPrice()}'/>" /></td>
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