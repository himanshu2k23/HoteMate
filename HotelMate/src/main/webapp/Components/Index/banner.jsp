<style>
/* Banner styling */
.banner {
	position: relative;
	background-image:
		url("http://localhost:8080/HotelMate/Images/HotelMateBanner.jpeg");
	background-size: cover;
	background-position: center;
	height: 700px;
	display: flex;
	align-items: center;
	justify-content: flex-start;
	color: white;
	text-align: center;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
}

/* Overlay for gradient effect */
.banner-overlay {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: linear-gradient(to right, rgba(0, 0, 0, 0.8),
		rgba(0, 0, 0, 0.3));
	z-index: 1;
}

/* Content styling within the banner */
.banner-content {
	position: relative;
	z-index: 2;
	max-width: 650px;
	padding: 20px;
}

/* Headline styling */
.banner-content h1 {
	font-size: 3rem;
	font-weight: 800;
}

.banner-content h1 span {
	display: block;
}

.banner-content .line1 {
	color: #ffffff;
}

.banner-content .line2 {
	color: #15803d;
}

/* Subtitle styling */
.banner-content p {
	font-size: 1.2rem;
	margin-top: 15px;
	color: #e2e2e2;
}

/* Button styling */
.banner-content .btn-primary, .banner-content .btn-outline-light {
	padding: 10px 25px;
	font-size: 1.1rem;
	font-weight: 600;
	border-radius: 5px;
	transition: background-color 0.3s ease, color 0.3s ease, transform 0.2s
		ease;
	margin: 10px;
}

.banner-content .btn-primary {
	background-color: #15803d;
	border: none;
}

.banner-content .btn-primary:hover {
	background-color: #22c55e;
	transform: scale(1.05);
}

.banner-content .btn-outline-light {
	color: #15803d;
	border: 2px solid #15803d;
	background-color: white;
}

.banner-content .btn-outline-light:hover {
	color: #166534;
	border: 2px solid #166534;
	transform: scale(1.05);
}
</style>

<div class="banner">
	<div class="banner-overlay"></div>
	<!-- Overlay for better text visibility -->
	<div class="banner-content text-center">
		<h1>
			<span class="line1">Stay Affordably,</span> <span class="line2">Travel
				Comfortably</span>
		</h1>
		<p>HotelMate offers affordable, clean hotels for travelers across
			India, providing a comfortable stay wherever you go. Find a reliable
			place to rest, whether you're in a bustling city or a quiet town.</p>
		<div class="mt-4 d-flex justify-content-center">
			<a href="signup.jsp" class="btn btn-primary">Get Started</a> <a
				href="javascript:void(0);" class="btn btn-outline-light"
				onclick="scrollToAbout()">About Us</a>
		</div>
	</div>

</div>

<script>
	function scrollToAbout() {
		const aboutSection = document.getElementById('about');
		if (aboutSection) {
			aboutSection.scrollIntoView({
				behavior : 'smooth'
			});
		}
	}
</script>

