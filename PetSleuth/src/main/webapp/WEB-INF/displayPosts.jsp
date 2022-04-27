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
	<ul>
	<c:choose>
	<c:when test="${! empty posts}">
	<c:forEach var = "p" items = "${posts}">
		<c:choose>
			<c:when test="${ p.active }">
			<table>
			<thead>
			<tr>
			<th>ID</th>
			<th>Posting Date</th>
			<th>Description</th>
			<th>Reward</th>			
			</tr>
			</thead>
			<tbody>
			<tr>
			<td><a href = "displayContact.do?id=${p.id}">${p.id}</a></td>
			<td><a href = "displayContact.do?id=${p.id}">${p.postingDate}</a></td>
			<td><a href = "displayContact.do?id=${p.id}">${p.description}</a></td>
			<td><a href = "displayContact.do?id=${p.id}">${p.reward}</a></td>
			</tr>
			</tbody>
			</table>
				<%-- <li> 
					<a href = "displayPost.do?id=${p.id}"> ${p.id}</a>
				</li> --%>
			</c:when>
		</c:choose>
	</c:forEach>
	</c:when>
	<c:otherwise>
	<h2>No posts found!</h2>
	</c:otherwise>
	</c:choose>
	</ul>
	
	
	<br>
	
	<h3>Remove a Post</h3>
	
	<form action="destroyPost.do" method="POST">
	Enter a Post ID: <input type="text" name="postId" /> 
	<input type="submit" value="Submit" />
	</form>
	

</body>
</html>