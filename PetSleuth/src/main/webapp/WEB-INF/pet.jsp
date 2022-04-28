<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet</title>
</head>
<body>

	<%@ include file="bootstrapSetup.jsp"%>

	<h1>Add a Pet</h1>
	<form action="pet.do" method="POST">
		<div class="form-group">
			<label class="col-md-4 control-label">Species</label>
			<div class="col-md-4 inputGroupContainer">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input name="species"
						class="form-control" type="text">
				</div>
			</div>
		</div>
		<label class="col-md-4 control-label">Breed</label>
		<div class="col-md-4 inputGroupContainer">
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input name="breed"
					class="form-control" type="text">
			</div>
		</div>

		<label class="col-md-4 control-label">Name</label>
		<div class="col-md-4 inputGroupContainer">
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input name="name"
					class="form-control" type="text">
			</div>
		</div>

		<label class="col-md-4 control-label">Description</label>
		<div class="col-md-4 inputGroupContainer">
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input name="description"
					class="form-control" type="text">
			</div>
		</div>

		<label class="col-md-4 control-label">Color</label>
		<div class="col-md-4 inputGroupContainer">
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input name="color"
					class="form-control" type="text">
			</div>
		</div>

		<label class="col-md-4 control-label">Gender</label>
		<div class="col-md-4 inputGroupContainer">
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input name="gender"
					class="form-control" type="text">
			</div>
		</div>

		<label class="col-md-4 control-label">Age</label>
		<div class="col-md-4 inputGroupContainer">
			<div class="input-group">
				<span class="input-group-addon"><i
					class="glyphicon glyphicon-user"></i></span> <input name="age"
					class="form-control" type="text">
			</div>
		</div>

		<br>
		
			Is your pet chipped?
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
  <label class="btn btn-primary active">
    <input type="radio" name="chip" id="option1" autocomplete="off" value="true" checked> Yes
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="chip" id="option2" autocomplete="off" value="false"> No
  </label>
  </div>
  <br>
  <br>
			Is your pet neutered?
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
  <label class="btn btn-primary active">
    <input type="radio" name="neutered" id="option1" autocomplete="off" value="true" checked> Yes
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="neutered" id="option2" autocomplete="off" value="false"> No
  </label>
  </div>
	<br>
	<br>
	
	<!-- <label for="species">Enter the species:</label> 
		<input name="species" type="text"> <br> 
		
		<label for="name">Enter the name:</label> 
		<input name="name" type="text"> <br> 
		
		<label for="breed">Enter the breed:</label> 
		<input name="breed" type="text"> <br> 
				
		<label for="description">Enter the description:</label> 		
		<input name="description" type="text"> <br> 
		
		Is your pet chipped?		
		<label for="chip">Yes</label> 
		<input name="chip" type="radio" value="true">
		<label for="chip">No</label> 
		<input name="chip" type="radio" value="false"><br> -->

	<!-- <label for="color">Enter the color:</label> 
		<input name="color" type="text"> <br> 
		
		<label for="gender">Enter the gender:</label> 
		<input name="gender" type="text"> <br>  -->

	<!-- Is your pet neutered?		
		<label for="neutered">Yes</label> 
		<input name="neutered" type="radio" value="true">
		<label for="neutered">No</label> 
		<input name="neutered" type="radio" value="false"><br> -->

	<!-- <label for="age">Enter the age:</label> 		
		<input name="age" type="text"> <br> 	
		<br> -->

	<input name="userId" type="hidden" value="${user.id}">

	<%-- 		<h1> Here is all your pets:</h1>
		<ul>
			<c:forEach var="p" items="${pets}">
			
				<li>
				${p.id} 
				
				</li>
			
			</c:forEach>
		
		</ul>
		 --%>

	<input class="btn btn-primary" name="submit" type="submit">
</form>


</body>
</html>