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
			<table>
				<thead>
					<tr>
						<th>View</th>
						<th>ID</th>
						<th>Posting Date</th>
						<th>Description</th>
						<th>Reward</th>
					</tr>
				</thead>
				<c:forEach var="p" items="${posts}">
					<c:choose>
						<c:when test="${ p.active }">
							<tbody>
								<tr>
									<td><form action="displayPost.do">
											<button name="id" value="${p.id}">View</button>
										</form></td>
									<td>${p.id}</td>
									<td>${p.postingDate}</td>
									<td>${p.description}</td>
									<td>${p.reward}</td>
								</tr>
							</tbody>
						</c:when>
						<c:otherwise>
							<h2>No posts found!</h2>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</table>
		</c:when>
			<c:otherwise>
				<h2>No posts found!</h2>
			</c:otherwise>
	</c:choose>

</body>
</html>