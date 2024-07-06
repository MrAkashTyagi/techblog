
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import helper.ConnectionProvider;

import dao.UserDao;
import entities.User;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String checked = request.getParameter("checked");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		if (checked == null) {

			out.println("box not checked");

		} else {

			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");
			

			// create user object and set all data into that object

			User user = new User(name, email, password, gender, about);

			// user dao object creation

			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			if (userDao.saveUser(user)) {

//				save..
				out.println("done");
			} else {
				out.println("error");
			}
		}

	}

}
