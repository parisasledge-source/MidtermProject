<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Contact</title>
</head>
<body>

<%@ include file="bootstrapSetup.jsp" %>

	<ul>
		<li>${contact.contactPreference}</li>
		<li>${contact.contactInfo}</li>
		<li>${contact.email}</li>
		<li>${contact.phoneNumber}</li>
	</ul>
	
	<br>
	
	<h3>Update your Contact Information</h3>
	<form action="updateContact.do" method="POST">

		<label for="contactPreference">Preferred contact method:</label> 
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
	
		<h3>Add Separate Contact Information</h3>

	<form action="addContact.do" method="POST">

		<label for="contactPreference">Preferred contact method:</label> 
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