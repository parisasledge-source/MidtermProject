<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Sleuth</title>
</head>
<body>


	<%@ include file="bootstrapSetup.jsp"%>
	<div class="py-5">
		<div class="container">
			<div class="row hidden-md-up centered cards">
				<div class="col-md-4">
					<div class="card bg-light mb-3">
						<div class="card-block">
							<h4 class="card-title">Make a Post</h4>
							<p class="card-text p-y-1">Lost your pet? Make a post! Pet sleuths
							everywhere are looking for pets to help find.</p>
							<a href="postPage.do" class="btn btn-primary">Post</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-block">
							<h4 class="card-title">Find a Post</h4>
							<p class="card-text p-y-1">Interested in helping find a pet?
								Help find one by searching for a post! You can search based on
								location, name, type of pet, and many more!</p>
							<form role="search" action="search.do" method="POST">
								<input type="text" class="form-control"
									placeholder="Search For Posts" name="word">
								<button type="submit" class="btn btn-primary">Search</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- 	<img src="https://media.istockphoto.com/photos/group-of-pets-posing-around-a-border-collie-dog-cat-ferret-rabbit-picture-id1296353202?b=1&k=20&m=1296353202&s=612x612&w=0&h=Yf_e0loghlTNINRs2ZDH9L-JF8JUz4_tldVyzgNa17g="></a>
 -->
</body>
</html>