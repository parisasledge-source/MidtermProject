<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Location</title>
</head>
<body>

<%@ include file="bootstrapSetup.jsp" %>
<c:choose>
 <c:when test="${empty locations  }">
 <h2>Create</h2>
	<form action="createLocation.do" method = "POST">
	
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
 	</c:when>
 	
 <c:otherwise>
	<h1>Location</h1>
	State: ${locations.state}
	<br>
	City: ${locations.city}
	<br>
	Street: ${locations.street}
	<br>
	Zip code: ${locations.zipcode}
	<br>
	<h2>Update</h2>
	
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
	<br>
	
	 	<div>
		<div class="card">
			<h5 class="card-header">Location</h5>
			<div class="card-body">
				<h5 class="card-title">Your Location</h5>
				<ul>
					<li>Street: ${locations.street}</li>
					<li>City: ${locations.city}</li>
					<li>State: ${locations.state}</li>
					<li>Zip Code: ${locations.zipcode}</li>
				</ul>
			</div>
		</div>
	</div>
	
	</c:otherwise>
</c:choose>

</body>
</html>