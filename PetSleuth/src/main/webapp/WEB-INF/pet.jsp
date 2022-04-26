<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet</title>
</head>
<body>

	<h1>Add a Pet</h1>

	<form action="pet.do" method="POST">

		<label for="species">Enter the species:</label> 
		<input name="species" type="text"> <br> 
		
		<label for="name">Enter the name:</label> 
		<input name="name" type="text"> <br> 
		
		<label for="breed">Enter the breed:</label> 
		<input name="breed" type="text"> <br> 
				
		<label for="description">Enter the description:</label> 		
		<input name="description" type="text"> <br> 
				
		<label for="chip">Is pet chipped (true/false):</label> 
		<input name="chip" type="text"><br>
		
		<label for="color">Enter the color:</label> 
		<input name="color" type="text"> <br> 
		
		<label for="gender">Enter the gender:</label> 
		<input name="gender" type="text"> <br> 
		
		<label for="neutered">Is pet neutered (true/false):</label> 
		<input name="neutered" type="text"> <br> 
				
		<label for="age">Enter the age:</label> 		
		<input name="age" type="text"> <br> 	
		<br>
		
		<input name ="userId" type="hidden" value="${user.id}"> 
		
<%-- 		<h1> Here is all your pets:</h1>
		<ul>
			<c:forEach var="p" items="${pets}">
			
				<li>
				${p.id} 
				
				</li>
			
			</c:forEach>
		
		</ul>
		 --%>

		<input name="submit" type="submit">

	</form>

</body>
</html>