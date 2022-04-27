<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

<%@ include file="bootstrapSetup.jsp" %>

<h1>Login</h1>

<form action="login.do" method="POST">

<label for="username">Enter username:</label>
<input name="username" type="text">
<br>
<label for="password">Enter password:</label>
<input name="password" type="text">
<br>
<input name="submit" type="submit">

</form>

<!-- <img src="https://media.istockphoto.com/photos/large-group-of-different-animals-picture-id1137961063?b=1&k=20&m=1137961063&s=612x612&w=0&h=YKKTWcMDNLyRr3-gAzCxN5GBvLl4ji3nd8I3nSABriM="></a>
 -->
</body>
</html>