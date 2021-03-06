<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Pets</title>
</head>
<body>

	<%@ include file="bootstrapSetup.jsp"%>

	<c:choose>
		<c:when test="${! empty pets}">


	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-8">
						<h2>View pet Profile</h2>
					</div>
					<div class="col-sm-4">
					<a href="contactPage.do">

		</a>
					</div>
				</div>
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th></th>
						<th scope="col">ID</th>
						<th scope="col">Species</th>
						<th scope="col">Breed</th>
						<th scope="col">Name</th>

					</tr>
				</thead>
				<c:forEach var="p" items="${pets}">
					<c:choose>
						<c:when test="${ p.active }">
							<tbody>
								<tr>
									<td><form action="displayPet.do">
											<button type="submit" class="btn btn-primary" name="id"
												value="${p.id}">View</button>
										</form></td>
									<td>${p.id}</td>
									<td>${p.species}</td>
									<td>${p.breed}</td>
									<td>${p.name}</td>
								</tr>
						</c:when>
					</c:choose>
				</c:forEach>
				</tbody>
			</table>
		</div>
			<!-- <table>
			<thead>
			<tr>
			<th>View</th>
			<th>ID</th>
			<th>Species</th>
			<th>Breed</th>
			<th>Name</th>			
			</tr>
			</thead> -->
			<%-- <c:forEach var = "p" items = "${pets}">
		<c:choose>
			<c:when test="${ p.active }"> --%>
			<%-- <tbody>
			<tr>
			<td><form action="displayPet.do"><button name="id" value="${p.id}">View</button></form></td>
			<td>${p.id}</td>
			<td>${p.species}</td>
			<td>${p.breed}</td>
			<td>${p.name}</td>
			</tr>
			</tbody> --%>
			<%-- </c:when>
		</c:choose>
	</c:forEach> --%>
			<!-- </table> -->
			<%-- <li> 
					<a href = "displayPet.do?id=${p.id}"> ${p.id}</a>
				</li> --%>
		</c:when>
		<c:otherwise>
			<h2>No pet profile found!</h2>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>