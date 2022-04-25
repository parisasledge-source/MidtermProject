<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</body>
</html>