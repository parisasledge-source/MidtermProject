<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User Sign Up</title>
</head>
<body>

<%@ include file="bootstrapSetup.jsp" %>

<!-- <h1>Sign Up</h1>

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

</form> -->

<div class="signup-form">
    <form action="signup.do" method="post" class="form-horizontal">
		<div class="col-xs-8 col-xs-offset-4">
			<h2>Sign Up</h2>
		</div>		
        <div class="form-group">
			<label class="control-label col-xs-4">Username</label>
			<div class="col-xs-4">
                <input type="text" class="form-control" name="username" required="required">
            </div>        	
        </div>
		<div class="form-group">
			<label class="control-label col-xs-4">Password</label>
			<div class="col-xs-4">
                <input type="password" class="form-control" name="password" required="required">
            </div>        	
        </div>
		<div class="form-group">
			<label class="control-label col-xs-4">Confirm Password</label>
			<div class="col-xs-4">
                <input type="password" class="form-control" name="confirm_password" required="required">
            </div>        	
        </div>
		<div class="form-group">
			<div class="col-xs-4 col-xs-offset-4">
				<button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
			</div>  
		</div>		      
    </form>
	<div class="text-center">Already have an account? <a href="loginPage.do">Login here</a></div>
</div>

<!-- <img src="https://media.istockphoto.com/photos/group-of-pets-dog-cat-bird-reptile-rabbit-picture-id167580039?b=1&k=20&m=167580039&s=612x612&w=0&h=EjP8Ori64J__rLissIw6oA_b8qeMUg-Eud-aDJQaKfU="></a> -->
</body>
</html>