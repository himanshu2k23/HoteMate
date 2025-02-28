package com.hotelmate.admin.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/bookings")
public class BookingManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/HotelMate?useSSL=false";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "password";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
			String query = "SELECT * FROM bookings";
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();

			List<Map<String, Object>> bookings = new ArrayList<>();
			while (resultSet.next()) {
				Map<String, Object> booking = new HashMap<>();
				booking.put("booking_id", resultSet.getInt("booking_id"));
				booking.put("check_in", resultSet.getDate("check_in"));
				booking.put("check_out", resultSet.getDate("check_out"));
				booking.put("adults", resultSet.getInt("adults"));
				booking.put("children", resultSet.getInt("children"));
				booking.put("first_name", resultSet.getString("first_name"));
				booking.put("last_name", resultSet.getString("last_name"));
				booking.put("email", resultSet.getString("email"));
				booking.put("phone", resultSet.getString("phone"));
				booking.put("special_requests", resultSet.getString("special_requests"));
				booking.put("hotel_id", resultSet.getInt("hotel_id"));
				booking.put("additional_services", resultSet.getString("additional_services"));
				booking.put("total_amount", resultSet.getBigDecimal("total_amount"));
				booking.put("user_email", resultSet.getString("user_email"));
				booking.put("booking_date", resultSet.getTimestamp("booking_date"));
				bookings.add(booking);
			}
			request.setAttribute("bookings", bookings);

		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/admin/bookings.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String redirectUrl = request.getContextPath() + "/admin/bookings";

		try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
			if ("delete".equalsIgnoreCase(action)) {
				int bookingId = Integer.parseInt(request.getParameter("booking_id"));
				deleteBooking(connection, bookingId);
				response.sendRedirect(redirectUrl + "?successMsg=Booking deleted successfully.");
			} else if ("update".equalsIgnoreCase(action)) {
				int bookingId = Integer.parseInt(request.getParameter("booking_id"));
				String firstName = request.getParameter("first_name");
				String lastName = request.getParameter("last_name");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String checkIn = request.getParameter("check_in");
				String checkOut = request.getParameter("check_out");
				int adults = Integer.parseInt(request.getParameter("adults"));
				int children = Integer.parseInt(request.getParameter("children"));
				String specialRequests = request.getParameter("special_requests");
				String additionalServices = request.getParameter("additional_services");
				double totalAmount = Double.parseDouble(request.getParameter("total_amount"));

				updateBooking(connection, bookingId, firstName, lastName, email, phone, checkIn, checkOut, adults,
						children, specialRequests, additionalServices, totalAmount);
				response.sendRedirect(redirectUrl + "?successMsg=Booking updated successfully.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(redirectUrl + "?errorMsg=Error processing request: " + e.getMessage());
		}
	}

	private void deleteBooking(Connection connection, int bookingId) throws Exception {
		String query = "DELETE FROM bookings WHERE booking_id = ?";
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setInt(1, bookingId);
			statement.executeUpdate();
		}
	}

	private void updateBooking(Connection connection, int bookingId, String firstName, String lastName, String email,
			String phone, String checkIn, String checkOut, int adults, int children, String specialRequests,
			String additionalServices, double totalAmount) throws Exception {

		String query = "UPDATE bookings SET first_name = ?, last_name = ?, email = ?, phone = ?, "
				+ "check_in = ?, check_out = ?, adults = ?, children = ?, special_requests = ?, "
				+ "additional_services = ?, total_amount = ? WHERE booking_id = ?";

		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, firstName);
			statement.setString(2, lastName);
			statement.setString(3, email);
			statement.setString(4, phone);
			statement.setDate(5, java.sql.Date.valueOf(checkIn));
			statement.setDate(6, java.sql.Date.valueOf(checkOut));
			statement.setInt(7, adults);
			statement.setInt(8, children);
			statement.setString(9, specialRequests);
			statement.setString(10, additionalServices);
			statement.setDouble(11, totalAmount);
			statement.setInt(12, bookingId);
			statement.executeUpdate();
		}
	}
}
