<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.simplilearn.flyawayweb.entity.Airline"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Airline</title>
</head>
<body>
<jsp:useBean id="airlineDAO" class="com.simplilearn.flyawayweb.dao.implementation.AirlinesDAO"></jsp:useBean>

<%  
String id = request.getParameter("id");
Airline airline = airlineDAO.getAirlineDetails(Integer.parseInt(id));
int result = airlineDAO.deleteAirline(airline);
if(result == 1){
	response.sendRedirect("viewAirline.jsp");
}
%> 
</body>
</html>