

<%@page import="entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="dao.PostDao"%>


<div class="row">
	<%
	  /* Thread.sleep(1000);   */
	
	PostDao pd = new PostDao(ConnectionProvider.getConnection());	
	List<Post> posts = null;
	int cid =Integer.parseInt(request.getParameter("cid"));
	List<Post> post = pd.getPostByCatID(cid);
	
	
	if(cid == 0){
	 posts = pd.getAllPost();
	}else{
		posts = pd.getPostByCatID(cid);
	}
	
	if(posts.size() == 0){
		
		out.println("<h3 class = 'text-center display-3'>No posts in this category...</h3>");
		return;
	}
	for (Post p : posts) {
	%>

	<div class="col-md-6 mt-2">

		<div class="card">


<img class="card-img-top" src="blog_files/<%= p.getpPic()%>" alt="Card image cap">
			<div class="card-body">
				
				<b><%=p.getpTitle()%></b>
				<p><%=p.getpContent()%></p>
				<pre><%= p.getpCode() %></pre>
			</div>
			
			<div class="card-footer primary-background text-center">
			<a href="#" class="btn btn-outline-light text-white btn-sm"><i class="fa fa-thumbs-o-up"><span> 10 </span></i></a>
			<a href="show_more.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm ">Read More</a>
			
			<a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span> 20 </span></i></a>
			
			</div>

		</div>

	</div>

	<%
	}
	%>


</div>