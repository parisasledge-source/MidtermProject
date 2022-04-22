<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User Sign Up</title>
</head>
<body>

<h1>Sign Up</h1>

<form action="signup.do" method="POST">

<label for="username">Create a username:</label>
<input name="username" type="text">
<br>
<label for="password">Create a password:</label>
<input name="password" type="text">
<br>
<label for="email">Enter a valid email address:</label>
<input name="email" type="text">
<br>
<input name="submit" type="submit">

</form>

</body>
</html>