<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Setup Product Categories</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/shared/admin-header.jsp" ></jsp:include>
<jsp:include page="/WEB-INF/views/shared/admin-topbar.jsp" ></jsp:include>

Total Categories: ${list.size()} &nbsp;&nbsp; <a href="admineditcat?id=0">Add Category</a><br>
<table border=1 cellspacing=2 cellpadding=4>
 	<thead>
 	<tr>
 		<th>Category</th>
 		<th>Action</th>
 	</tr>
 	</thead>
 	<tbody>
 	  <c:forEach items="${list}" var="item">
 	  	<tr>
 	  		<td>${item.getName() }</td>
 	  		<td>
 	  			<a href="admineditcat?id=${item.getCatId()}">Edit</a> | <a href="admindeletecat?id=${item.getCatId()}">Delete</a>
 	  		</td>
 	  	</tr>
 	  </c:forEach>
 	  </tbody>
</table> 	

<jsp:include page="/WEB-INF/views/shared/admin-footer.jsp"></jsp:include>
</body>
</html>