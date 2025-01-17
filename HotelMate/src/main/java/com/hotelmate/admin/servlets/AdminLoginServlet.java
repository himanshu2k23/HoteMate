package com.hotelmate.admin.servlets;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/admin/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (validateAdmin(username, password)) {
			HttpSession session = request.getSession();
			session.setAttribute("adminUser", username);
			response.sendRedirect(request.getContextPath() + "/admin/dashboard");
		} else {
			request.setAttribute("error", "Invalid credentials");
			request.getRequestDispatcher("/WEB-INF/admin/login.jsp").forward(request, response);
		}
	}
	private boolean validateAdmin(String username, String password) {
		return "Admin".equals(username) && "Password@123.".equals(password);
	}
}