<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Sleuth</title>
</head>
<body>
	<input name ="user" type="hidden" value="${user}">
	<a href="signupPage.do">Sign up</a>
	<a href="loginPage.do">Login</a>
	<a href="postPage.do">Post</a>
	<a href="displayPosts.do">See my Posts</a>
	
	<br>
	
	<h3>Search</h3>

	<form action="search.do" method="post">
		<input type="text" name="word" placeholder="Enter search here"/> <input type="submit" name="submit" />
	</form>

</body>
</html>