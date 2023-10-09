<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.*,com.simplilearn.flyawayweb.model.Passenger,com.simplilearn.flyawayweb.model.FlightSearch,
    com.simplilearn.flyawayweb.entity.Flight"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
</head>
<body>
	<jsp:useBean id="flightDAO"
		class="com.simplilearn.flyawayweb.dao.implementation.FlightsDAO"></jsp:useBean>

	<%
		String flightId = (String) session.getAttribute("flightId");
		FlightSearch flightSearch = (FlightSearch) session.getAttribute("flightSearch");

		Flight flightDetails = flightDAO.getFlightDetails(Integer.parseInt(flightId));
		request.setAttribute("flightDetails", flightDetails);
		
		
		int totalAmount = flightSearch.getCount() * flightDetails.getPrice();
		List<Passenger> passengers = (List<Passenger>) session.getAttribute("passengers");
		request.setAttribute("passList", passengers);
	%>

	<h1>
		Thank you, You have successfully paid the amount of Rs.<%=totalAmount%></h1>
	<h4>Below are the flight and Passengers Details</h4>

    <table border="1" width="50%">
	<thead>
		<tr>
			<th>Name</th>
			<th>Airline</th>
			<th>Source</th>
			<th>Destination</th>
			<th>Price</th>
		</tr>
	</thead>
	<c:choose>
		<c:when test="${flightDetails != null}">
			<tr>
				<td><c:out value="${flightDetails.getFlightName()}"></c:out></td>
				<td><c:out
						value="${flightDetails.getAirlineId().getAirlineName() }"></c:out></td>
				<td><c:out value="${flightDetails.getSource().getPlaceName()}"></c:out></td>
				<td><c:out
						value="${flightDetails.getDestination().getPlaceName()}"></c:out></td>
				<td><c:out value="${flightDetails.getPrice() }"></c:out></td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan=6>No Data</td>
			</tr>
		</c:otherwise>
	</c:choose>
	</table>


	<br>
	<br>
	<table border="1" width="50%">
		<thead>
			<tr>
				<th>Name</th>
				<th>Age</th>
				<th>Email</th>
				<th>Mobile No</th>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${!passList.isEmpty()}">
				<c:forEach items="${passList}" var="p">
					<tr>
						<td><c:out value="${p.getFullName() }"></c:out></td>
						<td><c:out value="${p.getAge() }"></c:out></td>
						<td><c:out value="${p.getEmail() }"></c:out></td>
						<td><c:out value="${p.getMobileNumber() }"></c:out></td>
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

	<br>
	<br>
	<a href="./">Home</a>

</body>
</html>