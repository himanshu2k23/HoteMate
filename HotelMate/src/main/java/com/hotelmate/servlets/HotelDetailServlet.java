package com.hotelmate.servlets;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HotelDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/HotelMate?useSSL=false";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "password";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String hotelIdParam = request.getParameter("hotelId");

		if (hotelIdParam == null || hotelIdParam.isEmpty()) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			request.setAttribute("errorMessage", "Missing or invalid hotel ID.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			return;
		}

		try {
			int hotelId = Integer.parseInt(hotelIdParam);

			try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
				Map<String, Object> hotelDetails = getHotelDetails(conn, hotelId);

				if (hotelDetails.isEmpty()) {
					response.setStatus(HttpServletResponse.SC_NOT_FOUND);
					request.setAttribute("errorMessage", "Hotel not found.");
					request.getRequestDispatcher("/error.jsp").forward(request, response);
				} else {
					request.setAttribute("hotelDetails", hotelDetails);
					request.getRequestDispatcher("/details.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				request.setAttribute("errorMessage", "A database error occurred.");
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
		} catch (NumberFormatException e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			request.setAttribute("errorMessage", "Invalid hotel ID format.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	private Map<String, Object> getHotelDetails(Connection conn, int hotelId) throws SQLException {
		String query = "SELECT hotel_id, name, description, location, city, state, country, zip_code, price_per_night, rating, amenities, contact_email, contact_phone, images, available_rooms "
				+ "FROM hotels WHERE hotel_id = ?";

		try (PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setInt(1, hotelId);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					Map<String, Object> hotel = new HashMap<>();
					hotel.put("hotelId", rs.getInt("hotel_id"));
					hotel.put("name", rs.getString("name"));
					hotel.put("description", rs.getString("description"));
					hotel.put("location", rs.getString("location"));
					hotel.put("city", rs.getString("city"));
					hotel.put("state", rs.getString("state"));
					hotel.put("country", rs.getString("country"));
					hotel.put("zipCode", rs.getString("zip_code"));
					hotel.put("pricePerNight", rs.getDouble("price_per_night"));
					hotel.put("rating", rs.getFloat("rating"));
					hotel.put("amenities", rs.getString("amenities"));
					hotel.put("contactEmail", rs.getString("contact_email"));
					hotel.put("contactPhone", rs.getString("contact_phone"));
					hotel.put("imageUrl", rs.getString("images"));
					hotel.put("availableRooms", rs.getInt("available_rooms"));
					return hotel;
				}
			}
		}
		return Collections.emptyMap(); // Return an empty map if no data found
	}

}
