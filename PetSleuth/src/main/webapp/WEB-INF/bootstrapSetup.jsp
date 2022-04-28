<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>Bootstrap Setup</title>
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>

.centered {
    left: 50%;
    top: 50%;
    margin-left: -5%;
    position: absolute;
    margin-top: -5%;
}

.cards{
    left: 15%;
}

}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/">PetSleuth</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
<c:choose>
<c:when test="${! empty user}">

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="/" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Account
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="displayUserInfo.do">Update Information</a>
          <a class="dropdown-item" href="displayContacts.do">Contact Information</a>
          <a class="dropdown-item" href="displayPets.do">Pets</a>
          <a class="dropdown-item" href="displayPosts.do">Posts</a>
          <a class="dropdown-item" href="displayLocations.do">Location Information</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="/" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Post
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="displayPosts.do">Your Posts</a>
          <a class="dropdown-item" href="postPage.do">Add A Post</a>
          <a class="dropdown-item" href="updatePostPage.do">Update Posts</a>
          <a class="dropdown-item" href="removePostPage.do">Remove A Post</a>
        </div>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="/" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Pet
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="displayPets.do">Your Pets</a>
          <a class="dropdown-item" href="petPage.do">Add A Pet</a>
          <a class="dropdown-item" href="updatePetPage.do">Update Pets</a>
          <a class="dropdown-item" href="removePetPage.do">Remove A Pets</a>
        </div>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="/" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          About
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="about.do">The Team</a>
          <a class="dropdown-item" href="https://github.com/parisasledge-source/MidtermProject" target="_blank">GitHub</a>
        </div>
        </li>
<li class="nav-item">
        <a class="nav-link" href="signout.do">Sign Out</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="search.do" method="POST">
      <input class="form-control mr-sm-2" type="search" placeholder="Search For Posts" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</c:when>
<c:otherwise>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
 <li class="nav-item">
 	<a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
 	<li>
        <a class="nav-link" href="signupPage.do">Sign Up</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="loginPage.do">Log In</a>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="/" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          About
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="about.do">The Team</a>
          <a class="dropdown-item" href="https://github.com/parisasledge-source/MidtermProject" target="_blank">GitHub</a>
        </div>
        </li>
      </ul>
      </div>
</c:otherwise>
</c:choose>
</nav>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>

