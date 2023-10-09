<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.simplilearn.flyawayweb.entity.Admin"%>
    
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
</head>
<body>

<jsp:useBean id="adminDAO" class="com.simplilearn.flyawayweb.dao.implementation.AdminDAO"></jsp:useBean>

<% 
String username = request.getParameter("username");
String password = request.getParameter("password");

if(username!= null && !username.equals("") 
&& password != null && !password.equals("")){
	
	Admin details = adminDAO.getAdminDetails(username, password);
	
	if(details != null){
		session.setAttribute("loggedId", true);
		session.setAttribute("adminDetails", details);
		response.sendRedirect("home.jsp");
	}
	
}
else{%>
<h4 style="color:red">Invalid Username or Password </h4>

<%
}
%>

</body>
</html>