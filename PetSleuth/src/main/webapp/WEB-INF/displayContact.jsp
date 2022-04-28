<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Contact</title>
</head>
<body>

	<%@ include file="bootstrapSetup.jsp"%>

<%-- 	<ul>
		<li>${contact.contactPreference}</li>
		<li>${contact.contactInfo}</li>
		<li>${contact.email}</li>
		<li>${contact.phoneNumber}</li>
	</ul>

	<br> --%>

	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-8">
						<h2>Contact Information</h2>
					</div>
					<div class="col-sm-4">
					<a href="contactPage.do">
						<button type="button" class="btn btn-info add-new">
							<i class="fa fa-plus"></i> Add New
						</button>
					</a>
					</div>
				</div>
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Contact Preference</th>
						<th>General Information</th>
						<th>Email Address</th>
						<th>Phone Number</th>
						<th>Actions</th>
					</tr>
				</thead>
							<tbody>
								<tr>
									<td>${contact.contactPreference}</td>
									<td>${contact.contactInfo}</td>
									<td>${contact.email}</td>
									<td>${contact.phoneNumber}</td>
<!-- 									<td><a class="add" title="Add" data-toggle="tooltip"><i
											class="material-icons">&#xE03B;</i></a> <a class="edit"
										title="Edit" data-toggle="tooltip"><i
											class="material-icons">&#xE254;</i></a> <a class="delete"
										title="Delete" data-toggle="tooltip"><i
											class="material-icons">&#xE872;</i></a></td> -->
								</tr>
							
				</tbody>
			</table>
		</div>
	</div>
	
	<br>
	
	<h3>Update your Contact Information</h3>
	<form action="updateContact.do" method="POST">

		<label for="contactPreference">Preferred contact method:</label> <input
			name="contactPreference" type="text"
			value="${contact.contactPreference}"> <br> <label
			for="contactInfo">Contact Information:</label> <input
			name="contactInfo" type="text" value="${contact.contactInfo}">
		<br> <label for="email">Email address:</label> <input
			name="email" type="text" value="${contact.email}"> <br>
		<label for="phoneNumber">Phone number:</label> <input
			name="phoneNumber" type="text" value="${contact.phoneNumber}">
		<br> <input name="userId" type="hidden" value="${user.id}">
		<br> <input name="submit" type="submit">
	</form>

<%-- 	<h3>Add Separate Contact Information</h3>

	<form action="addContact.do" method="POST">

		<label for="contactPreference">Preferred contact method:</label> <input
			name="contactPreference" type="text"> <br> <label
			for="contactInfo">Contact Information:</label> <input
			name="contactInfo" type="text"> <br> <label for="email">Email
			address:</label> <input name="email" type="text"> <br> <label
			for="phoneNumber">Phone number:</label> <input name="phoneNumber"
			type="text"> <br> <input name="userId" type="hidden"
			value="${user.id}"> <br> <input name="submit"
			type="submit">
	</form> --%>

</body>
</html>