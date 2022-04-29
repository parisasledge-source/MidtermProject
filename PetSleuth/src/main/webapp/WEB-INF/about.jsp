<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About the Team</title>
</head>
<body>

	<%@ include file="bootstrapSetup.jsp"%>

	<!-- 	<ul>
		<li>Github Repository Owner: Parisa</li>
		<li>Database Administrator: Zack</li>
		<li>Task Manager: Rahil</li>
		<li>SCRUMbag: Dustin</li>
	</ul> -->




	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-8">
						<h2>About Us</h2>
					</div>
					<div class="col-sm-4">
						<a href="contactPage.do"> </a>
					</div>
				</div>
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Title</th>
						<th>Name</th>
						<th>Job description</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Database Administrator</td>
						<td>Zack</td>
						<td>Performance, integrity and security of database, involved in the planning and development of the database, as well as troubleshooting any issues on behalf of the users and ensuring that data remains consistent across the database.</td>
						

					</tr>
					<tr>
						<td>Task Manager</td>
						<td>Rahil</td>
						<td>Controlling and administering the activities and tasks of the team member and managing the tactics, and responsibilities of the team.</td>
						

					</tr>
					<tr>
						<td>SCRUMbag</td>
						<td>Dustin</td>
						<td>Leading the team using Agile project management through the course of the project, using Agile project management techniques.</td>

					</tr>
					<tr>
						<td>GitHub Repository Squirrel</td>
						<td>Parisa</td>
						<td>Ownership permissions of the GitHub account and invitation of the other users on GitHub repository as collaborators.</td>
						

					</tr>

				</tbody>
			</table>
		</div>

		<br>
	</div>



</body>
</html>