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
				// Scroll functionality
				function scrollToFeatures(event) {
					event.preventDefault();
					localStorage.setItem('scrollToFeatures', 'true');
					window.location.href = "index.jsp";
				}

				function scrollToContact(event) {
					event.preventDefault();
					localStorage.setItem('scrollToContact', 'true');
					window.location.href = "index.jsp";
				}

				// Logic to dynamically toggle login/logout
				window.addEventListener('DOMContentLoaded', () => {
					const navRight = document.querySelector('.navbar-nav.ms-auto');
					navRight.innerHTML = ''; // Clear the default buttons

					if (localStorage.getItem('HasLoggedIn') === 'true') {
						// Show dropdown if logged in
						navRight.innerHTML = `
							<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle text-light" href="#" id="userDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-person-circle" style="font-size: 2rem;"></i>
						</a>

								<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
									<li><a class="dropdown-item" href="mybookings.jsp">My Bookings</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="#" onclick="logout()">Logout</a></li>
								</ul>
							</li>
						`;
					} else {
						// Show login and signup if not logged in
						navRight.innerHTML = `
							<li class="nav-item"><a class="nav-link login-btn" href="login.jsp">Login</a></li>
							<li class="nav-item"><a class="nav-link signup-btn" href="signup.jsp">Sign Up</a></li>
						`;
					}
				});

				// Logout function
				function logout() {
					localStorage.removeItem('HasLoggedIn');
					window.location.href = 'index.jsp';
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
					class="nav-link text-light hover-effect" href="HotelDataServlet">Hotels</a></li>
				<li class="nav-item"><a
					class="nav-link text-light hover-effect" href="#"
					onclick="scrollToContact(event)">Contact Us</a></li>
			</ul>

			<!-- Login/Sign Up or Account Dropdown -->
			<ul class="navbar-nav ms-auto gap-3"></ul>
		</div>
	</div>
</nav>

<style>
.hover-effect {
	transition: color 0.3s ease, background-color 0.3s ease;
}

.hover-effect:hover {
	color: #97CC04 !important;
}

.login-btn, .signup-btn {
	background-color: #97CC04;
	color: #fff;
	border-radius: 5px;
	padding: 8px 15px;
	transition: background-color 0.3s ease;
}

.login-btn:hover, .signup-btn:hover {
	background-color: #76b302;
	color: #fff;
}
</style>
