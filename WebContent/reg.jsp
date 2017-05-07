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
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String phone = request.getParameter("phonenumber");
String email = request.getParameter("email");
String password = request.getParameter("password");
Connection con =null;
Statement st = null;
try{
Class.forName("com.mysql.jdbc.Driver"); 
//connect to the db
// TODO: change root to username for mysql and password to password
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoteldb?useSSL=false","root","password"); 
st = con.createStatement(); 
String query_string = "insert into customer values (NULL,'"+email+"',NULL,NULL,'"+firstname+""+lastname+"')";
System.out.println(query_string);
int i = st.executeUpdate(query_string); 
if (i > 0){
	out.println("Hello "+firstname+", your profile has been updated");
}
else{
	out.println("Hello "+firstname+", your booking could not be completed. Sorry for the inconvenience");
	throw new IOException("bad input");
}
// add new login instance
query_string = "insert into login values('"+email+"','"+password+"')";
i = st.executeUpdate(query_string);
if (i > 0){
	out.println("Your login credntials have been saved");
}
else{
	out.println("Failed to store login credentials");
}
}
catch(Exception e){
	e.printStackTrace();
}finally {
	if(st != null){
		try{
			st.close();
		} catch(SQLException e){}
	}
	if(con != null){
		try{
			con.close();
		} catch(SQLException e){}
	}
}
%>
</body>
</html>