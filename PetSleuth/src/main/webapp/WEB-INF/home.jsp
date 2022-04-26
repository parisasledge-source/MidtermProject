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
	<a href="displayLocations.do">See my location</a>
	
	<br>
	<a href="contactPage.do"> Add a contact</a>
	<a href="displayContacts.do"> Display contacts</a>
	<a href="updateContact.do"> Update a contact</a>
	<a href="destroyContact.do"> Remove a contact</a>
	
	<h3>Search</h3>

	<form action="search.do" method="post">
		<input type="text" name="word" placeholder="Enter search here"/> <input type="submit" name="submit" />
	</form>

</body>
</html>