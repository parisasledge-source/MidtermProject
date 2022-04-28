<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Contacts</title>
</head>
<body>

	<%@ include file="bootstrapSetup.jsp"%>
	<ul>
		<c:choose>
			<c:when test="${! empty contacts}">
				<c:forEach var="p" items="${contacts}">
					<c:choose>
						<c:when test="${ p.active }">
						<table class="table">
  <thead>
    <tr>
    	<th></th>
      <th scope="col">ID</th>
      <th scope="col">E-Mail</th>
      <th scope="col">Phone Number</th>
    
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><form action="displayContact.do"><button type="submit" class="btn btn-primary" name="id" value="${p.id}">View</button></form></td>
      <td>${p.id}</td>
      <td>${p.email}</td>
      <td>${p.phoneNumber}</td>
    </tr>
  </tbody>
</table>
							<%-- <table>
								<thead>
									<tr>
										<th>ID</th>
										<th>E-Mail</th>
										<th>Phone Number</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><a href="displayContact.do?id=${p.id}">${p.id}</a></td>
										<td><a href="displayContact.do?id=${p.id}">${p.email}</a></td>
										<td><a href="displayContact.do?id=${p.id}">${p.phoneNumber}</a></td>
									</tr>
								</tbody>
							</table> --%>
							<br>

							<h3>Remove a Contact</h3>

							<form action="destroyContact.do" method="POST">
								Enter a Contact ID: <input type="text" name="contactId" /> <input
									type="submit"  class="btn btn-primary" value="Submit" />
							</form>
							<%-- <li> 
					<a href = "displayContact.do?id=${p.id}">${p.id} ${p.email}<br>${p.phoneNumber}</a>
				</li> --%>
						</c:when>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h3>No contact information found!</h3>
				<a href="addContactRedir.do">Add A Contact Here</a>
			</c:otherwise>
		</c:choose>
	</ul>




</body>
</html>