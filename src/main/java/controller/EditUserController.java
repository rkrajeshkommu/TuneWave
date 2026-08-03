package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;

import dao.UserDao;
import dao.UserDaoInterface;

@WebServlet("/EditUserController")
public class EditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		UserDaoInterface dao = new UserDao();

		User user = dao.getUserById(id);

		request.setAttribute("user", user);
		request.getRequestDispatcher("/admin/edit-user.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String role = request.getParameter("role");

		User user = new User(id, firstname, lastname, username, email, null, role, null);

		UserDaoInterface dao = new UserDao();

		boolean status = dao.updateUser(user);

		if (status) {
			request.getSession().setAttribute("success", "User updated successfully.");
			response.sendRedirect(request.getContextPath() + "/admin/users.jsp");
		} else {
			request.setAttribute("error", "Unable to update user.");
			request.setAttribute("user", user);
			request.getRequestDispatcher("/admin/edit-user.jsp").forward(request, response);
		}
	}

}
