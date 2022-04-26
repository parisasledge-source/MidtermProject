<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Contacts</title>
</head>
<body>
	<ul>
	<c:choose>
	<c:when test="${! empty contacts}">
	<c:forEach var = "p" items = "${contacts}">
		<c:choose>
			<c:when test="${ p.active }">
				<li> 
					<a href = "displayContact.do?id=${p.id}"> ${p.id}</a>
				</li>
			</c:when>
		</c:choose>
	</c:forEach>
	</c:when>
	<c:otherwise>
	<h2>No contact information found!</h2>
	</c:otherwise>
	</c:choose>
	</ul>
	
	
	<br>
	
	<h3>Remove a Contact</h3>
	
	<form action="destroyContact.do" method="POST">
	Enter a Contact ID: <input type="text" name="contactId" /> 
	<input type="submit" value="Submit" />
	</form>
	

</body>
</html>