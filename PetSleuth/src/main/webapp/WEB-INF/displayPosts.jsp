<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Posts</title>
</head>
<body>

	<%@ include file="bootstrapSetup.jsp"%>
	<c:choose>
		<c:when test="${! empty posts}">
			<table class="table">
				<thead>
					<tr>
						<th></th>
						<th scope="col">ID</th>
						<th scope="col">Posting Date</th>
						<th scope="col">Description</th>
						<th scope="col">Reward</th>

					</tr>
				</thead>
				<c:forEach var="p" items="${posts}">
					<c:choose>
						<c:when test="${ p.active }">
							<tbody>
								<tr>
									<td><form action="displayPost.do">
											<button type="submit" class="btn btn-primary" name="id"
												value="${p.id}">View</button>
										</form></td>
									<td>${p.id}</td>
									<td>${p.postingDate}</td>
									<td>${p.description}</td>
									<td>${p.reward}</td>
								</tr>
							</tbody>
						</c:when>
					</c:choose>
				</c:forEach>
			</table>
			<br>


			<h3>Remove a Post</h3>

			<form action="destroyPost.do" method="POST">
				Enter a Post ID: <input type="text" name="postId" /> <input
					type="submit" class="btn btn-primary" value="Submit" />
			</form>
		</c:when>
		<c:otherwise>
			<h3>No posts found!</h3>
			<a href="postPage.do">Add A Post Here</a>
		</c:otherwise>
	</c:choose>
</body>
</html>

</body>
</html>