<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry ! something went wrong...</title>
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

</head>
<body>

	<div class="container text-center">
		<img src="img/bug.png" class="img-fluid">
		<h3 class="display-3">Sorry ! Something went wrong...</h3>
		<%=exception%>
		<a href="index.jsp"
			class="btn primary-background btn-lg text-white mt-3">Home</a>
	</div>


</body>
</html>