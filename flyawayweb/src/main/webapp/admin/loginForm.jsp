<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Form</title>
</head>
<body>
<h1>Login Form</h1>
<form action="login.jsp" method="post">

<table>

<tr>
<td>Username</td>
<td>
<input type="text" name="username"></input>
</td>
</tr>


<tr>
<td>Password</td>
<td>
<input type="password" name="password"></input>
</td>
</tr>

<tr colspan=2>
<td>
<input type="submit" value="Log In" />
</td>
</tr>



</table>
</form>



</body>
</html>