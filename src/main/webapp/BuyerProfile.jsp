<%@page import="krushimart.ProductCRUD"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="FarmerProfile.css">
<title>My Profile</title>
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

		<div class="main-div">

        <div class="img-div">

        </div>

        <div class="profile-div">
            <h1> My Profile </h1>
            <p> <span> Name: </span> <%=resultSet.getString("firstName")+ " " +resultSet.getString("lastName")%> </p>
            <p> <span> Email: </span> <%=resultSet.getString("email") %> </p>
            <p> <span> Mobile Number: </span> <%=resultSet.getLong("phone_no") %> </p>
            <p> <span> Place: </span> <%=resultSet.getString("address") %> </p>
        </div>
	<%} %>
	</div>
	
	 <div class="btn-div">
        <div class="btn-style-div">
            <button type="button" class="btn"> <a href="EditProfile.jsp"> Edit Profile </a> </button>
		</div>
	</div>

</body>
</html>