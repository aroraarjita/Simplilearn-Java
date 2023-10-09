<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="placeDAO" class="com.simplilearn.flyawayweb.dao.implementation.PlacesDAO"></jsp:useBean>
<jsp:useBean id="place" class="com.simplilearn.flyawayweb.entity.Place"></jsp:useBean>  
<jsp:setProperty property="*" name="place"/>  

<%

int result = placeDAO.updatePlace(place);
if(result == 1){
	response.sendRedirect("viewPlace.jsp");
} 
%>
</body>
</html>