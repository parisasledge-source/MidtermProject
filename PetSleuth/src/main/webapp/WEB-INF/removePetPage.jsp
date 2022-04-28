<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Posts</title>
</head>
<body>

	<%@ include file="bootstrapSetup.jsp"%>

	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-8">
						<h2>Remove A Pet</h2>
					</div>
				</div>
			</div>
			<c:choose>
				<c:when test="${! empty pets}">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Remove</th>
								<th>Pet ID Number</th>
								<th>Species</th>
								<th>Name</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p" items="${pets}">
								<c:choose>
									<c:when test="${ p.active }">
										<tr>
											<td><form action="hidePet.do">
													<button class="btn btn-primary" name="petId" value="${p.id}">Remove</button>
												</form></td>
											<td>${p.id}</td>
											<td>${p.species}</td>
											<td>${p.name}</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<h2>No pets found to remove!</h2>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>