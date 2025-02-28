package com.hotelmate.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.hotelmate.SessionUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CancelBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/HotelMate?useSSL=false";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "password";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!SessionUtils.isValidSession(request)) {
			response.sendRedirect("login.jsp");
			return;
		}
		String bookingIdParam = request.getParameter("bookingId");

		if (bookingIdParam == null || bookingIdParam.isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Booking ID is required.");
			return;
		}

		try {
			int bookingId = Integer.parseInt(bookingIdParam);

			try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
				String sql = "DELETE FROM bookings WHERE booking_id = ?";
				try (PreparedStatement stmt = conn.prepareStatement(sql)) {
					stmt.setInt(1, bookingId);
					int rowsAffected = stmt.executeUpdate();

					if (rowsAffected > 0) {
						response.sendRedirect("BookingDataServlet");
						request.getSession().setAttribute("SessionSuccessMessage", "You hotel reservation has been cancelled successfuly! ");
					} else {
						response.sendError(HttpServletResponse.SC_NOT_FOUND, "Booking not found.");
					}
				}
			}
		} catch (NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid booking ID format.");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
					"An error occurred while cancelling the booking.");
		}
	}
}
