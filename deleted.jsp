<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
<head>
	<title>Delete</title>
	<style type="text/css">
		body{
			align-content: center;
			background-color: #777;
		}
	</style>
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
			out.println("<strong>Details of Deleted : </strong><br>Name : " + rs.getString(1) + "<br> Department : " + rs.getString(2) + "<br> Roll :" + rs.getString(3) );
			query = "delete from data where roll = ?";
			ps = con.prepareStatement(query);
			ps.setString(1,s);

			ps.execute();
			out.println("<br> Deleted!!!");
			
			rs.close();
		}
		catch(Exception e){
			out.println("Unavailable Search.");
		}
		ps.close();
		con.close();
	}
	catch(Exception e){}

%>
</body>
</html>