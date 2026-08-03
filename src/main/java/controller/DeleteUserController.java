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

@WebServlet("/DeleteUserController")
public class DeleteUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
        
		User loggedInUser = (User) request.getSession().getAttribute("user");

		if (loggedInUser.getId() == id) {
			request.getSession().setAttribute("error", "You cannot delete your own account.");
			response.sendRedirect(request.getContextPath() + "/admin/users.jsp");
			return;
		}

		 UserDaoInterface dao = new UserDao();
		 
        boolean status = dao.deleteUser(id);

		if (status) {
			request.getSession().setAttribute("success", "User deleted successfully.");

		} else {
			request.getSession().setAttribute("error", "Unable to delete user.");
		}

		response.sendRedirect(request.getContextPath() + "/admin/users.jsp");
	}

}
