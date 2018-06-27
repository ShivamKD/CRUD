<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
<head>
	<title>Created</title>
	<style type="text/css">
		body{
			align-content: center;
			background-color: #777;
		}
	</style>
</head>
<body>

<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Student","root","Shivam4015");
		String name = request.getParameter("name");;
		String department = request.getParameter("department");
		String roll = request.getParameter("roll");
		String query = "insert into data values(?,?,?)";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1,name);
		ps.setString(2,department);
		ps.setString(3,roll);
		ps.executeUpdate();
		out.println("Succesfully Inserted");
		ps.close();
		con.close();

	}
	catch(Exception e){
	out.println(e);
}
	
	//Statement st = 
%>
<br>
<a href="index.html">HOME</a>
</html>