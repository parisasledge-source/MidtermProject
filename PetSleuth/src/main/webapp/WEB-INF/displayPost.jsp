<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Post</title>
</head>
<body>

	<ul>
		<li>${post.postingDate}</li>
		<li>${post.lastSeen}</li>
		<li>${post.description}</li>
		<li>${post.reward}</li>
	</ul>

	<form action="displayPostComment.do" method="POST">
		<input name="postId" type="hidden" value="${post.id}"> <input
			name="userId" type="hidden" value="${user.id}"> <input
			name="inReplyToCommentId" type="hidden" value="0"> <input
			name="content" type="text" placeholder="Enter comment here">
		<input name="submit" type="submit">
	</form>
	<br>

	<ul>
		<li><c:forEach var="c" items="${post.postComments}">
				<c:choose>
					<c:when test="${empty c.inReplyToCommentId}">
						<ul>
							<li>Comment Poster: ${c.user.username}</li>
							<li>Comment Posted: ${c.commentDate}</li>
							<li>Content: ${c.content}</li>
							<c:forEach var="r" items="${c.replies}">
					Reply:
					<ul>
									<li>Comment Poster: ${r.user.username}</li>
									<li>Comment Posted: ${r.commentDate}</li>
									<li>Content: ${r.content}</li>
								</ul>
							</c:forEach>
							<li>
								<form action="displayPostComment.do" method="POST">
									<input name="postId" type="hidden" value="${post.id}">
									<input name="userId" type="hidden" value="${user.id}">
									<input name="inReplyToCommentId" type="hidden" value="${c.id}">
									<input name="content" type="text"
										placeholder="Enter comment here"> <input name="submit"
										type="submit">
								</form>
							</li>
						</ul>
					</c:when>
				</c:choose>
			</c:forEach></li>
	</ul>

	<br>
	<h3>Update a Post</h3>
	<form action="updatePost.do" method="POST">

		<label for="last">Enter the date last seen:</label> <input name="last"
			type="date"> <br> <label for="description">Write
			a description:</label> <input name="description" type="text"> <br>
		<label for="reward">How much would you like to offer:</label> <input
			name="reward" type="text"> <label for="petId">Enter
			Pet ID:</label> <input name="petId" type="text"> <label
			for="contactId">Enter Contact ID:</label> <input name="contactId"
			type="text"> <label for="locationId">Enter Location
			ID:</label> <input name="locationId" type="text"> <br> <input
			name="postId" type="hidden" value="${post.id}">

	</form>
	<%-- <input name ="userId" type="hidden" value="${user.id}">  --%>
	<c:choose>
		<c:when test="${empty pets}">
			<h3>You don't have any pets saved to your profile! Add one here!</h3>
			<form action="pet.do" method="POST">

				<label for="species">Enter the species:</label> <input
					name="species" type="text"> <br> <label for="name">Enter
					the name:</label> <input name="name" type="text"> <br> <label
					for="breed">Enter the breed:</label> <input name="breed"
					type="text"> <br> <label for="description">Enter
					the description:</label> <input name="description" type="text"> <br>

				<label for="chip">Is pet chipped (true/false):</label> <input
					name="chip" type="text"><br> <label for="color">Enter
					the color:</label> <input name="color" type="text"> <br> <label
					for="gender">Enter the gender:</label> <input name="gender"
					type="text"> <br> <label for="neutered">Is pet
					neutered (true/false):</label> <input name="neutered" type="text">
				<br> <label for="age">Enter the age:</label> <input name="age"
					type="text"> <br> <br> <input name="userId"
					type="hidden" value="${user.id}"> <input name="submit"
					type="submit">

			</form>
		</c:when>
		<c:otherwise>
			<h3>Is this post for any of these pets?</h3>
			<table>
				<thead>
					<tr>
						<td>Select</td>
						<td>ID</td>
						<td>Name</td>
						<td>Breed</td>
						<td>Color</td>
						<td>Description</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${pets}">
						<c:choose>
							<c:when test="${p.active}">
								<tr>
									<td><button>Select</button></td>
									<td>${p.id}</td>
									<td>${p.name}</td>
									<td>${p.breed}</td>
									<td>${p.color}</td>
									<td>${p.description}</td>
								</tr>
							</c:when>
						</c:choose>

					</c:forEach>
				</tbody>
			</table>

			<h3>If you don't see your pet, add one here!</h3>

			<form action="pet.do" method="POST">

				<label for="species">Enter the species:</label> <input
					name="species" type="text"> <br> <label for="name">Enter
					the name:</label> <input name="name" type="text"> <br> <label
					for="breed">Enter the breed:</label> <input name="breed"
					type="text"> <br> <label for="description">Enter
					the description:</label> <input name="description" type="text"> <br>
				<label for="chip">Is pet chipped (true/false):</label> <input
					name="chip" type="text"><br> <label for="color">Enter
					the color:</label> <input name="color" type="text"> <br> <label
					for="gender">Enter the gender:</label> <input name="gender"
					type="text"> <br> <label for="neutered">Is pet
					neutered (true/false):</label> <input name="neutered" type="text">
				<br> <label for="age">Enter the age:</label> <input name="age"
					type="text"> <br> <br> <input name="userId"
					type="hidden" value="${user.id}"> <input name="submit"
					type="submit">

			</form>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${empty contacts}">
			<h3>You don't have a contact method saved to your profile. Add
				one here!</h3>
			<form action="addContact.do" method="POST">

				<label for="contactPreference">Preferred contact method:</label> <input
					name="contactPreference" type="text"> <br> <label
					for="contactInfo">Contact Information:</label> <input
					name="contactInfo" type="text"> <br> <label
					for="email">Email address:</label> <input name="email" type="text">
				<br> <label for="phoneNumber">Phone number:</label> <input
					name="phoneNumber" type="text"> <br> <input
					name="userId" type="hidden" value="${user.id}"> <br> <input
					name="submit" type="submit">
			</form>
		</c:when>
		<c:otherwise>
			<h3>Preferred contact method</h3>
			<table>
				<thead>
					<tr>
						<td>Select</td>
						<td>ID</td>
						<td>Contact Preference</td>
						<td>Email</td>
						<td>Phone number</td>
						<td>Information</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${contacts}">
						<c:choose>
							<c:when test="${p.active}">
								<tr>
									<td><button>Select</button></td>
									<td>${p.id}</td>
									<td>${p.contactPreference}</td>
									<td>${p.email}</td>
									<td>${p.phoneNumber}</td>
									<td>${p.contactInfo}</td>
								</tr>
							</c:when>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>

			<h3>If you don't see the necessary contact information, add one
				here!</h3>

			<form action="addContact.do" method="POST">

				<label for="contactPreference">Preferred contact method:</label> <input
					name="contactPreference" type="text"> <br> <label
					for="contactInfo">Contact Information:</label> <input
					name="contactInfo" type="text"> <br> <label
					for="email">Email address:</label> <input name="email" type="text">
				<br> <label for="phoneNumber">Phone number:</label> <input
					name="phoneNumber" type="text"> <br> <input
					name="userId" type="hidden" value="${user.id}"> <br> <input
					name="submit" type="submit">
			</form>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${empty locations}">
			<h3>You don't have a location saved to your profile. Add one
				here!</h3>
			<form action="createLocation.do" method="POST">

				State: <input type="text" name="state" /> <br> City: <input
					type="text" name="city" /> <br> Street: <input type="text"
					name="street" /> <br> Zip code: <input type="text"
					name="zipcode" /> <br> <input type="submit" value="Submit" />
			</form>

		</c:when>
		<c:otherwise>
			<h3>Would you like to use the location in your profile?</h3>
			<table>
				<thead>
					<tr>
						<td>Select</td>
						<td>ID</td>
						<td>Street</td>
						<td>City</td>
						<td>State</td>
						<td>Zip Code</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${locations}">
						<c:choose>
							<c:when test="${p.active}">
								<tr>
									<td><button>Select</button></td>
									<td>${p.id}</td>
									<td>${p.street}</td>
									<td>${p.city}</td>
									<td>${p.state}</td>
									<td>${p.zipCode}</td>
								</tr>
							</c:when>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>

			<h3>Add a different location</h3>

			<form action="createLocation.do" method="POST">

				State: <input type="text" name="state" /> <br> City: <input
					type="text" name="city" /> <br> Street: <input type="text"
					name="street" /> <br> Zip code: <input type="text"
					name="zipcode" /> <br> <input type="submit" value="Submit" />
			</form>
		</c:otherwise>
	</c:choose>

</body>
</html>