<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact</title>
</head>
<body>

	<h1>Add Contact Information</h1>

	<form action="contact.do" method="POST">

		<label for="contactPreference">Your preferred contact method:</label> 
		<input name="contactPreference" type="text"> 
		<br> 		
		<label for="contactInfo">Contact Information:</label> 		
		<input name="contactInfo" type="text"> 
		<br> 		
		<label for="email">Email address:</label> 
		<input name="email" type="text">
		<br>
		<label for="phoneNumber">Phone number:</label> 
		<input name="phoneNumber" type="text">
		<br>
		<input name ="userId" type="hidden" value="${user.id}"> 
		<br>
		<input name="submit" type="submit">
	</form>

</body>
</html>