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
			<input name="submit" type="submit">

	</form>
	<%-- <input name ="userId" type="hidden" value="${user.id}">  --%>

	<c:choose>
		<c:when test="${empty pets}">
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
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${empty contacts}">
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
		</c:otherwise>
	</c:choose>
	<c:choose>
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
									<td>${p.zipcode}</td>
								</tr>
							</c:when>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>