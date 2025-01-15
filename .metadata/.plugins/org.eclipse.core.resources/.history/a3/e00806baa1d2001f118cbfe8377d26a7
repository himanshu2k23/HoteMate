package com.hotelmate.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login-handler")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		String jdbcURL = "jdbc:mysql://localhost:3306/hotelmate";
		String dbUser = "root";
		String dbPassword = "password";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

			String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, email);
			statement.setString(2, password);

			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				// If login is successful, inject JavaScript to set localStorage and redirect
				response.setContentType("text/html");
				response.getWriter().println("<script>");
				response.getWriter().println("localStorage.setItem('HasLoggedIn', 'true');");
				response.getWriter().println("window.location.href = 'HotelDataServlet';");
				response.getWriter().println("</script>");
			} else {
				request.setAttribute("errorMessage", "Incorrect username or password");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}

			resultSet.close();
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "An error occurred. Please try again later.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}
