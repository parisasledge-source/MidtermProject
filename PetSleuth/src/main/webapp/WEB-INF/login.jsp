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


<form action="login.do" method="POST" class="w-auto p-3 centered" style="left: 40%;">
  <!-- Email input -->
  <div class="row mb-4">
  <div class="form-outline mb-4">
    <label class="form-label" for="form2Example1">Username</label>
    <input type="text" id="form2Example1" class="form-control" name="username" />
  </div>
  </div>

  <!-- Password input -->
   <div class="row mb-4">
  <div class="form-outline mb-4">
    <label class="form-label" for="form2Example2">Password</label>
    <input type="password" id="form2Example2" class="form-control" name="password"/>
  </div>

  <br>

  <!-- Submit button -->
  <button type="submit" class="btn btn-primary btn-block mb-4">Log in</button>

  <!-- Register buttons -->
  <div class="text-center">
    <p>Not a Sleuth? <a href="signupPage.do">Sign up</a></p>
  </div>
  </div>
</form>


</body>
</html>