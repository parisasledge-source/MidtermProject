<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>Bootstrap Setup</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<style>
.navbar-default {
  background-color: #69899f;
  border-color: #425766;
}
.navbar-default .navbar-brand {
  color: #d7e2e9;
}
.navbar-default .navbar-brand:hover, .navbar-default .navbar-brand:focus {
  color: #e5dbdb;
}
.navbar-default .navbar-text {
  color: #d7e2e9;
}
.navbar-default .navbar-nav > li > a {
  color: #d7e2e9;
}
.navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus {
  color: #e5dbdb;
}
.navbar-default .navbar-nav > li > .dropdown-menu {
  background-color: #69899f;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > a {
  color: #d7e2e9;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > a:hover,
.navbar-default .navbar-nav > li > .dropdown-menu > li > a:focus {
  color: #e5dbdb;
  background-color: #425766;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > .divider {
  background-color: #69899f;
}
.navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active > a:hover, .navbar-default .navbar-nav > .active > a:focus {
  color: #e5dbdb;
  background-color: #425766;
}
.navbar-default .navbar-nav > .open > a, .navbar-default .navbar-nav > .open > a:hover, .navbar-default .navbar-nav > .open > a:focus {
  color: #e5dbdb;
  background-color: #425766;
}
.navbar-default .navbar-toggle {
  border-color: #425766;
}
.navbar-default .navbar-toggle:hover, .navbar-default .navbar-toggle:focus {
  background-color: #425766;
}
.navbar-default .navbar-toggle .icon-bar {
  background-color: #d7e2e9;
}
.navbar-default .navbar-collapse,
.navbar-default .navbar-form {
  border-color: #d7e2e9;
}
.navbar-default .navbar-link {
  color: #d7e2e9;
}
.navbar-default .navbar-link:hover {
  color: #e5dbdb;
}

@media (max-width: 767px) {
  .navbar-default .navbar-nav .open .dropdown-menu > li > a {
    color: #d7e2e9;
  }
  .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover, .navbar-default .navbar-nav .open .dropdown-menu > li > a:focus {
    color: #e5dbdb;
  }
  .navbar-default .navbar-nav .open .dropdown-menu > .active > a, .navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover, .navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus {
    color: #e5dbdb;
    background-color: #425766;
  }
}
</style>
</head>
<body>
<c:choose>
<c:when test="${! empty user}">
<div class="container-fluid">
<nav class="navbar navbar-default">
  <div class="container-fluid">

    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>

    </div>


    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/">Home<span class="sr-only">(current)</span></a></li>
      
        <!-- First dropdown code -->
        <li class="dropdown">
          <a href="/" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Account<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="displayUserInfo.do">Update Information</a></li>
            <li><a href="displayContacts.do">Contact Information</a></li>
            <li><a href="displayPets.do">Pets</a></li>
            <li><a href="displayPosts.do">Posts</a></li>
            <li><a href="displayLocations.do">Location Information</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-left">
      
      <!-- Second dropdown code -->
     <li class="dropdown">
          <a href="/" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Post<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="displayPosts.do">Your Posts</a></li>
            <li><a href="postPage.do">Add A Post</a></li>
            <li><a href="updatePostPage.do">Update Posts</a></li>
            <li><a href="removePostPage.do">Remove A Post</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-left">
      
       <!-- Third dropdown code -->
     <li class="dropdown">
          <a href="/" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pets<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="displayPets.do">Your Pets</a></li>
            <li><a href="petPage.do">Add A Pet</a></li>
            <li><a href="updatePetPage.do">Update Existing Pets</a></li>
            <li><a href="removePetPage.do">Remove A Pet</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search" action="search.do" method="POST">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search For Posts" name="word">
        </div>
        <button type="submit" class="btn btn-info">Go</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        
        <!-- About dropdown code -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">About<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="about.do">The Team</a></li>
            <li><a href="https://github.com/parisasledge-source/MidtermProject" target="_blank">GitHub</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</div>
        </c:when>
        <c:otherwise>
        <div class="container-fluid">
<nav class="navbar navbar-default">
  <div class="container-fluid">

    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>

    </div>


    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/">Home<span class="sr-only">(current)</span></a></li>
        <li><a href="signupPage.do">Sign Up</a></li>
       	<li><a href="loginPage.do">Log In</a></li>
       	</ul>
       	        <!-- About dropdown code -->
        <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">About<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="about.do">The Team</a></li>
            <li><a href="https://github.com/parisasledge-source/MidtermProject" target="_blank">GitHub</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</div>
        </c:otherwise>
        </c:choose>
        
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>

