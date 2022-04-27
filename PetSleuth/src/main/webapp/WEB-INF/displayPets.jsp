<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Pets</title>
</head>
<body>

<%@ include file="bootstrapSetup.jsp" %>
	<ul>
	<c:choose>
	<c:when test="${! empty pets}">
	<c:forEach var = "p" items = "${pets}">
		<c:choose>
			<c:when test="${ p.active }">
			<table>
			<thead>
			<tr>
			<th>ID</th>
			<th>Species</th>
			<th>Breed</th>
			<th>Name</th>			
			</tr>
			</thead>
			<tbody>
			<tr>
			<td><a href = "displayContact.do?id=${p.id}">${p.id}</a></td>
			<td><a href = "displayContact.do?id=${p.id}">${p.species}</a></td>
			<td><a href = "displayContact.do?id=${p.id}">${p.breed}</a></td>
			<td><a href = "displayContact.do?id=${p.id}">${p.name}</a></td>
			</tr>
			</tbody>
			</table>
				<%-- <li> 
					<a href = "displayPet.do?id=${p.id}"> ${p.id}</a>
				</li> --%>
			</c:when>
		</c:choose>
	</c:forEach>
	</c:when>
	<c:otherwise>
	<h2>No pet profile found!</h2>
	</c:otherwise>
	</c:choose>
	</ul>
	
</body>
</html>