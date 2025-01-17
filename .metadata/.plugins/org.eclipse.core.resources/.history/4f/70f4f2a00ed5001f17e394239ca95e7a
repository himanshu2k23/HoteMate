<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List, java.util.Map"%>
<%@ page import="java.text.SimpleDateFormat, java.sql.Timestamp"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Bookings</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<img src="http://localhost:8080/HotelMate/Images/HotelmateLogo.png"
				alt="HotelMate Logo" width="60" height="45" class="d-inline-block">
			<a class="navbar-brand" href="#">HotelMate Admin</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/logout">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container mt-5">
		<h1 class="text-center mb-4">Manage Bookings</h1>
		<%
		String successMsg = request.getParameter("successMsg");
		String errorMsg = request.getParameter("errorMsg");
		if (successMsg != null) {
		%>
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<%=successMsg%>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<%
		} else if (errorMsg != null) {
		%>
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">
			<%=errorMsg%>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<%
		}
		%>

		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead class="table-dark">
					<tr>
						<th>Booking ID</th>
						<th>Full Name</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Check-in</th>
						<th>Check-out</th>
						<th>Adults</th>
						<th>Children</th>
						<th>Special Requests</th>
						<th>Additional Services</th>
						<th>Total Amount</th>
						<th>Booking Date</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<Map<String, Object>> bookings = (List<Map<String, Object>>) request.getAttribute("bookings");
					if (bookings != null && !bookings.isEmpty()) {
						for (Map<String, Object> booking : bookings) {
					%>
					<tr>
						<td><%=booking.get("booking_id")%></td>
						<td><%=booking.get("first_name") + " " + booking.get("last_name")%></td>
						<td><%=booking.get("email")%></td>
						<td><%=booking.get("phone")%></td>
						<%
						SimpleDateFormat sdf = new SimpleDateFormat("dd MMM, yyyy");
						%>
						<td><%=sdf.format(booking.get("check_in"))%></td>
						<td><%=sdf.format(booking.get("check_out"))%></td>
						<td><%=booking.get("adults")%></td>
						<td><%=booking.get("children")%></td>
						<td><%=booking.get("special_requests")%></td>
						<td><%=booking.get("additional_services")%></td>
						<td><%=booking.get("total_amount")%></td>
						<%
						Timestamp bookingDate = (Timestamp) booking.get("booking_date");
						String formattedDate = sdf.format(bookingDate);
						%>
						<td><%=formattedDate%></td>
						<td>
							<!-- Delete Button -->
							<form action="<%=request.getContextPath()%>/admin/bookings"
								method="post" style="display: inline;">
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="booking_id"
									value="<%=booking.get("booking_id")%>">
								<button type="submit" class="btn btn-danger btn-sm">Delete</button>
							</form> <!-- Modify Button -->
							<button type="button" class="btn btn-warning btn-sm"
								data-bs-toggle="modal" data-bs-target="#editBookingModal"
								data-booking_id="<%=booking.get("booking_id")%>"
								data-first_name="<%=booking.get("first_name")%>"
								data-last_name="<%=booking.get("last_name")%>"
								data-email="<%=booking.get("email")%>"
								data-phone="<%=booking.get("phone")%>">Modify</button>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="13" class="text-center">No bookings found.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>

		<a href="<%=request.getContextPath()%>/admin/dashboard"
			class="btn btn-primary mt-3">Back to Dashboard</a>
	</div>

	<!-- Modal for Editing Booking -->
	<div class="modal fade" id="editBookingModal" tabindex="-1"
		aria-labelledby="editBookingModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editBookingModalLabel">Edit
						Booking</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="<%=request.getContextPath()%>/admin/bookings"
						method="post">
						<input type="hidden" name="action" value="update"> <input
							type="hidden" name="booking_id" id="bookingId">

						<div class="mb-3">
							<label for="firstName" class="form-label">First Name</label> <input
								type="text" class="form-control" id="firstName"
								name="first_name" required>
						</div>

						<div class="mb-3">
							<label for="lastName" class="form-label">Last Name</label> <input
								type="text" class="form-control" id="lastName" name="last_name"
								required>
						</div>

						<div class="mb-3">
							<label for="email" class="form-label">Email</label> <input
								type="email" class="form-control" id="email" name="email"
								required>
						</div>

						<div class="mb-3">
							<label for="phone" class="form-label">Phone</label> <input
								type="text" class="form-control" id="phone" name="phone"
								required>
						</div>

						<button type="submit" class="btn btn-primary">Save
							Changes</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<footer class="bg-dark text-white text-center py-3 mt-5">
		<p>© HotelMate 2025 - All rights reserved</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		// Modal data population script
		var editBookingModal = document.getElementById('editBookingModal');
		editBookingModal.addEventListener('show.bs.modal', function(event) {
			// Extract data from the clicked button
			var button = event.relatedTarget;
			var bookingId = button.getAttribute('data-booking_id');
			var firstName = button.getAttribute('data-first_name');
			var lastName = button.getAttribute('data-last_name');
			var email = button.getAttribute('data-email');
			var phone = button.getAttribute('data-phone');

			// Update modal fields with data
			document.getElementById('bookingId').value = bookingId;
			document.getElementById('firstName').value = firstName;
			document.getElementById('lastName').value = lastName;
			document.getElementById('email').value = email;
			document.getElementById('phone').value = phone;
		});
	</script>
</body>
</html>
