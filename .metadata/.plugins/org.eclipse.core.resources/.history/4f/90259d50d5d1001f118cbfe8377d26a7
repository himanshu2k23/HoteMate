<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title> Listings - HotelMate</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<style>
.card-img-top {
	height: 180px;
	object-fit: cover;
}

.listing-info {
	color: #6c757d;
}

.price {
	font-size: 1.2rem;
	font-weight: bold;
	color: #198754;
}

.filters {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@ include file="/Components/navbar.jsp"%>

	<!-- Sidebar Filters -->
	<div class="container"  style="margin-top:116px;margin-bottom:50px;">
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
					<label for="priceRange">Price Range: ₹ 500- ₹<span
						id="priceValue">50,000</span></label> <input type="range" class="form-range"
						min="500" max="50000" step="10" id="priceRange">
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
					%>
					<div class="col hotel-item" data-city="<%=hotel.get("city")%>"
						data-price="<%=hotel.get("pricePerNight")%>">
						<div class="card shadow-sm">
							<img src="<%=hotel.get("imageUrl")%>" class="card-img-top"
								alt="<%=hotel.get("name")%>">
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
									</span> <a href="details.jsp?hotelId=<%=hotel.get("hotelId")%>"
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

	<%@ include file="/Components/footer.jsp"%>

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
        
        // Update the price value display
        priceRange.addEventListener('input', function () {
            priceValue.textContent = priceRange.value;
            filterHotels();
        });

        // City filter event listener
        cityFilterForm.addEventListener('change', function () {
            filterHotels();
        });

        // Function to filter hotels
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

                // Show or hide the hotel based on the filters
                if (cityMatch && priceMatch) {
                    hotel.style.display = 'block';
                } else {
                    hotel.style.display = 'none';
                }
            });
        }
    });
</script>
</body>
</html>
