package controller;

import java.io.IOException;

import dao.UserDao;
import dao.UserDaoInterface;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String REGISTER_PAGE = "pages/register.jsp";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("RegisterController called");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
//		System.out.println("Checking empty fields...");
		if (firstname == null || firstname.trim().isEmpty() 
				|| lastname == null || lastname.trim().isEmpty()
				|| username == null || username.trim().isEmpty() 
				|| email == null || email.trim().isEmpty()
				|| password == null || password.trim().isEmpty() 
				|| confirmPassword == null || confirmPassword.trim().isEmpty()) {

			request.setAttribute("error", "All fields are required.");
			request.getRequestDispatcher(REGISTER_PAGE).forward(request, response);
			return;
		}
		
//		System.out.println("Checking password...");
		if (!password.equals(confirmPassword)) {
		    request.setAttribute("error", "Passwords do not match.");
		    request.getRequestDispatcher(REGISTER_PAGE).forward(request, response);
		    return;
		}
		
		UserDaoInterface dao = new UserDao();
		
//		System.out.println("Checking username...");
		if (dao.isUsernameExists(username)) {
			request.setAttribute("error", "Username already exists.");
			request.getRequestDispatcher(REGISTER_PAGE).forward(request, response);
			return;
		}
		
//		System.out.println("Checking email...");
		if (dao.isEmailExists(email)) {
			request.setAttribute("error", "Email already registered.");
			request.getRequestDispatcher(REGISTER_PAGE).forward(request, response);
			return;
		}
		
		User user = new User(firstname, lastname, username, email, password, "USER");
		boolean status = dao.register(user);
		
//		System.out.println("Registering user...");
		if (status) {  
			HttpSession session = request.getSession();
			session.setAttribute("success","Registration Successful. Please Login.");
			response.sendRedirect("pages/login.jsp");
		} else {
			request.setAttribute("error", "Registration Failed.");
			request.getRequestDispatcher(REGISTER_PAGE).forward(request, response);
		}

	}

}
