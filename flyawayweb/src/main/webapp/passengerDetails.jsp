<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*,com.simplilearn.flyawayweb.model.FlightSearch,com.simplilearn.flyawayweb.model.Passenger"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false"%>



<%
	String flightId = (String) session.getAttribute("flightId");
	FlightSearch flightSearch = (FlightSearch) session.getAttribute("flightSearch");
	Integer count = session.getAttribute("count") == null ? 2 : (Integer) session.getAttribute("count") + 1;
	String name = request.getParameter("fullName");
	String email = request.getParameter("email");
	String mobile = request.getParameter("mobile");

	if (name != null && !name.equals("") && email != null && !email.equals("") && mobile != null
			&& !mobile.equals("")) {
%>

<jsp:useBean id="passengerInfo"
	class="com.simplilearn.flyawayweb.model.Passenger"></jsp:useBean>
<jsp:setProperty property="*" name="passengerInfo" />

<%
	List<Passenger> passDetail = (List<Passenger>) session.getAttribute("passengers");
		passDetail.add(passengerInfo);

		if (count <= flightSearch.getCount()) {
			session.setAttribute("count", count);
			session.setAttribute("passengers", passDetail);
			response.sendRedirect("passengerForm.jsp?count=" + count + "&flightId=" + flightId);
		} else {
			request.getRequestDispatcher("paymentForm.jsp").forward(request, response);
		}
	} else {
		out.println("<h4 style='color: red;'>Airline code and name are invalid!!</h4>");
		request.getRequestDispatcher("passengerForm.jsp?count=" + count + "&flightId=" + flightId)
				.include(request, response);
	}
%>
