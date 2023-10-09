 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<body>
<jsp:useBean id="adminDAO" class="com.simplilearn.flyawayweb.dao.implementation.AdminDAO"></jsp:useBean>

<% 
Long adminCount = adminDAO.getAdminRowCount();

if(adminCount == 0){
%>
<jsp:useBean id="admin" class="com.simplilearn.flyawayweb.entity.Admin"></jsp:useBean>
<jsp:setProperty property="username" name="admin" value="admin"/>
<jsp:setProperty property="password" name="admin" value="admin!23"/>
<%
int row = adminDAO.addAdmin(admin);
}
%>



<h1>Welcome to Flyaway</h1>

<h2>Book your reservations <a href="flightSearch.jsp">here</a></h2>
</body>
</html>
