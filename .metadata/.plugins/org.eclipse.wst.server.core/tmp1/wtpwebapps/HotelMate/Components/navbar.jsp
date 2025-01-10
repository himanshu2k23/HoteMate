<nav class="navbar navbar-expand-lg"
	style="background-color: #343a40; border-radius: 15px; padding: 10px 20px; box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2); margin: 10px; position: fixed; top: 0px; width: calc(100% - 20px); z-index: 1000;">
	<div class="container-fluid">
		<!-- Logo and Brand Name -->
		<a class="navbar-brand text-light d-flex align-items-center"
			href="index.jsp"> <img
			src="http://localhost:8080/HotelMate/Images/HotelmateLogo.png"
			alt="Logo" width="80" height="60"
			class="d-inline-block align-text-top"> <span
			class="nav-link text-light active">HotelMate</span>
		</a>


		<!-- Toggler button for smaller screens -->
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation"
			style="border-color: #f8f9fa;">
			<span class="navbar-toggler-icon" style="color: #f8f9fa;"></span>
		</button>

		<!-- Navbar Links -->
		<div class="collapse navbar-collapse" id="navbarNav">

			<script>
				function scrollToFeatures(event) {
					event.preventDefault(); // Prevents the default anchor link behavior

					// Store scroll behavior information in localStorage
					localStorage.setItem('scrollToFeatures', 'true');

					// Redirect to index.jsp
					window.location.href = "index.jsp";
				}

				function scrollToAbout(event) {
					event.preventDefault(); // Prevents the default anchor link behavior

					// Store scroll behavior information in localStorage
					localStorage.setItem('scrollToAbout', 'true');

					// Redirect to index.jsp
					window.location.href = "index.jsp";
				}
			</script>

			<ul class="navbar-nav me-auto">
				<li class="nav-item"><a
					class="nav-link text-light active hover-effect" aria-current="page"
					href="index.jsp">Home</a></li>
				<li class="nav-item"><a
					class="nav-link text-light hover-effect" href="#"
					onclick="scrollToFeatures(event)">Features</a></li>

				<li class="nav-item"><a
					class="nav-link text-light hover-effect" href="#"
					onclick="scrollToAbout(event)">About Us</a></li>
				<li class="nav-item"><a
					class="nav-link text-light hover-effect" href="HotelDataServlet">Hotels</a></li>
			</ul>


			<!-- Login and Sign Up links on the right -->
			<ul class="navbar-nav ms-auto gap-3">
				<li class="nav-item"><a class="nav-link login-btn"
					href="login.jsp">Login</a></li>
				<li class="nav-item"><a class="nav-link signup-btn"
					href="signup.jsp">Sign Up</a></li>
			</ul>
		</div>
	</div>
</nav>

<style>
/* Hover effect for navbar links */
.hover-effect {
	transition: color 0.3s ease, background-color 0.3s ease;
}

.hover-effect:hover {
	color: #97CC04 !important;
}

/* Styles for Login and Sign Up buttons */
.login-btn, .signup-btn {
	background-color: #97CC04; /* Green background */
	color: #fff; /* White text */
	border-radius: 5px; /* Rounded corners */
	padding: 8px 15px; /* Padding for button effect */
	transition: background-color 0.3s ease; /* Smooth transition */
}

.login-btn:hover, .signup-btn:hover {
	background-color: #76b302; /* Darker green on hover */
	color: #fff; /* Keep white text */
}
</style>


