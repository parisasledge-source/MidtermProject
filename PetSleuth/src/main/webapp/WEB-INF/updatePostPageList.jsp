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

<%@ include file="bootstrapSetup.jsp" %>
	<c:choose>
	<c:when test="${! empty posts}">
	<table>
	<thead>
	<tr>
	<th>Update</th>
	<th>ID</th>
	<th>Date Posted</th>
	<th>Description</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var = "p" items = "${posts}">
		<c:choose>
			<c:when test="${ p.active }">
			<tr>
			<td><form action="updatePostForm.do"><button name="id" value="${p.id}">Update</button></form></td>
			<td>${p.id}</td>
			<td>${p.postingDate}</td>
			<td>${p.description}</td>
			</tr>
			</c:when>
		</c:choose>
	</c:forEach>
	</tbody>
	</table>
	</c:when>
	<c:otherwise>
	<h2>No posts found to update!</h2>
	</c:otherwise>
	</c:choose>
	
</body>
</html>