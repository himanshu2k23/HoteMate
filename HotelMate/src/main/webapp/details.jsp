<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hotel - HotelMate</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
:root {
	--primary-dark: #343a40;
	--primary-green: #198754;
	--secondary-green: #507555;
	--light-green: #e8f5e9;
	--accent-green: #75a17c;
	--hover-green: #1a4121;
}

body {
	background-color: #f8f9fa;
}

.hotel-details-container {
	margin-top: 115px;
	margin-bottom: 4rem;
	background-color: #ffffff;
	border-radius: 1rem;
	box-shadow: 0 0.5rem 1rem rgba(44, 85, 48, 0.08);
	padding: 2rem;
}

.hotel-title {
	color: var(--primary-dark);
	font-weight: 700;
	font-size: 2.5rem;
	margin-bottom: 1rem;
}

.hotel-description {
	color: #495057;
	font-size: 1.1rem;
	line-height: 1.6;
	margin-bottom: 2rem;
}

.carousel {
	border-radius: 1rem;
	overflow: hidden;
	box-shadow: 0 0.5rem 1rem rgba(44, 85, 48, 0.1);
	margin-bottom: 2rem;
}

.carousel-item img {
	height: 600px;
	object-fit: cover;
}

.price {
	font-size: 2rem;
	font-weight: 700;
	color: var(--primary-green);
	margin-bottom: 1rem;
}

.rating {
	font-size: 1.25rem;
	color: #ffc1;
	margin-bottom: 1.5rem;
	display: flex;
	align-items: center;
	gap: 0.5rem;
}

.rating i {
	color: #ffc1;
}

.amenities-list {
	display: flex;
	flex-wrap: wrap;
	gap: 0.75rem;
	margin-bottom: 2rem;
}

.amenities-items {
	background-color: var(--light-green);
	color: var(--primary-green);
	padding: 0.5rem 1rem;
	border-radius: 9999px;
	font-size: 0.875rem;
	font-weight: 500;
	transition: all 0.2s;
}

.amenities-items:hover {
	background-color: var(--accent-green);
	color: white;
	transform: translateY(-1px);
}

.contact-info {
	background-color: var(--light-green);
	padding: 1.5rem;
	border-radius: 0.75rem;
	margin-bottom: 2rem;
}

.contact-info i {
	color: var(--primary-green);
}

.book-button {
	width: 100%;
	padding: 1rem;
	font-size: 1.125rem;
	font-weight: 600;
	transition: all 0.2s;
	background-color: var(--primary-green) !important;
	border-color: var(--primary-green) !important;
}

.book-button:hover {
	background-color: var(--hover-green) !important;
	transform: translateY(-2px);
	box-shadow: 0 0.5rem 1rem rgba(44, 85, 48, 0.2);
}

.back-button {
	width: 100%;
	padding: 0.75rem;
	font-weight: 500;
	color: var(--primary-green);
	border-color: var(--primary-green);
}

.back-button:hover {
	background-color: var(--primary-green);
	color: white;
}

.location-info {
	display: flex;
	align-items: center;
	gap: 0.5rem;
	color: var(--primary-dark);
	margin-bottom: 1.5rem;
}

.location-info i {
	color: var(--primary-green);
	font-size: 1.25rem;
}

.section-title {
	color: var(--primary-dark);
	font-weight: 600;
	margin-bottom: 1rem;
	padding-bottom: 0.5rem;
	border-bottom: 2px solid var(--light-green);
}

.booking-card {
	background-color: white;
	border: 1px solid var(--light-green);
	border-radius: 1rem;
	padding: 1.5rem;
}

.price-label {
	color: var(--secondary-green);
	font-size: 0.875rem;
}
</style>
</head>
<body>
	<!-- Navbar -->
	<%@ include file="/Components/navbar.jsp"%>

	<%
	// Retrieve hotel data from request attribute
	Map<String, Object> hotelDetails = (Map<String, Object>) request.getAttribute("hotelDetails");

	// Extract values from the hotelDetails map
	String name = (String) hotelDetails.get("name");
	String description = (String) hotelDetails.get("description");
	String location = (String) hotelDetails.get("location");
	String city = (String) hotelDetails.get("city");
	String state = (String) hotelDetails.get("state");
	String country = (String) hotelDetails.get("country");
	String zipCode = (String) hotelDetails.get("zipCode");
	double pricePerNight = (double) hotelDetails.get("pricePerNight");
	float rating = (float) hotelDetails.get("rating");
	String amenities = (String) hotelDetails.get("amenities");
	String contactEmail = (String) hotelDetails.get("contactEmail");
	String contactPhone = (String) hotelDetails.get("contactPhone");
	String images = (String) hotelDetails.get("imageUrl");
	String[] imageUrls = images.split(",");
	%>

	<div class="container hotel-details-container">
		<div class="row">
			<div class="col-lg-8">
				<h1 class="hotel-title"><%=name%></h1>
				<p class="hotel-description"><%=description%></p>

				<!-- Carousel -->
				<div id="hotelCarousel" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<%
						for (int i = 0; i < imageUrls.length; i++) {
						%>
						<div class="carousel-item <%=(i == 0) ? "active" : ""%>">
							<img src="<%=imageUrls[i].trim()%>" class="d-block w-100"
								alt="Hotel Image">
						</div>
						<%
						}
						%>
					</div>
					<%
					if (imageUrls.length > 1) {
					%>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#hotelCarousel" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#hotelCarousel" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
					<%
					}
					%>
				</div>

				<!-- Amenities -->
				<h3 class="section-title">Amenities</h3>
				<div class="amenities-list">
					<%
					String[] amenitiesList = amenities.split(",");
					for (String amenity : amenitiesList) {
						amenity = amenity.trim();
					%>
					<span class="amenities-items"> <%=amenity%>
					</span>
					<%
					}
					%>
				</div>

				<!-- Location -->
				<div class="location-info">
					<i class="bi bi-geo-alt-fill"></i> <span> <%=location%>, <%=city%>,
						<%=state%>, <%=country%> - <%=zipCode%>
					</span>
				</div>

				<!-- Contact Information -->
				<div class="contact-info">
					<h4 class="section-title">Contact Information</h4>
					<div class="d-flex align-items-center mb-3">
						<i class="bi bi-envelope-fill me-2"></i> <span><strong>Email:</strong>
							<%=contactEmail%></span>
					</div>
					<div class="d-flex align-items-center">
						<i class="bi bi-telephone-fill me-2"></i> <span><strong>Phone:</strong>
							<%=contactPhone%></span>
					</div>
				</div>
			</div>

			<!-- Booking Section -->
			<div class="col-lg-4">
				<div class="position-sticky" style="top: 2rem;">
					<div class="booking-card shadow-sm">
						<div class="rating">
							<i class="bi bi-star-fill"></i> <span><%=rating%> / 5.0</span>
						</div>
						<div class="price">
							₹<%=String.format("%,.0f", pricePerNight)%></div>
						<p class="price-label mb-4">per night</p>
						<a href="" class="btn btn-primary book-button mb-3"> Book Now
						</a> <a href="HotelDataServlet"
							class="btn btn-outline-secondary back-button"> Back to
							Listings </a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/Components/footer.jsp"%>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
