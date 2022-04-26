<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Sleuth</title>
</head>
<body>
	${DEBUG}
	<input name ="user" type="hidden" value="${user}">
	<a href="signupPage.do">Sign up</a>
	<a href="loginPage.do">Login</a>
	<a href="postPage.do">Post</a>
	<a href="displayPosts.do">See my Posts</a>
	<a href="displayLocations.do">See my location</a>

</body>
</html>