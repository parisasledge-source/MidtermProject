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

	<%@ include file="bootstrapSetup.jsp"%>
	<div class="container">

		<!-- <ul class="list-group list-group-flush"> -->

		<c:choose>
			<c:when test="${! empty pet.photos}">
				<ul>
					<c:forEach var="p" items="${pet.photos}">
						<li><img src="${p.photoUrl}"
							style="width: 500px; height: 400px;" /> <br></li>
					</c:forEach>
				</ul>
			</c:when>
		</c:choose>

		<!-- <h1>Pet Profile</h1> -->
		Species: ${pet.species} <br> Name: ${pet.name} <br> Breed:
		${pet.breed} <br> Description: ${pet.description} <br> Chip:
		${pet.chip} <br> Color: ${pet.color} <br> Gender:
		${pet.gender} <br> Neutered: ${pet.neutered} <br> Age:
		${pet.age}
		<!-- <br> Photo: -->
		<%-- <img src="${pet.photos}"> --%>

		<c:choose>
			<c:when test="${! empty pet.photos}">
				<form action="updatePetPhoto.do" method="post">
					<input name="petId" class="btn btn-primary" value="${pet.id}"
						type="hidden"> <label for="photoUrl">Photo URL:</label>

					<c:forEach var="p" items="${pet.photos}">
						<input name="photoUrl" type="text" value="${p.photoUrl}">
						<!-- <br> -->
						<button name="petPhotoId" class="btn btn-primary" value="${p.id}">Update
							Photo</button>
					</c:forEach>

				</form>
			</c:when>
			<c:otherwise>
				<form action="addPetPhoto.do" method="POST">
					<input name="photoUrl" type="text"> <input name="species"
						type="hidden" value="${pet.species}"> <input name="name"
						type="hidden" value="${pet.name}"> <input
						name="description" type="hidden" value="${pet.description}">
					<input name="breed" type="hidden" value="${pet.breed}"> <input
						name="chip" type="hidden" value="${pet.chip}"> <input
						name="color" type="hidden" value="${pet.color}"> <input
						name="gender" type="hidden" value="${pet.gender}"> <input
						name="neutered" type="hidden" value="${pet.neutered}"> <input
						name="age" type="hidden" value="${pet.age}"> <input
						name="petId" type="hidden" value="${pet.id}"> <br>
					<button name="submit" type="submit">Add Photo</button>
				</form>

			</c:otherwise>
		</c:choose>

		<!-- </ul> -->
		<br>

		<form action="updatePetForm.do">
			<button name="id" class="btn btn-primary" type="submit"
				value="${pet.id}">Update Pet</button>

		</form>
		<br>
		<form action="hidePet.do">
			<button name="petId" class="btn btn-primary" type="submit"
				value="${pet.id}">Remove Pet</button>
		</form>

	</div>
</body>
</html>