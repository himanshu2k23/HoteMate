package com.hotelmate.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hotelmate.SessionUtils;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/hotel-booking")
public class HotelBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String hotelId = request.getParameter("hotelId");
		if (!SessionUtils.isValidSession(request)) {
			response.sendRedirect("login.jsp");
			return;
		}
		if (hotelId == null || hotelId.isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Hotel ID is required.");
			return;
		}

		String jdbcURL = "jdbc:mysql://localhost:3306/hotelmate";
		String dbUser = "root";
		String dbPassword = "password";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

			String query = "SELECT * FROM hotels WHERE hotel_id = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, Integer.parseInt(hotelId));
			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				request.setAttribute("name", resultSet.getString("name"));
				request.setAttribute("description", resultSet.getString("description"));
				request.setAttribute("location", resultSet.getString("location"));
				request.setAttribute("city", resultSet.getString("city"));
				request.setAttribute("state", resultSet.getString("state"));
				request.setAttribute("country", resultSet.getString("country"));
				request.setAttribute("pricePerNight", resultSet.getBigDecimal("price_per_night"));
				request.setAttribute("imageUrl", resultSet.getString("images").split(",")[0]);
				request.setAttribute("hotelId", resultSet.getString("hotel_id"));

				RequestDispatcher dispatcher = request.getRequestDispatcher("booking.jsp");
				dispatcher.forward(request, response);
			} else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Hotel not found.");
			}

			resultSet.close();
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
					"An error occurred while fetching hotel details.");
		}
	}
}
