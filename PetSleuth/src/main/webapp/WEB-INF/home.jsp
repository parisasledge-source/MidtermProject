<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Sleuth</title>
</head>
<body>


	<%@ include file="bootstrapSetup.jsp" %>

	<input name ="user" type="hidden" value="${user}">
	<a href="signupPage.do">Sign up</a>
	<a href="loginPage.do">Login</a>
	<a href="postPage.do">Post</a>
	<a href="displayPosts.do">See my Posts</a>
	<a href="displayPets.do">See my Pets</a>
	<a href="petPage.do">Add a Pet</a>
	<a href="displayLocations.do">See my location</a>
	<a href="displayUserInfo.do">Update your information</a>

	<br>
	<a href="contactPage.do"> Add a contact</a>
	<a href="displayContacts.do"> Display contacts</a>
	<br>
	
	
	<h3>Search</h3>

	<form action="search.do" method="post">
		<input type="text" name="word" placeholder="Enter search here"/> <input type="submit" name="submit" />
	</form>


	<img src="https://media.istockphoto.com/photos/group-of-pets-posing-around-a-border-collie-dog-cat-ferret-rabbit-picture-id1296353202?b=1&k=20&m=1296353202&s=612x612&w=0&h=Yf_e0loghlTNINRs2ZDH9L-JF8JUz4_tldVyzgNa17g="></a>

</body>
</html>