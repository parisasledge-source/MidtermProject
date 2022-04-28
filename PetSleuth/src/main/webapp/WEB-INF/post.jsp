<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post</title>
</head>
<body>

	<script type="text/javascript">
		function petValue(num) {
			var txt = document.getElementById("pet").innerHTML;
			txt = num;
			document.getElementById("pet").innerHTML = txt;
			document.getElementById("pet").href = "displayPet.do?id=" + txt;
			document.getElementById("inputPet").value = txt;
		}
		function contactValue(num) {
			var txt = document.getElementById("contact").innerHTML;
			txt = num;
			document.getElementById("contact").innerHTML = txt;
			document.getElementById("contact").href = "displayContact.do?id="
					+ txt;
			document.getElementById("inputContact").value = txt;
		}
		function locationValue(num) {
			var txt = document.getElementById("location").innerHTML;
			txt = num;
			document.getElementById("location").innerHTML = txt;
			document.getElementById("location").href = "displayLocations.do?id="
					+ txt;
			document.getElementById("inputLocation").value = txt;
		}
	</script>

	<%@ include file="bootstrapSetup.jsp"%>

	<form class="well form-horizontal" action="post.do" method="post"
		id="contact_form">
		<fieldset>

			<!-- Form Name -->
			<legend>Add A Post</legend>

			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Date Your Pet Was Last
					Seen</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input name="last"
							class="form-control" type="date">
					</div>
				</div>
			</div>

			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Description of Your
					Pet</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input name="description"
							class="form-control" type="text">
					</div>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label">Reward (Not required)</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-envelope"></i></span> <input name="reward"
							class="form-control" type="text">
					</div>
				</div>
			</div>

			<p>
				Pet Selected For This Post (REQURED TO POST):  <a href="displayPet.do?id=0" id="pet"></a>
			</p>

			<p>
				Contact Selected For This Post (REQURED TO POST): <a href="displayContact.do?id=0"
					id="contact"></a>
			</p>
			<p>
				Location Selected For This Post (REQURED TO POST):  <a href="displayLocation.do?id=0"
					id="location"></a>
			</p>

			<input name="petId" type="hidden" id="inputPet"> <input
				name="contactId" type="hidden" id="inputContact"> <input
				name="locationId" type="hidden" id="inputLocation">

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



	<c:choose>
		<c:when test="${empty pets}">

			<div class="card">
				<div class="card-header text-center">You don't have any pets
					saved to your profile! Add one here!</div>
				<div class="card-body">
					<h5 class="card-title text-center">Add A Pet</h5>

					<div class="text-center">
						<button class="btn btn-primary" type="button"
							data-toggle="collapse" data-target="#petEmpty"
							aria-expanded="false" aria-controls="collapseExample">Add
							A Pet</button>
					</div>

					<div class="collapse" id="petEmpty">
						<form class="well form-horizontal" action="pet.do" method="post"
							id="contact_form">
							<fieldset>

								<!-- Form Name -->
								<legend>Add A Pet</legend>

								<!-- Text input-->

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

								<!-- Text input-->

								<div class="form-group">
									<label class="col-md-4 control-label">Pet Name</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input name="name"
												class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Pet Breed</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="breed" class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Description</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="description" class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Is Your Pet
										Chipped?</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <label>Yes</label>
											<input name="chip" class="form-control" type="radio"
												value="true"> <label>No</label> <input name="chip"
												class="form-control" type="radio" value="false">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Pet Color</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="color" class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Pet Gender</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="gender" class="form-control" type="text">
										</div>
									</div>
								</div>


								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Is Your Pet
										Neutered?</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <label>Yes</label>
											<input name="neutered" class="form-control" type="radio"
												value="true"> <label>No</label> <input
												name="neutered" class="form-control" type="radio"
												value="false">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Pet Age</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input name="age"
												class="form-control" type="text">
										</div>
									</div>
								</div>

								<input name="userId" type="hidden" value="${user.id}">

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
					</div>
				</div>
			</div>


		</c:when>
		<c:otherwise>

			<div class="card">
				<div class="card-header text-center">Is this post for any of
					these pets?</div>
				<div class="card-body">
					<h5 class="card-title text-center">Your Existing Pets</h5>
					<table class="table">
						<thead>
							<tr>
								<th></th>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Breed</th>
								<th scope="col">Color</th>
								<th scope="col">Description</th>

							</tr>
						</thead>
						<c:forEach var="p" items="${pets}">
							<c:choose>
								<c:when test="${ p.active }">

									<tbody>
										<tr>
											<td>
												<button onclick="petValue(this.value)" type="submit"
													class="btn btn-primary" name="id" value="${p.id}">Select</button>
											</td>
											<td>${p.id}</td>
											<td>${p.name}</td>
											<td>${p.breed}</td>
											<td>${p.color}</td>
											<td>${p.description}</td>
										</tr>
									</tbody>
								</c:when>
							</c:choose>
						</c:forEach>
					</table>

					<div class="text-center">
						<h5>If you don't see your pet, add one here!</h5>
						<button class="btn btn-primary" type="button"
							data-toggle="collapse" data-target="#petEmpty"
							aria-expanded="false" aria-controls="collapseExample">Add
							A Pet</button>

					</div>
					<div class="collapse" id="petEmpty">
						<form class="well form-horizontal" action="pet.do" method="post"
							id="contact_form">
							<fieldset>

								<!-- Form Name -->
								<legend>Add A Pet</legend>

								<!-- Text input-->

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

								<!-- Text input-->

								<div class="form-group">
									<label class="col-md-4 control-label">Pet Name</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input name="name"
												class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Pet Breed</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="breed" class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Description</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="description" class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Is Your Pet
										Chipped?</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <label>Yes</label>
											<input name="chip" class="form-control" type="radio"
												value="true"> <label>No</label> <input name="chip"
												class="form-control" type="radio" value="false">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Pet Color</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="color" class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Pet Gender</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="gender" class="form-control" type="text">
										</div>
									</div>
								</div>


								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Is Your Pet
										Neutered?</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <label>Yes</label>
											<input name="neutered" class="form-control" type="radio"
												value="true"> <label>No</label> <input
												name="neutered" class="form-control" type="radio"
												value="false">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Pet Age</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input name="age"
												class="form-control" type="text">
										</div>
									</div>
								</div>

								<input name="userId" type="hidden" value="${user.id}">

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
					</div>

				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${empty contacts}">


			<div class="card">
				<div class="card-header text-center">You don't have any
					contact information saved to your profile. Add one here!</div>
				<div class="card-body">
					<h5 class="card-title text-center">Add A Contact Method</h5>

					<div class="text-center">
						<button class="btn btn-primary" type="button"
							data-toggle="collapse" data-target="#contactEmpty"
							aria-expanded="false" aria-controls="collapseExample">Add
							A Contact Method</button>
					</div>
					<div class="collapse" id="contactEmpty">
						<form class="well form-horizontal" action="addContact.do"
							method="post" id="contact_form">
							<fieldset>

								<!-- Form Name -->
								<legend>Add A Contact Method</legend>

								<!-- Text input-->

								<div class="form-group">
									<label class="col-md-4 control-label">Preferred Contact
										Method</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input
												name="contactPreference" class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input-->

								<div class="form-group">
									<label class="col-md-4 control-label">Email</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input name="email"
												class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Phone Number</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="phoneNumber" class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Miscellaneous
										Contact Information</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="contactInfo" class="form-control" type="text">
										</div>
									</div>
								</div>

								<input name="userId" type="hidden" value="${user.id}">

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
					</div>
				</div>
			</div>

		</c:when>
		<c:otherwise>
			<div class="card">
				<div class="card-header text-center">Which contact method
					would you like to use for this post?</div>
				<div class="card-body">
					<h5 class="card-title text-center">Your Existing Contact
						Methods</h5>
					<table class="table">
						<thead>
							<tr>
								<th></th>
								<th scope="col">ID</th>
								<th scope="col">Contact Preference</th>
								<th scope="col">Email</th>
								<th scope="col">Phone Number</th>
								<th scope="col">Information</th>

							</tr>
						</thead>
						<c:forEach var="p" items="${contacts}">
							<c:choose>
								<c:when test="${ p.active }">

									<tbody>
										<tr>
											<td>
												<button onclick="contactValue(this.value)" type="submit"
													class="btn btn-primary" name="id" value="${p.id}">Select</button>
											</td>
											<td>${p.id}</td>
											<td>${p.contactPreference}</td>
											<td>${p.email}</td>
											<td>${p.phoneNumber}</td>
											<td>${p.contactInfo}</td>
										</tr>
									</tbody>
								</c:when>
							</c:choose>
						</c:forEach>
					</table>

					<div class="text-center">
						<h5>If you don't see the necessary contact information, add
							it here!</h5>

						<button class="btn btn-primary" type="button"
							data-toggle="collapse" data-target="#contactEmpty"
							aria-expanded="false" aria-controls="collapseExample">Add
							A Contact Method</button>

					</div>
					<div class="collapse" id="contactEmpty">
						<form class="well form-horizontal" action="addContact.do"
							method="post" id="contact_form">
							<fieldset>

								<!-- Form Name -->
								<legend>Add A Contact Method</legend>

								<!-- Text input-->

								<div class="form-group">
									<label class="col-md-4 control-label">Preferred Contact
										Method</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input
												name="contactPreference" class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input-->

								<div class="form-group">
									<label class="col-md-4 control-label">Email</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input name="email"
												class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Phone Number</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="phoneNumber" class="form-control" type="text">
										</div>
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label">Miscellaneous
										Contact Information</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="contactInfo" class="form-control" type="text">
										</div>
									</div>
								</div>

								<input name="userId" type="hidden" value="${user.id}">

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
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${empty locations}">
			<div class="card">
				<div class="card-header text-center">You don't have location
					information saved to your profile. Add one here!</div>
				<div class="card-body">
					<h5 class="card-title text-center">Add A Location</h5>

					<div class="text-center">
						<button class="btn btn-primary" type="button"
							data-toggle="collapse" data-target="#locationEmpty"
							aria-expanded="false" aria-controls="collapseExample">Add
							Location</button>
					</div>
					<div class="collapse" id="locationEmpty">
						<form class="well form-horizontal" action="createLocation.do"
							method="post" id="contact_form">
							<fieldset>

								<!-- Form Name -->
								<legend>Add A Location</legend>

								<!-- Text input-->

								<div class="form-group">
									<label class="col-md-4 control-label">Street</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input name="street"
												class="form-control" type="text">
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
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="State" class="form-control" type="text">
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
												name="zipcode" class="form-control" type="text">
										</div>
									</div>
								</div>

								<input type="hidden" name="id" value="${user.id}">

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
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>

			<div class="card">
				<div class="card-header text-center">Would you like to use the
					location in your profile?</div>
				<div class="card-body">
					<h5 class="card-title text-center">Your Existing Location</h5>
					<table class="table">
						<thead>
							<tr>
								<th></th>
								<th scope="col">ID</th>
								<th scope="col">Street</th>
								<th scope="col">City</th>
								<th scope="col">State</th>
								<th scope="col">Zip Code</th>

							</tr>
						</thead>
						<c:forEach var="p" items="${locations}">
							<c:choose>
								<c:when test="${ p.active }">

									<tbody>
										<tr>
											<td>
												<button onclick="locationValue(this.value)" type="submit"
													class="btn btn-primary" name="id" value="${p.id}">Select</button>
											</td>
											<td>${p.id}</td>
											<td>${p.street}</td>
											<td>${p.city}</td>
											<td>${p.state}</td>
											<td>${p.zipcode}</td>
										</tr>
									</tbody>
								</c:when>
							</c:choose>
						</c:forEach>
					</table>

					<div class="text-center">
						<h5>Add a different location</h5>

						<button class="btn btn-primary" type="button"
							data-toggle="collapse" data-target="#locationEmpty"
							aria-expanded="false" aria-controls="collapseExample">Add
							Location</button>

					</div>
					<div class="collapse" id="locationEmpty">
						<form class="well form-horizontal" action="createLocation.do"
							method="post" id="contact_form">
							<fieldset>

								<!-- Form Name -->
								<legend>Add A Location</legend>

								<!-- Text input-->

								<div class="form-group">
									<label class="col-md-4 control-label">Street</label>
									<div class="col-md-4 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input name="street"
												class="form-control" type="text">
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
												class="glyphicon glyphicon-envelope"></i></span> <input
												name="State" class="form-control" type="text">
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
												name="zipcode" class="form-control" type="text">
										</div>
									</div>
								</div>

								<input type="hidden" name="id" value="${user.id}">

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
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>