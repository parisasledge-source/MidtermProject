<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Sleuth</title>
</head>
<body>
	<%@ include file="bootstrapSetup.jsp"%>

<c:choose>
<c:when test="${! empty user}">
<main role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <div class="container">
          <h1 class="display-3">Pet Sleuth</h1>
          <p>Pet Sleuth is dedicated to finding lost pets across the United States. You can use this site to post lost pets or find lost pets you'd like to help search for. Interested in how we built this site? Check out our GitHub below!</p>
          <p><a class="btn btn-primary btn-lg" href="https://github.com/parisasledge-source/MidtermProject" role="button" target="_blank">GitHub</a></p>
        </div>
      </div>

      <div class="container">
        <!-- Example row of columns -->
        <div class="row">
          <div class="col-md-4">
            <h2>Post</h2>
            <p>If you lost a pet, make a post today! Existing Sleuths can find your post based on location, what type of animal they are, breed, and more!</p>
            <p><a class="btn btn-secondary" href="postPage.do" role="button">Make A Post</a></p>
          </div>
          <div class="col-md-4">
            <h2>Search</h2>
			<p>Interested in helping people find their pets? Become a Sleuth today by searching for a lost pet posting in your area!</p>
            <form class="form-inline my-2 my-lg-0" action="search.do" method="POST">
      <input class="form-control mr-sm-2" type="search" placeholder="Search For Posts" aria-label="Search" name="word">
      <button class="btn btn-secondary" type="submit">Search</button>
    </form>
          </div>
           <div class="col-md-4">
            <h2>Pet</h2>
			<p>Don't have a pet linked to your account? No worries! Add a pet here. If your pet goes missing, you can easily make a post with your pet's information linked to your account</p>
            <p><a class="btn btn-secondary" href="petPage.do" role="button">Add A Pet</a></p>
          </div>
        </div>

        <hr>

      </div> <!-- /container -->

    </main>
</c:when>
<c:otherwise>
<main role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <div class="container">
          <h1 class="display-3">Pet Sleuth</h1>
          <p>Pet Sleuth is dedicated to finding lost pets across the United States. You can use this site to post lost pets or find lost pets you'd like to help search for. Interested in how we built this site? Check out our GitHub below!</p>
          <p><a class="btn btn-primary btn-lg" href="https://github.com/parisasledge-source/MidtermProject" role="button" target="_blank">GitHub</a></p>
        </div>
      </div>

      <div class="container">
        <!-- Example row of columns -->
        <div class="row">
          <div class="col-md-4">
            <h2>Log In</h2>
            <p>Are you an existing Sleuth? Log into your account now!</p>
            <p><a class="btn btn-secondary" href="loginPage.do" role="button">Log In</a></p>
          </div>
          <div class="col-md-4">
            <h2>Sign Up</h2>
			<p>Don't have an account with Pet Sleuth? Become a member of the community and sign up today!</p>
            <p><a class="btn btn-secondary" href="signupPage.do" role="button">Sign Up</a></p>
          </div>
        </div>

        <hr>

      </div> <!-- /container -->

    </main>
</c:otherwise>

</c:choose>

</body>
</html>