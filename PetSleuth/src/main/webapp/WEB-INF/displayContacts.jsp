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
							<table>
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
							</table>
							<br>

							<h3>Remove a Contact</h3>

							<form action="destroyContact.do" method="POST">
								Enter a Contact ID: <input type="text" name="contactId" /> <input
									type="submit" value="Submit" />
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
				<a href="addContact.do">Add A Contact Here</a>
			</c:otherwise>
		</c:choose>
	</ul>




</body>
</html>