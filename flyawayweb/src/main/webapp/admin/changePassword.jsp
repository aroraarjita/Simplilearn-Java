<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
</head>
<body>

	<jsp:useBean id="adminDAO"
		class="com.simplilearn.flyawayweb.dao.implementation.AdminDAO">
	</jsp:useBean>

	<%
	String newPassword = request.getParameter("password");
	String confirmPassword = request.getParameter("confirmPassword");
	
	 if(newPassword != null && !newPassword.isEmpty() && confirmPassword != null 
    		  && !confirmPassword.isEmpty() ){
    		 if(newPassword.equals(confirmPassword)){%>
	<jsp:useBean id="admin" class="com.simplilearn.flyawayweb.entity.Admin"></jsp:useBean>
	<jsp:setProperty property="*" name="admin" />
	<%
   int result = adminDAO.updateAdmin(admin);
   if(result == 1){
		 session.invalidate();
		 response.sendRedirect("loginForm.jsp");
	 }
    		 }
    		 else{
    			 out.println("<h4 style='color:red;'>password not matching</h4>");   %>
	<jsp:include page="changePasswordForm.jsp"></jsp:include>
	<%  
    		} 
    		
    		%>
<%
	 }
	 else {
		 out.println("<h4 style='color:red;'>new and confirm can't be empty</h4>"); %>		 
		 <jsp:include page="changePasswordForm.jsp"></jsp:include>
	 <%
	 }
	 %>
	






</body>
</html>