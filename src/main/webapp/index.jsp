<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 89%, 64% 100%, 28% 95%, 0 100%, 0 0);
}
</style>

<link href="css/myStyle.css" rel="stylesheet" type="text/css" />


<title>Insert title here</title>
</head>
<body>

	<!-- navbar -->

	<%@include file="navbar.jsp"%>

	<!-- banner -->


	<div class="container-fluid p-0 m-0 banner-background">
		<div class="jumbotron primary-background text-white">
			<div class="container">
				<h3 class="display-3">Welcome to tech blog, World of technology</h3>
				<p>A programming language is a system of notation for writing
					computer programs</p>
				<p>Programming languages are described in terms of their syntax
					(form) and semantics (meaning), usually defined by a formal
					language. Languages usually provide features such as a type system,
					variables and mechanisms for error handling. An implementation of a
					programming language in the form of a compiler or interpreter
					allows programs to be executed, either directly or by producing an
					executable.</p>
				<a class="btn btn-outline-ligth btn-lg">
					<span class="fa fa-edit"></span> Start ! it's free
				</a>
				<a class="btn btn-outline-ligth btn-lg" href="login.jsp" >
					<span class="	fa fa-user-circle-o fa-spin"></span> Login
				</a>
			</div>
		</div>
	</div>

	<!-- cards -->

	<div class="container">

		<div class="row mb-4">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>

		</div>

		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>

		</div>

	</div>


	<!-- javascript -->

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/myJs.js" type="text/javascript"></script>

</body>
</html>