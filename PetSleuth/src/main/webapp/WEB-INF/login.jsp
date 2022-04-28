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

<form action="login.do" method="POST">
  <!-- Email input -->
  <div class="row mb-4">
  <div class="form-outline mb-4">
    <label class="form-label" for="form2Example1">Username</label>
    <input type="text" id="form2Example1" class="form-control" name="username" />
  </div>

  <!-- Password input -->
  <div class="form-outline mb-4">
    <label class="form-label" for="form2Example2">Password</label>
    <input type="password" id="form2Example2" class="form-control" name="password"/>
  </div>


  <!-- Submit button -->
  <button type="submit" class="btn btn-primary btn-block mb-4">Log in</button>

  <!-- Register buttons -->
  <div class="text-center">
    <p>Not a sleuth? <a href="signupPage.do">Sign up</a></p>
  </div>
  </div>
</form>

<!-- <img src="https://media.istockphoto.com/photos/large-group-of-different-animals-picture-id1137961063?b=1&k=20&m=1137961063&s=612x612&w=0&h=YKKTWcMDNLyRr3-gAzCxN5GBvLl4ji3nd8I3nSABriM="></a>
 -->
</body>
</html>