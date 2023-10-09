<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
</head>
<body>

<h1>Change Password</h1>
<c:out value="${sessionScope.adminDetails.getId()}"></c:out>
<form method="post" action="<c:out value="${pageContext.request.contextPath }"></c:out>/admin/changePassword.jsp">
<input type="hidden" name="adminId" value='<c:out value="${sessionScope.adminDetails.getId()}"></c:out>'/>
<input type="hidden" name="username" value='<c:out value="${sessionScope.adminDetails.getUsername()}"></c:out>'/>

<table border="1">
<tr>
<td>New password</td>
<td><input type="password" name="password"/></td>
</tr>

<tr>
<td>Confirm password</td>
<td><input type="password" name="confirmPassword"/></td>
</tr>

<tr>
<td></td>
<td colspan="2">
<input type="reset" value="Reset"/>
<input type="submit" value="Save"/>
</td>
</tr>


</table>



</form>



</body>
</html>