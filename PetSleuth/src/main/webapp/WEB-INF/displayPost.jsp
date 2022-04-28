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
	<%@ include file="bootstrapSetup.jsp"%>
	<div class="card" style="width: 50rem;">
		<div class="card-body">
			<h5 class="card-title">${user.username}'s post</h5>
			<h6 class="card-subtitle mb-2 text-muted">Missing Pet</h6>
			<ul>
				<li>Date Posted: ${post.postingDate}</li>
				<li>Date Last Seen: ${post.lastSeen}</li>
				<li>Pet Description: ${post.description}</li>
				<li>Reward: ${post.reward}</li>
			</ul>
			<p class="card-text">Missing Pet Information:</p>

			<ul>
				<li><a href="displayPet.do?id=${post.pet.id}">Pet Profile</a></li>
				<li>Pet Name: ${post.pet.name}</li>
				<li>Species: ${post.pet.species}</li>
				<li>Breed: ${post.pet.breed}</li>
				<li>Description: ${post.pet.description}</li>
				<li>Chipped: ${post.pet.chip}</li>
				<li>Color: ${post.pet.color}</li>
				<li>Gender: ${post.pet.gender}</li>
				<li>Neutered: ${post.pet.neutered}</li>
				<li>Age: ${post.pet.age}</li>
			</ul>

			<p class="card-text">Owner Contact Information:</p>

			<ul>
				<li>Phone Number: ${post.contact.phoneNumber}</li>
				<li>Email: ${post.contact.email}</li>
				<li>Contact Preference: ${post.contact.contactPreference}</li>
				<li>More Information: ${post.contact.contactInfo}</li>
			</ul>

			<p class="card-text">Location Information:</p>

			<ul>
				<li>Street: ${post.location.street}</li>
				<li>City: ${post.location.city}</li>
				<li>State: ${post.location.state}</li>
				<li>Zip Code: ${post.location.zipcode}</li>
			</ul>

		</div>
	</div>




	<form action="displayPostComment.do" method="POST">
		<input name="id" type="hidden" value="${post.id}"> <input
			name="userId" type="hidden" value="${user.id}"> <input
			name="inReplyToCommentId" type="hidden" value="0"> <input
			name="content" type="text" placeholder="Enter comment here">
		<input name="submit" type="submit">
	</form>
	<br>

	<ul style="list-style: none;">
		<li><c:forEach var="c" items="${postcomments}">
				<c:choose>
					<c:when test="${empty c.inReplyToCommentId}">

						<div class="card" style="width: 20rem;">
							<div class="card-body">
								<h5 class="card-title">${c.user.username}'s comment</h5>
								<h6 class="card-subtitle mb-2 text-muted">${c.commentDate}</h6>
								<p class="card-text">${c.content}</p>
							</div>
						</div>

						<ul style="list-style: none;">
							<c:forEach var="r" items="${c.replies}">
								<li>
									<div class="card" style="width: 20rem;">
										<div class="card-body">
											<h5 class="card-title">${r.user.username}'s comment</h5>
											<h6 class="card-subtitle mb-2 text-muted">${r.commentDate}</h6>
											<p class="card-text">${r.content}</p>
										</div>
									</div>
								</li>
								<li>
								<form action="displayPostComment.do" method="POST">
									<input name="id" type="hidden" value="${post.id}"> <input
										name="userId" type="hidden" value="${user.id}"> <input
										name="inReplyToCommentId" type="hidden" value="${c.id}">
									<input name="content" type="text"
										placeholder="Enter reply here"> <input name="submit"
										type="submit">
								</form>
								<br>
							</li>
							</c:forEach>
							</ul>
							<br>
					</c:when>
				</c:choose>
			</c:forEach><br></li>
	</ul>
	<br>
	<form action="updatePostForm.do">
		<button name="id" value="${post.id}">Update Post</button>

	</form>

	<form action="destroyPost.do">
		<button name="postId" value="${post.id}">Remove Post</button>
	</form>

	<%-- <input name ="userId" type="hidden" value="${user.id}">  --%>
</body>
</html>