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
String pass = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver"); 
Connection con = null;
ResultSet rs = null;
Statement st = null;
//connect to the db
try{
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoteldb?useSSL=false","root","password"); 
	st= con.createStatement(); 
	// print Query or update statement into a string
	String query_string = "SELECT * FROM login WHERE username = '"+username+"' AND pass = '"+pass+"'";
	//call query on string, find if username exits in db
	rs =st.executeQuery(query_string); 
	// need to call next to start the ptr at first result
	// check if result set is empty set
	if(!rs.next()){
		throw new SQLException ("Empty set no results");
	}
	if (rs.getString(1).equals(username) && rs.getString(2).equals(pass)){
		out.println("Login success!");
	}
}catch(Exception e){
	e.printStackTrace();
	out.println("Failed to login!");
}finally {
	if(rs != null){
		try{
			rs.close();
		}catch(SQLException e){}
	}
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