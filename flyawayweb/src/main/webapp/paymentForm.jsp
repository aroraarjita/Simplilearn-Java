<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Details</title>
</head>
<body>


	<h1>Payment Details</h1>
	<form method="post" action="payment.jsp">
		<table>
			<tr>
				<td>Debit card Number</td>
				<td><input type="number" required name="cardno" min="1"
					maxlength="16"></td>
			</tr>
			<tr>
				<td>Expiry Date</td>
				<td><input type="text" required name="expiry"></td>
			</tr>
			<tr>
				<td>CVV</td>
				<td><input type="number" required min="1" maxlength="3"></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>


</body>
</html>