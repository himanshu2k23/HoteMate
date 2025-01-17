package com.hotelmate.admin.servlets;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/HotelMate?useSSL=false";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "password";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminUser") != null) {
			try {
				request.setAttribute("totalUsers", getTotalRows("users"));
				request.setAttribute("totalBookings", getTotalRows("bookings"));
				request.setAttribute("totalHotels", getTotalRows("hotels"));

				request.getRequestDispatcher("/WEB-INF/admin/dashboard.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching data");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/login");
		}
	}

	private int getTotalRows(String tableName) throws Exception {
		int count = 0;
		try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
				PreparedStatement statement = connection.prepareStatement("SELECT COUNT(*) FROM " + tableName);
				ResultSet resultSet = statement.executeQuery()) {

			if (resultSet.next()) {
				count = resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Error fetching data for table: " + tableName, e);
		}
		return count;
	}
}
