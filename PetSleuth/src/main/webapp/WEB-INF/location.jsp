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
			<form class="well form-horizontal" action="createLocation.do" method="post"
			id="contact_form">
			<fieldset>

				<!-- Form Name -->
				<legend>Add A Location</legend>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Street</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input name="street" class="form-control" type="text">
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">City</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input name="city"
								 class="form-control" type="text">
						</div>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label">State</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-envelope"></i></span> <input name="State"
								 class="form-control" type="text">
						</div>
					</div>
				</div>


				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Zip Code</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-earphone"></i></span> <input
								name="zipcode"
								class="form-control" type="text">
						</div>
					</div>
				</div>
				
				<input type="hidden" name="id" value="${boxer.id}">

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<button type="submit" class="btn btn-warning">
							Submit <span class="glyphicon glyphicon-send"></span>
						</button>
					</div>
				</div>

			</fieldset>
		</form>
 	</c:when>
 	
 <c:otherwise>
		<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-8">
						<h2>Location Information</h2>
					</div>
					<div class="col-sm-4">
					</div>
				</div>
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Street</th>
						<th>City</th>
						<th>State</th>
						<th>Zip Code</th>
					</tr>
				</thead>
							<tbody>
								<tr>
									<td>${locations.street}</td>
									<td>${locations.city}</td>
									<td>${locations.state}</td>
									<td>${locations.zipcode}</td>
								</tr>
							
				</tbody>
			</table>
		</div>
	</div>
	
		
		<br>
	

		<form class="well form-horizontal" action="updateLocations.do" method="post"
			id="contact_form">
			<fieldset>

				<!-- Form Name -->
				<legend>Update Your Location</legend>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Street</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input name="street"
								value="${locations.street}" class="form-control" type="text">
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">City</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input name="city"
								value="${locations.city}" class="form-control" type="text">
						</div>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label">State</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-envelope"></i></span> <input name="State"
								value="${locations.state}" class="form-control" type="text">
						</div>
					</div>
				</div>


				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Zip Code</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-earphone"></i></span> <input
								name="zipcode" value="${locations.zipcode}"
								class="form-control" type="text">
						</div>
					</div>
				</div>
				
				<input type="hidden" name="id" value="${locations.id}">

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<button type="submit" class="btn btn-warning">
							Submit <span class="glyphicon glyphicon-send"></span>
						</button>
					</div>
				</div>

			</fieldset>
		</form>
	
	</c:otherwise>
</c:choose>

</body>
</html>