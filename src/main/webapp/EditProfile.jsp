<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="krushimart.ProductCRUD"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<form action="update" method="post">
	<div width="50%">
		<h1>My Profile</h1>
		FirstName: <input type="text" name="firstname" value="<%=resultSet.getString("firstName")%>"><br><br>
		LastName :<input type="text" name="lastname" value="<%=resultSet.getString("lastName")%>"><br><br>
		Email: <input type="text" name="email" value="<%=resultSet.getString("email") %>"><br><br>
		Phone No: <input type="number" name="phone_no" value="<%=resultSet.getString("phone_no") %>"><br><br>
		Address: <input type="text" name="address" value="<%=resultSet.getString("address") %>"><br><br>
		<input type="submit" value="Update">  
    
	</div>
	</form>
	
		
	
	
    <%} %>
  
	<% connection.close() ; %>

</body>
</html>