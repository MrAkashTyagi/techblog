<%@page import="java.text.DateFormat"%>
<%@page import="dao.UserDao"%>
<%@page import="java.time.ZoneOffset"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="dao.PostDao"%>
<%@page import="entities.Post"%>
<%@page import="entities.User"%>
<%@page errorPage="error.jsp"%>
<%@page import="entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>


<%
int pid = Integer.parseInt(request.getParameter("post_id"));

PostDao pd = new PostDao(ConnectionProvider.getConnection());
Post post = pd.getPostByPostId(pid);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=post.getpTitle()%> || Tech Blog</title>

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 89%, 64% 100%, 28% 95%, 0 100%, 0 0);
}

.post-title{ 
font-weight: 100;
font-size: 30px;
}

.post-content{ 
font-weight: 100;
fonr-size: 25px;
}

.post-code{


}

.post-userInfo{
font-size: 20px;

}

.post-date{
font-style: italic;
font-weight: bold;
}

.row-user{
border: 1px solid #e2e2e2;
padding-top: 15px;
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
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp"><span class="fa fa-code"></span> Learn Code
						<span class="sr-only">(current)</span></a></li>
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



	<!-- main content of body -->

	<div class="container my-4">

		<div class="row">

			<div class="col md-8 offset-md-2">


				<div class="card">

					<div class="card-header primary-background text-white">

						<h3 class="post-title"><%=post.getpTitle()%></h3>
					</div>
								

					<div class="card-body">
						<img class="card-img-top my-2"
							src="blog_files/<%=post.getpPic()%>" alt="Card image cap">
							
							<%
							
							/* int uId = Integer.parseInt(request.getParameter("userId")); */
							
							UserDao dao = new UserDao(ConnectionProvider.getConnection());
							/* dao.getUserByUserId(uId); */
							
							%>
							
							<div class="row my-3 row-user">
							<div class="col-md-8">
							<p class="post-userInfo"><a href = "#" ><%= dao.getUserByUserId(post.getUserId()).getName() %></a> has posted this </p>
							</div>
							
							<div class="col-md-4">
							<p class="post-date"><%= DateFormat.getDateTimeInstance().format(post.getpDate())  %></p>
							
							</div>
							
							</div>
							
						<h3 class="post-content"><%=post.getpContent()%></h3>

						<br> <br>

						<div class="post-code">
							<pre><%=post.getpCode()%></pre>
						</div>
					</div>

					<div class="card-footer primary-background">

						<a href="#" onClik="doLike(<%= post.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-light text-white btn-sm"><i
							class="fa fa-thumbs-o-up"><span> 10 </span></i></a>
						<a href="#"	class="btn btn-outline-light btn-sm">
						<i class="fa fa-commenting-o"><span> 20 </span></i></a>

					</div>

				</div>


			</div>

		</div>

	</div>


	<!-- end of main content of body -->

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

</body>
</html>