<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="airlineDAO" class="com.simplilearn.flyawayweb.dao.implementation.AirlinesDAO"></jsp:useBean>

<%
String airlineCode = request.getParameter("airlineCode");
String airlineName = request.getParameter("airlineName");

if(airlineName != null && !airlineName.equals("") 
&& airlineCode != null && !airlineCode.equals("")){%>	
<jsp:useBean id="airline" class="com.simplilearn.flyawayweb.entity.Airline"></jsp:useBean>	
<jsp:setProperty property="*" name="airline"/>
<%
int result = airlineDAO.addAirline(airline);

if(result > 0){
	response.sendRedirect("viewAirline.jsp");
}
else{%>
<h4 style="color: red;">Airline code and name are invalid!!</h4>
<jsp:include page="addAirlineForm.jsp"></jsp:include>
<%

}
}

%>

</body>
</html>