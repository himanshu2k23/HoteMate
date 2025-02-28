<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List, java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Hotels</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
.table-responsive-container {
	max-width: 100%;
	overflow-x: auto;
	margin-bottom: 1rem;
	padding-bottom: 0.5rem;
}

.table-responsive-container::-webkit-scrollbar {
	height: 8px;
}

.table-responsive-container::-webkit-scrollbar-track {
	background: #f1f1f1;
	border-radius: 4px;
}

.table-responsive-container::-webkit-scrollbar-thumb {
	background: #888;
	border-radius: 4px;
}

.table-responsive-container::-webkit-scrollbar-thumb:hover {
	background: #555;
}

.table th, .table td {
	white-space: nowrap;
	min-width: 100px;
}

.table th:first-child, .table td:first-child {
	max-width: 30px;
}

.table th:nth-child(2), .table td:nth-child(2) {
	min-width: 150px;
}

.table th:nth-child(3), .table td:nth-child(3) {
	max-width: 230px;
	overflow: auto;
}

.table th:nth-child(3), .table td:nth-child(14) {
	max-width: 230px;
	overflow: auto;
}

.table th:nth-child(3), .table td:nth-child(15) {
	max-width: 30px;
	overflow: auto;
}
</style>
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
	<div class="container my-4">

		<h1 class="text-center mb-4">Hotel Management</h1>

		<%
		String successMsg = request.getParameter("successMsg");
		String errorMsg = request.getParameter("errorMsg");
		if (successMsg != null) {
		%>
		<div class="alert alert-success"><%=successMsg%></div>
		<%
		}
		if (errorMsg != null) {
		%>
		<div class="alert alert-danger"><%=errorMsg%></div>
		<%
		}
		%>

		<div class="mb-3 text-end">
			<button class="btn btn-success" data-bs-toggle="modal"
				data-bs-target="#addUpdateModal" onclick="clearModal()">Add
				New Hotel</button>
		</div>
		<div class="table-responsive-container">
			<table class="table table-bordered table-hover">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Description</th>
						<th>Location</th>
						<th>City</th>
						<th>State</th>
						<th>Country</th>
						<th>Zip Code</th>
						<th>Price/Night</th>
						<th>Rating</th>
						<th>Amenities</th>
						<th>Contact Email</th>
						<th>Contact Phone</th>
						<th>Images</th>
						<th>Available Rooms</th>
						<th>Created At</th>
						<th>Updated At</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<Map<String, Object>> hotels = (List<Map<String, Object>>) request.getAttribute("hotels");
					if (hotels != null) {
						for (Map<String, Object> hotel : hotels) {
					%>
					<tr>
						<td><%=hotel.get("hotel_id")%></td>
						<td><%=hotel.get("name")%></td>
						<td><%=hotel.get("description")%></td>
						<td><%=hotel.get("location")%></td>
						<td><%=hotel.get("city")%></td>
						<td><%=hotel.get("state")%></td>
						<td><%=hotel.get("country")%></td>
						<td><%=hotel.get("zip_code")%></td>
						<td><%=hotel.get("price_per_night")%></td>
						<td><%=hotel.get("rating")%></td>
						<td><%=hotel.get("amenities")%></td>
						<td><%=hotel.get("contact_email")%></td>
						<td><%=hotel.get("contact_phone")%></td>
						<td><%=hotel.get("images")%></td>
						<td><%=hotel.get("available_rooms")%></td>
						<td><%=hotel.get("created_at")%></td>
						<td><%=hotel.get("updated_at")%></td>
						<td>
							<button class="btn btn-primary btn-sm" data-bs-toggle="modal"
								data-bs-target="#addUpdateModal"
								onclick="populateModal(<%=hotel.get("hotel_id")%>, '<%=hotel.get("name")%>', 
                            '<%=hotel.get("description")%>', '<%=hotel.get("location")%>', '<%=hotel.get("city")%>', 
                            '<%=hotel.get("state")%>', '<%=hotel.get("country")%>', '<%=hotel.get("zip_code")%>', 
                            '<%=hotel.get("price_per_night")%>', '<%=hotel.get("rating")%>', '<%=hotel.get("amenities")%>', 
                            '<%=hotel.get("contact_email")%>', '<%=hotel.get("contact_phone")%>', '<%=hotel.get("images")%>', 
                            '<%=hotel.get("available_rooms")%>')">Update</button>
							<form action="/HotelMate/admin/hotels" method="post"
								class="d-inline">
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="id" value="<%=hotel.get("hotel_id")%>">
								<button type="submit" class="btn btn-danger btn-sm"
									onclick="return confirm('Are you sure you want to delete this hotel?')">Delete</button>
							</form>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="18" class="text-center">No hotels found</td>
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
	<footer class="bg-dark text-white text-center py-3 mt-5">
		<p>© HotelMate 2025 - All rights reserved</p>
	</footer>

	<div class="modal fade" id="addUpdateModal" tabindex="-1"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form action="/HotelMate/admin/hotels" method="post">
					<input type="hidden" name="action" id="modal-action" value="add">
					<input type="hidden" name="hotel_id" id="modal-hotel-id">
					<div class="modal-header">
						<h5 class="modal-title" id="modalLabel">Add / Update Hotel</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="modal-hotel-name" class="form-label">Name</label> <input
									type="text" class="form-control" id="modal-hotel-name"
									name="name" required>
							</div>
							<div class="col-md-6 mb-3">
								<label for="modal-hotel-description" class="form-label">Description</label>
								<textarea class="form-control" id="modal-hotel-description"
									name="description" required></textarea>
							</div>
							<div class="col-md-6 mb-3">
								<label for="modal-hotel-location" class="form-label">Location</label>
								<input type="text" class="form-control"
									id="modal-hotel-location" name="location" required>
							</div>
							<div class="col-md-6 mb-3">
								<label for="modal-hotel-city" class="form-label">City</label> <input
									type="text" class="form-control" id="modal-hotel-city"
									name="city" required>
							</div>
							<div class="col-md-6 mb-3">
								<label for="modal-hotel-state" class="form-label">State</label>
								<input type="text" class="form-control" id="modal-hotel-state"
									name="state" required>
							</div>
							<div class="col-md-6 mb-3">
								<label for="modal-hotel-country" class="form-label">Country</label>
								<input type="text" class="form-control" id="modal-hotel-country"
									name="country" required>
							</div>
							<div class="col-md-6 mb-3">
								<label for="modal-hotel-zip" class="form-label">Zip Code</label>
								<input type="text" class="form-control" id="modal-hotel-zip"
									name="zip_code" required>
							</div>
							<div class="col-md-6 mb-3">
								<label for="modal-hotel-price" class="form-label">Price/Night</label>
								<input type="number" step="0.01" class="form-control"
									id="modal-hotel-price" name="price_per_night" required>
							</div>
							<div class="col-md-6 mb-3">
								<label for="modal-hotel-rating" class="form-label">Rating</label>
								<input type="number" step="0.1" class="form-control"
									id="modal-hotel-rating" name="rating" required>
							</div>
							<div class="col-md-6 mb-3">
								<label for="modal-hotel-amenities" class="form-label">Amenities</label>
								<textarea class="form-control" id="modal-hotel-amenities"
									name="amenities" required></textarea>
							</div>
							<div class="col-md-6 mb-3">
								<label for="modal-hotel-email" class="form-label">Contact
									Email</label> <input type="email" class="form-control"
									id="modal-hotel-email" name="contact_email" required>
							</div>
							<div class="col-md-6 mb-3">
								<label for="modal-hotel-phone" class="form-label">Contact
									Phone</label> <input type="text" class="form-control"
									id="modal-hotel-phone" name="contact_phone" required>
							</div>
							<div class="col-md-6 mb-3">
								<label for="modal-hotel-images" class="form-label">Images</label>
								<textarea class="form-control" id="modal-hotel-images"
									name="images" required></textarea>
							</div>
							<div class="col-md-6 mb-3">
								<label for="modal-hotel-rooms" class="form-label">Available
									Rooms</label> <input type="number" class="form-control"
									id="modal-hotel-rooms" name="available_rooms" required>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	
	function clearModal() {
	    document.getElementById('modal-action').value = 'add';
	    document.getElementById('modal-hotel-id').value = '';
	    document.getElementById('modal-hotel-name').value = '';
	    document.getElementById('modal-hotel-description').value = '';
	    document.getElementById('modal-hotel-location').value = '';
	    document.getElementById('modal-hotel-city').value = '';
	    document.getElementById('modal-hotel-state').value = '';
	    document.getElementById('modal-hotel-country').value = '';
	    document.getElementById('modal-hotel-zip').value = '';
	    document.getElementById('modal-hotel-price').value = '';
	    document.getElementById('modal-hotel-rating').value = '';
	    document.getElementById('modal-hotel-amenities').value = '';
	    document.getElementById('modal-hotel-email').value = '';
	    document.getElementById('modal-hotel-phone').value = '';
	    document.getElementById('modal-hotel-images').value = '';
	    document.getElementById('modal-hotel-rooms').value = '';
	}

	function populateModal(id, name, description, location, city, state, country, zip, price, rating, amenities, email, phone, images, rooms) {
	    document.getElementById('modal-action').value = 'update';
	    document.getElementById('modal-hotel-id').value = id;
	    document.getElementById('modal-hotel-name').value = name;
	    document.getElementById('modal-hotel-description').value = description;
	    document.getElementById('modal-hotel-location').value = location;
	    document.getElementById('modal-hotel-city').value = city;
	    document.getElementById('modal-hotel-state').value = state;
	    document.getElementById('modal-hotel-country').value = country;
	    document.getElementById('modal-hotel-zip').value = zip;
	    document.getElementById('modal-hotel-price').value = price;
	    document.getElementById('modal-hotel-rating').value = rating;
	    document.getElementById('modal-hotel-amenities').value = amenities;
	    document.getElementById('modal-hotel-email').value = email;
	    document.getElementById('modal-hotel-phone').value = phone;
	    document.getElementById('modal-hotel-images').value = images;
	    document.getElementById('modal-hotel-rooms').value = rooms;
	}

</script>
</body>
</html>

