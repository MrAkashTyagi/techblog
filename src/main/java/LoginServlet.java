

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entities.Message;
import entities.User;
import helper.ConnectionProvider;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//login
		//fetch username and password
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");
				
		
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		User u = userDao.getUserEmailAndPassword(userEmail, userPassword);
		System.out.println(u);
		if(u == null) {
			//login....
			//error						
			/* out.println("<h1>Invalid credentials..please try again!!</h1>"); */
			
			Message m = new Message("Invalid user please try again","error","alert alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg", m);
			response.sendRedirect("login.jsp");
		
			
		}else {			
			//login..
			//success..
			HttpSession  s = request.getSession();
			System.out.println("Session :"+s);
			s.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");
			
		}
		
		
	}

}
