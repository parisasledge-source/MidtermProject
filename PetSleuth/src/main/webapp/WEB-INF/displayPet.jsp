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

	<h1>Pet Profile</h1>
	Species: ${pet.species}
	<br>
	Name: ${pet.name}
	<br>
	Breed: ${pet.breed}
	<br>
	Description: ${pet.description}
	<br>
	Chip: ${pet.chip}
	<br>
	Color: ${pet.color}
	<br>
	Gender: ${pet.gender}
	<br>
	Neutered: ${pet.neutered}
	<br>
	Age: ${pet.age}
	<br>
	Photo: 
	<%-- <img src="${pet.photos}"> --%>
	<c:choose>
	<c:when test="${! empty pet.photos}">
	<ul>
	<c:forEach var="p" items="${pet.photos}">
	<li><img src = "${p.photoUrl}" style="width:500px;height:400px;"/>
	<br></li>
	</c:forEach>
	</ul>
	</c:when>
	</c:choose>
	
	
	<form action="updatePetForm.do">
	<button name="id" value="${pet.id}">Update Pet</button>

	</form>
	
	<form action="hidePet.do">
	<button name="petId" value="${pet.id}">Remove Pet</button>
	</form>
	
	
</body>
</html>