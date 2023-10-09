<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import ="com.simplilearn.flyawayweb.entity.Airline,
    com.simplilearn.flyawayweb.entity.Place,
    java.util.*"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="airlineDAO" class="com.simplilearn.flyawayweb.dao.implementation.AirlinesDAO"></jsp:useBean>
<jsp:useBean id="placeDAO" class="com.simplilearn.flyawayweb.dao.implementation.PlacesDAO"></jsp:useBean>
<jsp:useBean id="flightDAO" class="com.simplilearn.flyawayweb.dao.implementation.FlightsDAO"></jsp:useBean>
<jsp:useBean id="flight" class="com.simplilearn.flyawayweb.entity.Flight"></jsp:useBean>

<%
String flightId = request.getParameter("flightId");
String flightName = request.getParameter("flightName");
String airlineId = request.getParameter("airlineId");
String sourceId = request.getParameter("source");
String destinationId = request.getParameter("destination");
int flightPrice = Integer.parseInt(request.getParameter("flightPrice"));



Airline flightAirline = airlineDAO.getAirlineDetails(Integer.parseInt(airlineId));
Place source = placeDAO.getPlaceDetail(Integer.parseInt(sourceId));
Place destination = placeDAO.getPlaceDetail(Integer.parseInt(destinationId));

System.out.println(source.getPlaceName());
System.out.println(destination.getPlaceName());

flight.setFlightName(flightName);
flight.setSource(source);
flight.setDestination(destination);
flight.setAirlineId(flightAirline);
flight.setPrice(flightPrice);

System.out.println(source.getPlaceName());
System.out.println(source.getPlaceName());

if(flightId != null){
	flight.setFlightId(Integer.parseInt(flightId));
	flightDAO.updateFlight(flight);
}
else{
	flightDAO.addFlight(flight);
}


response.sendRedirect("viewFlight.jsp");
%>


</body>
</html>