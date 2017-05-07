<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Booking Confirmation</title>
</head>
<body>
<h4 align="center">Hotel Reservation System</h4>
<ul>
  <li><a class="active" href="home.html">Home</a></li>
  <li><a href="admin.html">Admin</a></li>
</ul>
<%
//pull username+ pass from form
String username = request.getParameter("username");
String pass = request.getParameter("pass");
Class.forName("com.mysql.jdbc.Driver"); 
//connect to the db
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoteldb?useSSL=false","root","password"); 
Statement st= con.createStatement(); 
// print Query or update statement into a string
String query_string = "SELECT * FROM customer WHERE Email = '"+username+"'";
//call query on string, find if username exits in db
ResultSet rs =st.executeQuery(query_string); 
// need to call next to start the ptr at first result
rs.next();
if (rs.getString(2).equals(username)){
	out.println("username found in db!");
}
else{
	out.println("cannot find username in db!");
	}
%>

</body>
</html>