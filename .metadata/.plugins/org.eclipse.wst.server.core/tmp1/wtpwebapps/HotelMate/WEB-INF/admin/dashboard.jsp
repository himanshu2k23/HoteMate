<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
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

	<div class="container mt-5" style="height:36rem">
		<h1 class="text-center mb-4">Admin Dashboard</h1>
		<div class="row">
			<div class="col-md-4">
				<div class="card text-white bg-primary mb-3">
					<div class="card-header text-center">Total Users</div>
					<div class="card-body text-center">
						<h1 class="card-title"><%=request.getAttribute("totalUsers")%></h1>
						<a href="${pageContext.request.contextPath}/admin/users"
							class="btn btn-light">View Users</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-white bg-success mb-3">
					<div class="card-header text-center">Total Bookings</div>
					<div class="card-body text-center">
						<h1 class="card-title"><%=request.getAttribute("totalBookings")%></h1>
						<a href="${pageContext.request.contextPath}/admin/bookings"
							class="btn btn-light">View Bookings</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-white bg-info mb-3">
					<div class="card-header text-center">Total Hotels</div>
					<div class="card-body text-center">
						<h1 class="card-title"><%=request.getAttribute("totalHotels")%></h1>
						<a href="${pageContext.request.contextPath}/admin/hotels"
							class="btn btn-light">View Hotels</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<footer class="bg-dark text-white text-center py-3 mt-5">
		<p>© HotelMate 2025 - All rights reserved</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
