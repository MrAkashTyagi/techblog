<%@page import="entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="dao.PostDao"%>
<%@page import="entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="entities.User"%>
<%@page errorPage="error.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 89%, 64% 100%, 28% 95%, 0 100%, 0 0);
}

body{
background: url(img/bg.jpg);
background-size: cover;
background-attachement: fixed;

}

</style>

<link href="css/myStyle.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

	<%
	User user = (User) session.getAttribute("currentUser");
	if (user == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<!-- navbar starts -->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"> <span
			class="fa fa-user-circle"></span> Tech Blog
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-code"></span> Learn Code <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="true"> <span class="fa fa-laptop"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-phone"></span> Contact</a></li>
				<li id="do-post-btn" class="nav-item"><a class="nav-link"
					href="#!" data-toggle="modal" data-target="#add-post-modal"><span
						class="fa fa-podcast"></span> Do Post</a></li>

			</ul>
			<ul class="navbar-nav mr-right">

				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profileModal"><span
						class="fa fa-user-plus"></span> <%=user.getName()%></a></li>

				<li class="nav-item"><a class="nav-link" href="login.jsp"><span
						class="fa fa-user-plus"></span> Logout</a></li>

			</ul>
		</div>
	</nav>
	<!-- navbar ends -->

	<%
	Message msg = (Message) session.getAttribute("msg");
	if (msg != null) {
	%>

	<div class="alert  <%=msg.getCssClass()%>" role="alert">
		<%=msg.getContent()%>
	</div>

	<%
	session.removeAttribute("msg");
	}
	%>

	<!-- main body of the page -->


	<main>

		<div class="container">

			<div class="row mt-5">
				<!-- first col -->
				<div class="col md-4">

					<ul class="list-group">
						<li onClick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">All Posts</li>
						<%
						PostDao pd = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Categories> catList = pd.getAllCategories();
						for (Categories cc : catList) {
						%>
						<li onClick="getPosts(<%= cc.getCid()%>,this)" class="c-link list-group-item list-group-item"><%=cc.getName()%></li>

						<%
						}
						%>


					</ul>

				</div>
				<!-- second col -->
				<div class="col md-8" id="post-container">
					<!-- posts -->

					<div class="container text-center">

						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading ...</h3>
					</div>
					
					<div class="container-fliud" id="loader">
					
					</div>

				</div>



			</div>

		</div>


	</main>

	<!--end main body of the page -->

	<!--profile modal starts -->

	<!-- Modal -->
	<div class="modal fade" id="profileModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="container text-center">

						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="max-width: 200px; border-radius: 5%;" /> <br>
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
						<!-- details -->
						<br>
						<div class="container" id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Name :</th>
										<td><%=user.getName()%></td>
									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>
									</tr>

									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Register Date :</th>
										<td><%=user.getDateTime().toString()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- profile edit -->

						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Edit Profile</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email :</td>
										<td><input class="form-control" type="email"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>

									<tr>
										<td>Name :</td>
										<td><input class="form-control" type="text"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>

									<tr>
										<td>Password :</td>
										<td><input class="form-control" type="password"
											name="user_password" value="<%=user.getPassword()%>">
										</td>
									</tr>

									<td>Gender :</td>
									<td><%=user.getGender().toUpperCase()%></td>
									</tr>

									<tr>
										<td>About :</td>
										<td><textarea rows="3" class="form-control"
												name="user_about"> <%=user.getAbout()%> </textarea></td>
									</tr>

									<tr>
										<td>Update Profile :</td>
										<td><input type="file" class="form-control"
											name="profile"></td>
									</tr>

								</table>

								<div class="container mb-2">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>

							</form>

						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button id="edit-profile-btn" type="button"
							class="btn btn-primary">Edit</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--profile modal ends -->

	<!-- post modal starts -->


	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Provide
						post details...</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" class="form" action="AddPostServlet"
						method="post">

						<div class="form-group">

							<select class="form-control" name="cid">
								<option disabled selected>---Select Category---</option>

								<%
								PostDao postDao = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Categories> list = postDao.getAllCategories();
								for (Categories c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<input name="pTitle" type="text"
								placeholder="Please enter post title" class="form-control">
						</div>

						<div class="form-group">
							<textarea name="pContent" rows="5" class="form-control"
								placeholder="Please enter post content here..."></textarea>
						</div>

						<div class="form-group">
							<textarea name="pCode" rows="5" class="form-control"
								placeholder="Please enter code(if any) here..."></textarea>
						</div>

						<div class="form-group">
							<label>Please upload file</label> <input name="pFile" type="file"
								class="form-control">
						</div>

						<div class="container text-center">
							<button class="btn btn-primary">Save</button>
						</div>

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>



	<!-- post modal ends -->






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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {

			let editStatus = false;

			$('#edit-profile-btn').click(function() {
				/* alert("Button clicked") */

				if (editStatus == false) {
					$('#profile-details').hide()
					$('#profile-edit').show()
					editStatus = true;
					$(this).text("Back")
				} else {
					$('#profile-details').show()
					$('#profile-edit').hide()
					editStatus = false;
					$(this).text("Edit")
				}

			})

		});
	</script>

	<!-- adding post js -->

	<script>
		$('document')
				.ready(
						function(e) {

							$('#add-post-form')
									.on(
											"submit",
											function(event) {

												//gets called when form is submitted
												event.preventDefault();
												console.log("submitted");
												let form = new FormData(this);

												//requesting to server
												$
														.ajax({

															url : "AddPostServlet",
															type : 'POST',
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																//success..

																if (data.trim() == 'done') {
																	swal(
																			"Good job!",
																			"Post added successfully!",
																			"success");
																} else {
																	swal(
																			"Error !!",
																			"Something went wrong!",
																			"error");

																}
																console
																		.log(data);

															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																//error...
																swal(
																		"Error !!",
																		"Something went wrong!",
																		"error");
															},
															processData : false,
															contentType : false
														})

											})

						})
	</script>

	<!-- loading post using ajax -->

	<script>
	function getPosts(catId,temp){
		

		$('#loader').show();
		$('#post-container').hide();
		
		$(".c-link").removeClass('active')
		
		$.ajax({
			url : "load_post.jsp",
			data: {cid: catId},
			success : function(data, textStatus, jqXHR) {					
				$('#loader').hide()
				$('#post-container').html(data)
				$('#post-container').show();
				$(temp).addClass('active')
			}
		})
		
	}
	
		$(document).ready(function() {
			
			let allPostRef = $('.c-link')[0]
			getPosts(0,allPostRef)
		})
	</script>

</body>
</html>