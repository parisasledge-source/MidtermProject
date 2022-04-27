<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display User Info</title>
</head>
<body>

<%@ include file="bootstrapSetup.jsp" %>

	<ul>
		<li>Username: ${user.username}</li>
		<li>UserId: ${user.id}</li>
		<li>First Name: ${user.firstName}</li>
		<li>Last Name: ${user.lastName}</li>
		<li>Bio: ${user.biography}</li>
		<li> <img src="${user.photoURL}"></li>
	</ul>
	
	<br>
	
	<h3>Update your information</h3>
	
	<form action="updateUser.do" method="post">
		<label for="firstName">First Name:</label> 
		<input name="firstName" type="text" value="${user.firstName}"> 
		<br> 
		<label for="lastName">Last Name:</label> 
		<input name="lastName" type="text" value="${user.lastName}"> 
		<br> 
		<label for="biography">Biography:</label> 
		<input name="biography" type="text" value="${user.biography}"> 
		<br> 
		<label for="photoURL">Add a Photo URL:</label> 
		<input name="photoURL" type="text" value="${user.photoURL}"> 
		<br> 
		<input name="submit" type="submit">
	</form>
	
</body>
</html>