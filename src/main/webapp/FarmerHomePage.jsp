<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="krushimart.ProductCRUD"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Farmer Home Page</title>
<link rel="stylesheet" href="FarmerHomePage.css">
</head>
<body>
		<div class="navDiv">
			<ul>
				<li> <img class="img" alt="error" src="logoimg.jpg"> </li>
				<li> <a href="FarmerHomePage.jsp"> Home </a>  </li>
				<li> <a href="AddPost.html"> Post </a>  </li>
				<li> <a href="FarmerProfile.jsp"> Profile </a>  </li>
				<li> <a href="About.html"> About </a>  </li>
				<li> <a href="Contact.html"> Contact </a>  </li>
			</ul>
		</div>
		
		<%
			Connection connection = ProductCRUD.getConnection() ;
			PreparedStatement preparedStatement = connection.prepareStatement("select * from product") ;
			ResultSet resultSet = preparedStatement.executeQuery() ;
			
				while(resultSet.next())
				{
			%>
					<div class="t-div">
					
					<p> Name: <%=resultSet.getString(1) %> </p> 
					<p> Quantity: <%=resultSet.getInt(2)%> </p> 
					<p> Price: <%=resultSet.getDouble(3)%> </p> 
					<p> Description: <%=resultSet.getString(4) %> </p>
					</div>
			<% 	} %>
			
			
</body>
</html>