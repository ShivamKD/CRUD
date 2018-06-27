<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
<head>
	<title>Search</title>
</head>
<body>
<a href="index.html">Home</a>
<br>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Student","root","Shivam4015");
		String s = request.getParameter("roll");

		String query = "select * from data where roll = ?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1,s);
		try{
			ResultSet rs = ps.executeQuery();
			rs.next();
			out.println("<strong>Found</strong><br>Name : " + rs.getString(1) + "<br> Department : " + rs.getString(2) + "<br> Roll :" + rs.getString(3) );
			
			rs.close();

			
		}
		catch(Exception e){
			%>
			<p>Unavailable Search</p>
			<%
		}
		ps.close();
	con.close();


	}
	catch(Exception e){}
	
%>	
<br>


</body>
</html>