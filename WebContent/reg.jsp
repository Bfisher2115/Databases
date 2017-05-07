<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
//pull info from registration
String f_name=request.getParameter("fname"); 
String l_name = null;
l_name = request.getParameter("lname");
String gender = null;
gender = request.getParameter("gender");
String g = null;
if(gender.equals("male")){
	g = "M";
}
else if (gender.equals("female")){
	g = "F";
}
else if (gender.equals("other")){
	g = "O";
}
System.out.println(g);
String email = request.getParameter("email");
String phone = request.getParameter("phone");
//int phone_no = Integer.parseInt(phone);
String check_in = request.getParameter("check-in");
String check_out = request.getParameter("check-out");
String room_type = request.getParameter("room_type");
String user_name = f_name +" "+l_name;
try{
Class.forName("com.mysql.jdbc.Driver"); 
//connect to the db
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoteldb?useSSL=false","root","password"); 
Statement st= con.createStatement(); 
String query_string = "insert into customer values (NULL,'"+email+"',NULL,NULL,'"+f_name+"''"+l_name+"')";
System.out.println(query_string);
int i=st.executeUpdate(query_string); 
if (i > 0){
	out.println("Hello "+user_name+", your booking is done successfully");
}
else{
	out.println("Hello "+user_name+", your booking could not be completed. Sorry for the inconvenience");
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>