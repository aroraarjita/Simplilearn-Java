<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.*,com.simplilearn.flyawayweb.entity.Flight,com.simplilearn.flyawayweb.model.FlightSearch"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flight Details</title>
<style>
td {
	text-align: center;
}
</style>
</head>


<body>

	<jsp:useBean id="flightDAO"
		class="com.simplilearn.flyawayweb.dao.implementation.FlightsDAO"></jsp:useBean>

	<%
		FlightSearch searchResult = (FlightSearch) session.getAttribute("flightSearch");
		List<Flight> flightSearchResult = flightDAO.searchFlights(searchResult.getSource(),
				searchResult.getDestination()); 
		request.setAttribute("flightSearchResult", flightSearchResult);
	%>

	<h1>Flight Search Result</h1>

	<a href="flightSearch.jsp">Back</a>

	<table border="1" width="50%">
		<tr>
			<th>Name</th>
			<th>Airline</th>
			<th>Way</th>
			<th>Price</th>
			<th>Action</th>
		</tr>
		<c:choose>
			<c:when test="${!flightSearchResult.isEmpty()}">
				<c:forEach items="${flightSearchResult}" var="u">
					<tr>
						<td>${u.getFlightName()}</td>
						<td>${u.getAirlineId().getAirlineName()}</td>
						<td>${u.getSource().getPlaceCode().concat(' - ').concat(u.getDestination().getPlaceCode())}</td>
						<td>${u.getPrice()}</td>
						<td><a href="passengerForm.jsp?flightId=${u.getFlightId()}">Book</a></td>

					</tr>
				</c:forEach>
			</c:when>

			<c:otherwise>
				<tr>
					<td colspan=6>No Data</td>
				</tr>
			</c:otherwise>
		</c:choose>


	</table>

</body>
</html>