<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Pet</title>
</head>
<body>
<%@ include file="bootstrapSetup.jsp" %>

	<h3>Update Pet Information</h3>
	<form action="updatePet.do" method="POST">

		<label for="species">Enter the species:</label> 
		<input name="species" type="text" value="${pet.species}"> <br> 
		
		<label for="name">Enter the name:</label> 
		<input name="name" type="text" value="${pet.name}"> <br> 
		
		<label for="breed">Enter the breed:</label> 
		<input name="breed" type="text" value="${pet.breed}"> <br> 
				
		<label for="description">Enter the description:</label> 		
		<input name="description" type="text" value="${pet.description}"> <br> 
				
		<label for="chip">Is pet chipped (true/false):</label> 
		<input name="chip" type="text" value="${pet.chip}"><br>
		
		<label for="color">Enter the color:</label> 
		<input name="color" type="text" value="${pet.color}"> <br> 
		
		<label for="gender">Enter the gender:</label> 
		<input name="gender" type="text" value="${pet.gender}"> <br> 
		
		<label for="neutered">Is pet neutered (true/false):</label> 
		<input name="neutered" type="text" value="${pet.neutered}"> <br> 
				
		<label for="age">Enter the age:</label> 		
		<input name="age" type="text" value="${pet.age}"> <br> 	
		
		<%-- <label for="photos">Enter the URL:</label> 
		<c:choose>
		<c:when test="${! empty pet.photos}">
		<input name="photos" type="text" value="${pet.photos.get(0).photoUrl}"> <br>
		</c:when>
		<c:otherwise>
		<input name="photos" type="text"> <br>
		</c:otherwise>
		</c:choose> --%>
		 	
		
		<br>
		<input name="petId" type="hidden" value="${pet.id}">
		
		<%-- <input name ="userId" type="hidden" value="${user.id}">  --%>
		
		
		<input name="submit" type="submit">

	</form>
</body>
</html>