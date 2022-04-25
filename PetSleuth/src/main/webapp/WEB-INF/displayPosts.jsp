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
	<ul>
	<c:forEach var = "p" items = "${posts}">
	<li> 
	<a href = "displayPost.do?id=${p.id}">
	${p.id}
	</a>
	
	</li>
	
	</c:forEach>
	</ul>
	
	<br>
			<h3>Remove a Post</h3>
		<form action="destroyPost.do" method="POST">
			Enter a Post ID: <input type="text" name="postId" /> <input
				type="submit" value="Submit" />
		</form>
	

</body>
</html>