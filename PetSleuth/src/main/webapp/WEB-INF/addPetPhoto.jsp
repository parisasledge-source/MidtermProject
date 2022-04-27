<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Result</title>
</head>
<body>

<%@ include file="bootstrapSetup.jsp" %>

<h3>Would you like to add a pet photo?</h3>

<form action="addPetPhoto.do">
	<label for="photos">Enter the URL:</label> 
	<input name="photos" type="text" value="${pet.addPetPhoto}">
</form>


</body>
</html>