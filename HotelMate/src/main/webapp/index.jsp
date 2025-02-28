	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HotelMate</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">


<style>
body {
	background-color: #f8f9fa;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<%@ include file="/Components/navbar.jsp"%>

	<!-- Banner -->
	<%@ include file="/Components/Index/banner.jsp"%>

	<!-- About -->
	<%@ include file="/Components/Index/about.jsp"%>

	<!-- Featuress -->
	<%@ include file="/Components/Index/features.jsp"%>

	<!-- Contact -->
	<%@ include file="/Components/Index/contact.jsp"%>

	<!-- Footer -->
	<%@ include file="/Components/footer.jsp"%>

	<!-- Bootstrap JS  -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	<script>
		window.onload = function() {
			if (localStorage.getItem('scrollToContact') === 'true') {
				var aboutElement = document.getElementById("contact");
				if (aboutElement) {
					window.scrollTo({
						top : aboutElement.offsetTop - 100,
						behavior : 'smooth'
					});
				}
				localStorage.removeItem('scrollToContact');
			}
			if (localStorage.getItem('scrollToFeatures') === 'true') {
				var featuresElement = document.getElementById("features");
				if (featuresElement) {
					window.scrollTo({
						top : featuresElement.offsetTop - 100,
						behavior : 'smooth'
					});
				}
				localStorage.removeItem('scrollToFeatures');
			}
		};
	</script>


</body>
</html>
