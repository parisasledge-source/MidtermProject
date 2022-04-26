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
	<ul>
	<c:forEach var = "p" items = "${pets}">
		<c:choose>
			<c:when test="${ p.active }">
				<li> 
					<a href = "displayPet.do?id=${p.id}"> ${p.id}</a>
				</li>
			</c:when>
		</c:choose>
	</c:forEach>
	</ul>
	
	<br>
	
	<h3>Remove a Pet</h3>
	
	<form action="hidePet.do" method="POST">
	Enter a Pet ID: <input type="text" name="petId" /> 
	<input type="submit" value="Submit" />
	</form>
	

</body>
</html>