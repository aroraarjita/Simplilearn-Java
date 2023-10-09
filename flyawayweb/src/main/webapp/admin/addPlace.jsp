<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Places</title>
</head>
<body>
<jsp:useBean id="placeDAO" class="com.simplilearn.flyawayweb.dao.implementation.PlacesDAO"></jsp:useBean>

<%
String placeCode = request.getParameter("placeCode");
String placeName = request.getParameter("placeName");

if(placeName != null && !placeName.equals("") 
&& placeCode != null && !placeCode.equals("")){%>	
<jsp:useBean id="place" class="com.simplilearn.flyawayweb.entity.Place"></jsp:useBean>	
<jsp:setProperty property="*" name="place"/>
<%
int result = placeDAO.addPlace(place);

if(result > 0){
	response.sendRedirect("viewPlace.jsp");
}
else{%>
<h4 style="color: red;">Place code and name are invalid!!</h4>
<jsp:include page="addPlaceForm.jsp"></jsp:include>
<%

}
}

%>

</body>
</html>