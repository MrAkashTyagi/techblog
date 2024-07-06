
import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.UserDao;
import entities.Message;
import entities.User;
import helper.ConnectionProvider;
import helper.Helper;

@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		// fetching all data

		String userEmail = request.getParameter("user_email");
		String userName = request.getParameter("user_name");
		String userPassword = request.getParameter("user_password");
		String userAbout = request.getParameter("user_about");

		Part part = request.getPart("profile");
		String imageName = part.getSubmittedFileName();
		
//		String imageName = part.getName();
		

		// get user from session

		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentUser");

		user.setEmail(userEmail);
		user.setName(userName);
		user.setAbout(userAbout);
		user.setPassword(userPassword);
		String oldFile = user.getProfile();
		user.setProfile(imageName);

		// update database...
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		boolean ans = dao.updateUser(user);
		if (ans) {

			String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();

			String pathOldFile = request.getRealPath("/") + "pics" + File.separator + oldFile;
			if (!oldFile.equals("default.png")) {
				Helper.deleteFile(pathOldFile);
			}

			if (Helper.saveFile(part.getInputStream(), path)) {
				out.println("Profile updated...");

				Message m = new Message("Profile details updated...", "success", "alert alert-success");
				s.setAttribute("msg", m);

			} else {

				Message m = new Message("Something went wrong", "error", "alert alert-danger");
				s.setAttribute("msg", m);

			}
		} else {
			out.println("Not updated");
			Message m = new Message("Something went wrong", "error", "alert alert-danger");
			s.setAttribute("msg", m);

		}
		response.sendRedirect("profile.jsp");

	}

}
