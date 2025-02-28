<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Bookings - HotelMate</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

.bookings-container {
	max-width: 1200px;
	margin: 40px auto;
	padding: 30px;
	margin-top: 80px;
}

.bookings-container .booking-card {
	background: white;
	border-radius: 15px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
	margin-bottom: 20px;
}

.bookings-container .booking-card:not(.expired):hover {
	transform: translateY(-5px);
}

.bookings-container .booking-card.expired {
	background: #f8f9fa;
	opacity: 0.7;
}

.bookings-container .booking-card.expired .booking-header {
	background: #e9ecef;
}

.bookings-container .booking-card.expired .booking-amount {
	color: #6c757d;
}

.bookings-container .booking-header {
	background: #f8f9fa;
	padding: 1rem;
	border-radius: 15px 15px 0 0;
	border-bottom: 1px solid #dee2e6;
}

.bookings-container .booking-body {
	padding: 1.5rem;
}

.bookings-container .booking-info {
	display: flex;
	align-items: center;
	margin-bottom: 0.5rem;
	color: #6c757d;
}

.bookings-container .booking-info i {
	margin-right: 0.5rem;
	width: 20px;
}

.bookings-container .booking-amount {
	font-size: 1.25rem;
	color: #198754;
	font-weight: 600;
}

.bookings-container .booking-date {
	font-size: 0.875rem;
	color: #6c757d;
}

.bookings-container .expired-badge {
	background: #dc3545;
	color: white;
	padding: 0.25rem 0.5rem;
	border-radius: 0.25rem;
	font-size: 0.75rem;
	margin-left: 0.5rem;
}

.bookings-container .booking-actions {
	margin-top: 1rem;
	padding-top: 1rem;
	border-top: 1px solid #dee2e6;
}

.bookings-container .no-bookings {
	text-align: center;
	padding: 3rem;
	background: white;
	border-radius: 15px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.bookings-container .no-bookings i {
	font-size: 3rem;
	color: #6c757d;
	margin-bottom: 1rem;
}
</style>

</head>
<body>
	<%@ include file="/Components/navbar.jsp"%>

	<div class="bookings-container">
		<h2 class="text-center mb-4">My Bookings</h2>

		<%
		List<Map<String, Object>> bookings = (List<Map<String, Object>>) request.getAttribute("bookings");
		LocalDate today = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		if (bookings != null && !bookings.isEmpty()) {
			Collections.reverse(bookings);
		%>
		<div class="row">
			<%
			for (Map<String, Object> booking : bookings) {
				LocalDate checkOutDate = LocalDate.parse(booking.get("checkOut").toString(), formatter);
				boolean isExpired = checkOutDate.isBefore(today);
			%>
			<div class="">
				<div class="booking-card <%=isExpired ? "expired" : ""%>">
					<div class="booking-header">
						<div class="d-flex justify-content-between align-items-center">
							<h5 class="mb-0">
								Booking #<%=booking.get("id")%>
								<%
								if (isExpired) {
								%>
								<span class="expired-badge">Expired</span>
								<%
								}
								%>
							</h5>
							<span class="booking-date"> <i class="bi bi-calendar3"></i>
								<%=booking.get("bookingDate")%>
							</span>
						</div>
					</div>
					<div class="booking-body">
						<div class="booking-info">
							<i class="bi bi-building"></i> <a
								href="HotelDetailServlet?hotelId=<%=booking.get("hotelId")%>"
								class="text-decoration-none text-primary"> <span>Hotel
									Details</span> <i class="bi bi-arrow-right-circle ms-1"></i>
							</a>
						</div>
						<div class="booking-info">
							<i class="bi bi-calendar-check"></i> <span>Check-in: <%=booking.get("checkIn")%></span>
						</div>
						<div class="booking-info">
							<i class="bi bi-calendar-x"></i> <span>Check-out: <%=booking.get("checkOut")%></span>
						</div>
						<div class="booking-info">
							<i class="bi bi-people"></i> <span>Guests: <%=booking.get("adults")%>
								Adults, <%=booking.get("children")%> Children
							</span>
						</div>
						<%
						if (booking.get("specialRequests") != null && !booking.get("specialRequests").toString().isEmpty()) {
						%>
						<div class="booking-info">
							<i class="bi bi-chat-left-text"></i> <span><%=booking.get("specialRequests")%></span>
						</div>
						<%
						}
						%>
						<%
						if (booking.get("additionalServices") != null && !booking.get("additionalServices").toString().isEmpty()) {
						%>
						<div class="booking-info">
							<i class="bi bi-chat-left-text"></i> <span><%=booking.get("additionalServices")%></span>
						</div>
						<%
						}
						%>
						<div class="mt-3 pt-3 border-top">
							<div class="booking-amount">
								<i class="bi bi-currency-rupee"></i><%=booking.get("totalAmount")%>
							</div>
						</div>
						<div class="booking-actions">
							<form action="CancelBookingServlet" method="POST"
								onsubmit="return confirm('Are you sure you want to <%=isExpired ? "delete" : "cancel"%> this booking?');">
								<input type="hidden" name="bookingId"
									value="<%=booking.get("id")%>">
								<button type="submit" class="btn btn-danger w-100">
									<i class="bi bi-x-circle"></i>
									<%=isExpired ? "Delete Booking" : "Cancel Booking"%>
								</button>
							</form>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<%
			} else {
			%>
			<div class="no-bookings">
				<i class="bi bi-calendar-x"></i>
				<h4>No Bookings Found</h4>
				<p class="text-muted">You haven't made any bookings yet.</p>
				<a href="HotelDataServlet" class="btn btn-primary"> Find Hotels
				</a>
			</div>
			<%
			}
			%>
		</div>

		<%@ include file="/Components/footer.jsp"%>

		<script
			src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	</div>
</body>
</html>