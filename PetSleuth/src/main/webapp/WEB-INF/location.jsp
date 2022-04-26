<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Location</title>
</head>
<body>
	${locations}
	
	<form action="updateLocations.do" method = "POST">
	
	State: <input type="text" value="${locations.state}" name="state" /> 
	<br>
	City: <input type="text" value ="${locations.city}" name="city" />
	<br>
	Street: <input type="text" value ="${locations.street}" name="street" />
	<br>
	Zip code: <input type="text" value ="${locations.zipcode}" name="zipcode" />
	<br>
	<input type="submit" value="Submit" />
	</form>
</body>
</html>