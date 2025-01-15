package com.hotelmate.servlets;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.hotelmate.SessionUtils;

@WebServlet("/hotel-data-handler")
public class HotelDataServlet extends HttpServlet {
	private static final long serialVersionUID = 2L;

	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/HotelMate?useSSL=false";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "password";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!SessionUtils.isValidSession(request)) {
			response.sendRedirect("login.jsp");
			return;
		}

		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
			List<String> cities = getCities(conn);
			List<Map<String, Object>> hotels = getHotels(conn);
			request.setAttribute("cities", cities);
			request.setAttribute("hotels", hotels);
			request.getRequestDispatcher("/listing.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.sendRedirect("error.jsp");
		}
	}

	private List<String> getCities(Connection conn) throws SQLException {
		String query = "SELECT DISTINCT city FROM hotels";
		try (PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {

			List<String> cities = new ArrayList<>();
			while (rs.next()) {
				cities.add(rs.getString("city"));
			}
			return cities;
		}
	}

	private List<Map<String, Object>> getHotels(Connection conn) throws SQLException {
		String query = "SELECT hotel_id, name, description, city, state, country, price_per_night, images FROM hotels";
		try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {

			List<Map<String, Object>> hotels = new ArrayList<>();
			while (rs.next()) {
				Map<String, Object> hotel = new HashMap<>();
				hotel.put("hotelId", rs.getInt("hotel_id"));
				hotel.put("name", rs.getString("name"));
				hotel.put("description", rs.getString("description"));
				hotel.put("city", rs.getString("city"));
				hotel.put("state", rs.getString("state"));
				hotel.put("country", rs.getString("country"));
				hotel.put("pricePerNight", rs.getDouble("price_per_night"));
				hotel.put("imageUrl", rs.getString("images"));
				hotels.add(hotel);
			}
			return hotels;
		}
	}
}
