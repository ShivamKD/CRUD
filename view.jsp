<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>



<!DOCTYPE html>
<html>
<head>
	<title>View</title>
	<style type="text/css">
		table, th, tr,td{
			border : 1px solid black;
			padding: 5px;
		}
		body {
			background-color: grey;

		}
		.container{
			width: 80%;
			align-content: horizontal;
			text-align: center;
			font-size: 36px;
			background-color: #777;
			text-orientation: horizontal;
			position: relative;
			margin: 0 auto;
		}
	</style>
</head>
<body>

<a href="index.html">Home</a>
<br>
<div class="container">
	<h1 >Students Details</h1>
	<table >
		<tr >
			<th >Name</th>
			<th >Department</th>
			<th >Roll</th>
		</tr>

		<%

			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Student","root","Shivam4015");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from data");
				while(rs.next()){
					out.println("<tr><td>" + rs.getString("name") + "</td><td>" + rs.getString("department") + "</td><td>" + rs.getString("roll") + "</td></tr>");
				}
			}
			catch(Exception e){}
		%>
	</table>
</div>
</body>
</html>