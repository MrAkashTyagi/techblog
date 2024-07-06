

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.PostDao;
import entities.Post;
import entities.User;
import helper.ConnectionProvider;
import helper.Helper;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int cid = Integer.parseInt(request.getParameter("cid"));		
		String pTitle = request.getParameter("pTitle");
		String pContent = request.getParameter("pContent");
		String pCode = request.getParameter("pCode");
		Part part = request.getPart("pFile");
		
		//getting current user id
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentUser");
		
		
		Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());
		
		PostDao postDao = new PostDao(ConnectionProvider.getConnection());
		if(postDao.savePost(p)) {
							
			String path = request.getRealPath("/") + "blog_files" + File.separator + part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			response.getWriter().println("done");
			
		}else {
			response.getWriter().println("error");
		}
		
		
		response.setContentType("text/html");
//		response.getWriter().println("Your post title is "+pTitle);
//		response.getWriter().println("Pic "+part.getSubmittedFileName());
		
	}

}
