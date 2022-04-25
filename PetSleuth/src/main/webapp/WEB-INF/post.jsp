<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post</title>
</head>
<body>

	<h1>Add a Post</h1>

	<form action="post.do" method="POST">

		<label for="last">Enter the date last seen:</label> 
		<input name="last" type="date"> <br> 		
		<label for="description">Write a description:</label> 		
		<input name="description" type="text"> <br> 		
		<label for="reward">How much would you like to offer:</label> <input name="reward" type="text">
			
		<label for="petId">Enter Pet ID:</label> <input name="petId" type="text">
		<label for="contactId">Enter Contact ID:</label> <input name="contactId" type="text">
		<label for="locationId">Enter Location ID:</label> <input name="locationId" type="text">
		<br>
		
		<input name ="userId" type="hidden" value="1"> 
		
		<h1> Here is all your pets:</h1>
		<ul>
			<c:forEach var="p" items="${pet}">
			
				<li>
				${p.id} 
				
				</li>
			
			</c:forEach>
		
		</ul>
		
		<h1> Here is all your contact options:</h1>
		<ul>
			<c:forEach var="c" items="${contact}">
			
				<li>
				${c.id} 
				
				</li>
			
			</c:forEach>
		
		</ul>
		
		<h1> Here is all your location options:</h1>
		<ul>
			<c:forEach var="l" items="${location}">
			
				<li>
				${l.id} 
				
				</li>
			
			</c:forEach>
		
		</ul>

		<input name="submit" type="submit">

	</form>

</body>
</html>