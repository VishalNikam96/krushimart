<%@page import="krushimart.ProductCRUD"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Profile</title>
<link rel="stylesheet" href="Profile.css">
</head>
<body>

	<%
		Connection connection = ProductCRUD.getConnection() ;
		PreparedStatement preparedStatement = connection.prepareStatement("select * from user where email=? and password=?") ;
		preparedStatement.setString(1,(String) session.getAttribute("email")) ;
		preparedStatement.setString(2, (String) session.getAttribute("password")) ;
		
		ResultSet resultSet = preparedStatement.executeQuery() ;
		
		while(resultSet.next()){
			
		
	%>

	<div>
		<h1>My Profile</h1>
		<p>Name: <%=resultSet.getString("firstName")+ " " +resultSet.getString("lastName")%> </p>
		<p>Email: <%=resultSet.getString("email") %> </p>
		<p>Phone Number: <%=resultSet.getLong("phone_no") %> </p>
		<p>Place: <%=resultSet.getString("address") %> </p>
		
	</div>
	
	<%} %>
	<a href="EditProfile.jsp"><input type="button" value="Edit Profile"></a>
	<a href="ChangePassword.html"><button>Change Password</button></a> <br><br>
	<a href="AddPost.html"><button>Add Post</button></a>
	<a href=""><button>Delete Post</button></a>
	
	<% connection.close() ; %>

</body>
</html>