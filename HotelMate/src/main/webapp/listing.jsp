<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Listings - HotelMate</title>
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

.filters {
	background: white;
	padding: 1.5rem;
	border-radius: 0.5rem;
	box-shadow: 0 1px 2px 0 rgb(0 0 0/ 0.05);
	margin-bottom: 1.5rem;
}

.filters h4 {
	color: #343a40;
	font-size: 1.25rem;
	margin-bottom: 1rem;
	font-weight: 600;
}

.form-check {
	margin-bottom: 0.5rem;
}

.form-check-label {
	color: #507555;
	font-size: 0.95rem;
}

.form-range::-webkit-slider-thumb {
	background: #198754;
}

.card {
	border: none;
	transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
	border-radius: 0.75rem;
	overflow: hidden;
}

.card:hover {
	transform: translateY(-4px);
	box-shadow: 0 4px 6px -1px rgb(0 0 0/ 0.1);
}

.card-img-top {
	height: 220px;
	object-fit: cover;
}

.carousel-item img {
	height: 220px;
	object-fit: cover;
}

.card-body {
	padding: 1.25rem;
}

.card-title {
	font-size: 1.25rem;
	font-weight: 600;
	color: #343a40;
	margin-bottom: 0.5rem;
}

.listing-info {
	font-size: 0.95rem;
	color: #507555;
	display: flex;
	align-items: center;
	gap: 0.25rem;
}

.listing-info i {
	color: #198754;
}

.card-text {
	font-size: 0.95rem;
	color: #507555;
	margin: 0.75rem 0;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.price {
	font-size: 1.35rem;
	font-weight: 700;
	color: #198754;
}

.btn-primary {
	background-color: #198754;
	border-color: #198754;
	padding: 0.5rem 1rem;
	font-weight: 500;
	transition: all 0.2s ease-in-out;
}

.btn-primary:hover {
	background-color: #1a4121;
	border-color: #1a4121;
	transform: translateY(-1px);
}

.carousel-control-prev, .carousel-control-next {
	width: 10%;
	opacity: 0;
	transition: opacity 0.2s ease-in-out;
}

.card:hover .carousel-control-prev, .card:hover .carousel-control-next {
	opacity: 0.8;
}

.form-check-input:checked {
	background-color: #198754;
	border-color: #198754;
}

@media ( max-width : 768px) {
	.filters {
		margin-bottom: 1rem;
	}
	.card-img-top, .carousel-item img {
		height: 180px;
	}
}
</style>
</head>
<body>
	<jsp:include page="/Components/navbar.jsp" />

	<!-- Sidebar Filters -->
	<div class="container" style="margin-top: 116px; margin-bottom: 50px;">
		<div class="row">
			<div class="col-md-3">
				<div class="filters">
					<h4>Filter by Cities</h4>
					<form id="cityFilterForm">
						<%
						@SuppressWarnings("unchecked")
						List<String> cities = (List<String>) request.getAttribute("cities");
						if (cities != null) {
							for (String city : cities) {
						%>
						<div class="form-check">
							<input class="form-check-input city-filter" type="checkbox"
								value="<%=city%>" id="city_<%=city%>" name="cities"> <label
								class="form-check-label" for="city_<%=city%>"><%=city%></label>
						</div>
						<%
						}
						}
						%>
					</form>
				</div>

				<div class="filters">
					<h4>Filter by Price</h4>
					<label for="priceRange">Price Range: ₹ 500 - ₹<span
						id="priceValue">50,000</span></label> <input type="range"
						class="form-range" min="500" max="50000" step="10" id="priceRange">
				</div>
			</div>

			<!-- Hotels Listing -->
			<div class="col-md-9">
				<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4"
					id="hotelList">
					<%
					@SuppressWarnings("unchecked")
					List<Map<String, Object>> hotels = (List<Map<String, Object>>) request.getAttribute("hotels");
					if (hotels != null) {
						for (Map<String, Object> hotel : hotels) {
							String[] images = ((String) hotel.get("imageUrl")).split(",");
					%>
					<div class="col hotel-item" data-city="<%=hotel.get("city")%>"
						data-price="<%=hotel.get("pricePerNight")%>">
						<div class="card shadow-sm">
							<!-- Carousel for Images -->
							<div id="carousel<%=hotel.get("hotelId")%>"
								class="carousel slide" data-bs-ride="carousel">
								<div class="carousel-inner">
									<%
									for (int i = 0; i < images.length; i++) {
										String image = images[i].trim();
									%>
									<div class="carousel-item <%=(i == 0) ? "active" : ""%>">
										<img src="<%=image%>" class="d-block w-100 card-img-top"
											alt="<%=hotel.get("name")%>">
									</div>
									<%
									}
									%>
								</div>
								<%
								if (images.length > 1) {
								%>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carousel<%=hotel.get("hotelId")%>"
									data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carousel<%=hotel.get("hotelId")%>"
									data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
								<%
								}
								%>
							</div>

							<div class="card-body">
								<h5 class="card-title"><%=hotel.get("name")%></h5>
								<p class="listing-info">
									<i class="bi bi-geo-alt-fill"></i>
									<%=hotel.get("city")%>,
									<%=hotel.get("state")%>,
									<%=hotel.get("country")%>
								</p>
								<p class="card-text"><%=hotel.get("description")%></p>
								<div class="d-flex justify-content-between align-items-center">
									<span class="price">₹<%=hotel.get("pricePerNight")%> /
										night
									</span> <a href="HotelDetailServlet?hotelId=<%=hotel.get("hotelId")%>"
										class="btn btn-primary">View Details</a>
								</div>
							</div>
						</div>
					</div>
					<%
					}
					}
					%>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/Components/footer.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script>
    document.addEventListener('DOMContentLoaded', function () {
        const cityFilterForm = document.getElementById('cityFilterForm');
        const priceRange = document.getElementById('priceRange');
        const priceValue = document.getElementById('priceValue');
        const hotelList = document.getElementById('hotelList');
        
        priceRange.addEventListener('input', function () {
            priceValue.textContent = priceRange.value;
            filterHotels();
        });

        cityFilterForm.addEventListener('change', function () {
            filterHotels();
        });

        function filterHotels() {
            const selectedCities = Array.from(document.querySelectorAll('input[name="cities"]:checked')).map(
                (checkbox) => checkbox.value
            );
            const maxPrice = parseInt(priceRange.value);

            const hotels = document.querySelectorAll('.hotel-item');
            hotels.forEach(function (hotel) {
                const hotelCity = hotel.getAttribute('data-city');
                const hotelPrice = parseFloat(hotel.getAttribute('data-price'));
                const cityMatch = selectedCities.length === 0 || selectedCities.includes(hotelCity);
                const priceMatch = hotelPrice <= maxPrice;

                hotel.style.display = cityMatch && priceMatch ? 'block' : 'none';
            });
        }
    });
    </script>

</body>
</html>
