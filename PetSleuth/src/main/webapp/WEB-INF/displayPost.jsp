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
</body>
</html>