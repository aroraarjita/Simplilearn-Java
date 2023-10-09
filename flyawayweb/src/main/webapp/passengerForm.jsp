<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Passenger Form</title>
</head>
<body>

<h1>Passenger <c:out value='${sessionScope.count == null ? 1 : sessionScope.count}'></c:out> Details</h1>
<%
String flightId = request.getParameter("flightId");
if(flightId != null){
	session.setAttribute("flightId", flightId);
}
%>

<form action="passengerDetails.jsp" method="post">
<table>

<tr>
<td>Full Name</td>
<td><input name="fullName" type="text" /></td>
</tr>

<tr>
<td>Email</td>
<td><input name="email" type="email"/></td>
</tr>

<tr>
<td>Mobile Number</td>
<td><input name="mobile" type="text"/></td>
</tr>


<tr>
<td>Age</td>
<td><input name="age" type="number" min=1/></td>
</tr>

<td colspan=2></td>

<td>

<input value="Reset" type="reset" />
<input value="Submit" type="submit"/>

</td>



</table>




</form>



</body>
</html>