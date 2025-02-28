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

@WebServlet("/admin/hotels")
public class HotelManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/HotelMate?useSSL=false";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "password";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
			String query = "SELECT * FROM hotels";
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();

			List<Map<String, Object>> hotels = new ArrayList<>();
			while (resultSet.next()) {
				Map<String, Object> hotel = new HashMap<>();
				hotel.put("hotel_id", resultSet.getInt("hotel_id"));
				hotel.put("name", resultSet.getString("name"));
				hotel.put("description", resultSet.getString("description"));
				hotel.put("location", resultSet.getString("location"));
				hotel.put("city", resultSet.getString("city"));
				hotel.put("state", resultSet.getString("state"));
				hotel.put("country", resultSet.getString("country"));
				hotel.put("zip_code", resultSet.getString("zip_code"));
				hotel.put("price_per_night", resultSet.getBigDecimal("price_per_night"));
				hotel.put("rating", resultSet.getFloat("rating"));
				hotel.put("amenities", resultSet.getString("amenities"));
				hotel.put("contact_email", resultSet.getString("contact_email"));
				hotel.put("contact_phone", resultSet.getString("contact_phone"));
				hotel.put("images", resultSet.getString("images"));
				hotel.put("available_rooms", resultSet.getInt("available_rooms"));
				hotel.put("created_at", resultSet.getTimestamp("created_at"));
				hotel.put("updated_at", resultSet.getTimestamp("updated_at"));
				hotels.add(hotel);
			}
			request.setAttribute("hotels", hotels);

		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/admin/hotels.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String action = request.getParameter("action");
	    String redirectUrl = "/HotelMate/admin/hotels";

	    try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
	        if ("delete".equalsIgnoreCase(action)) {
	            int hotelId = Integer.parseInt(request.getParameter("id"));
	            deleteHotel(connection, hotelId);
	            response.sendRedirect(redirectUrl + "?successMsg=Hotel deleted successfully.");
	        } else if ("update".equalsIgnoreCase(action)) {
	            int hotelId = Integer.parseInt(request.getParameter("hotel_id"));
	            String name = request.getParameter("name");
	            String description = request.getParameter("description");
	            String location = request.getParameter("location");
	            String city = request.getParameter("city");
	            String state = request.getParameter("state");
	            String country = request.getParameter("country");
	            String zipCode = request.getParameter("zip_code");
	            String pricePerNight = request.getParameter("price_per_night");
	            String rating = request.getParameter("rating");
	            String amenities = request.getParameter("amenities");
	            String contactEmail = request.getParameter("contact_email");
	            String contactPhone = request.getParameter("contact_phone");
	            String images = request.getParameter("images");
	            int availableRooms = Integer.parseInt(request.getParameter("available_rooms"));
	            updateHotel(connection, hotelId, name, description, location, city, state, country, zipCode,
	                    pricePerNight, rating, amenities, contactEmail, contactPhone, images, availableRooms);
	            response.sendRedirect(redirectUrl + "?successMsg=Hotel updated successfully.");
	        } else if ("add".equalsIgnoreCase(action)) {
	            String name = request.getParameter("name");
	            String description = request.getParameter("description");
	            String location = request.getParameter("location");
	            String city = request.getParameter("city");
	            String state = request.getParameter("state");
	            String country = request.getParameter("country");
	            String zipCode = request.getParameter("zip_code");
	            String pricePerNight = request.getParameter("price_per_night");
	            String rating = request.getParameter("rating");
	            String amenities = request.getParameter("amenities");
	            String contactEmail = request.getParameter("contact_email");
	            String contactPhone = request.getParameter("contact_phone");
	            String images = request.getParameter("images");
	            int availableRooms = Integer.parseInt(request.getParameter("available_rooms"));
	            addHotel(connection, name, description, location, city, state, country, zipCode,
	                    pricePerNight, rating, amenities, contactEmail, contactPhone, images, availableRooms);
	            response.sendRedirect(redirectUrl + "?successMsg=Hotel added successfully.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.sendRedirect(redirectUrl + "?errorMsg=Error processing request.");
	    }
	}

	private void addHotel(Connection connection, String name, String description, String location, String city,
			String state, String country, String zipCode, String pricePerNight, String rating, String amenities,
			String contactEmail, String contactPhone, String images, int availableRooms) throws Exception {
		String query = "INSERT INTO hotels (name, description, location, city, state, country, zip_code, "
				+ "price_per_night, rating, amenities, contact_email, contact_phone, images, available_rooms, "
				+ "created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())";
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, name);
			statement.setString(2, description);
			statement.setString(3, location);
			statement.setString(4, city);
			statement.setString(5, state);
			statement.setString(6, country);
			statement.setString(7, zipCode);
			statement.setBigDecimal(8, new java.math.BigDecimal(pricePerNight));
			statement.setFloat(9, Float.parseFloat(rating));
			statement.setString(10, amenities);
			statement.setString(11, contactEmail);
			statement.setString(12, contactPhone);
			statement.setString(13, images);
			statement.setInt(14, availableRooms);
			statement.executeUpdate();
		}
	}

	private void deleteHotel(Connection connection, int hotelId) throws Exception {
		String query = "DELETE FROM hotels WHERE hotel_id = ?";
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setInt(1, hotelId);
			statement.executeUpdate();
		}
	}

	private void updateHotel(Connection connection, int hotelId, String name, String description, String location,
			String city, String state, String country, String zipCode, String pricePerNight, String rating,
			String amenities, String contactEmail, String contactPhone, String images, int availableRooms)
			throws Exception {
		String query = "UPDATE hotels SET name = ?, description = ?, location = ?, city = ?, state = ?, country = ?, "
				+ "zip_code = ?, price_per_night = ?, rating = ?, amenities = ?, contact_email = ?, contact_phone = ?, "
				+ "images = ?, available_rooms = ?, updated_at = NOW() WHERE hotel_id = ?";
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, name);
			statement.setString(2, description);
			statement.setString(3, location);
			statement.setString(4, city);
			statement.setString(5, state);
			statement.setString(6, country);
			statement.setString(7, zipCode);
			statement.setBigDecimal(8, new java.math.BigDecimal(pricePerNight));
			statement.setFloat(9, Float.parseFloat(rating));
			statement.setString(10, amenities);
			statement.setString(11, contactEmail);
			statement.setString(12, contactPhone);
			statement.setString(13, images);
			statement.setInt(14, availableRooms);
			statement.setInt(15, hotelId);
			statement.executeUpdate();
		}
	}
}
