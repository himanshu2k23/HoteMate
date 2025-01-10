<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error - HotelMate</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.error-container {
	text-align: center;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
	background-color: #fff;
	width: 100%;
	max-width: 500px;
}

.error-container h1 {
	font-size: 100px;
	color: #dc3545;
}

.error-container p {
	font-size: 18px;
	color: #495057;
}

.btn-back {
	margin-top: 20px;
}
</style>
</head>
<body>

	<div class="error-container">
		<h1>Oops!</h1>
		<p>Something went wrong. We're sorry for the inconvenience.</p>
		<a href="index.jsp" class="btn btn-primary btn-back">Go Back to
			Home</a>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
