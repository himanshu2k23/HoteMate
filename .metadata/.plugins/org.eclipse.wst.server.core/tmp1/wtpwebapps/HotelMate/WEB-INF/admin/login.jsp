<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	background-color: #f8f9fa;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.login-container {
	background: #ffffff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 400px;
	width: 100%;
}

.login-container h2 {
	text-align: center;
	margin-bottom: 20px;
}

.error {
	color: #dc3545;
	margin-bottom: 20px;
}

.form-control {
	margin-bottom: 15px;
}
</style>
</head>
<body>

	<div class="login-container">
		<div class="d-flex justify-content-center">
			<img src="http://localhost:8080/HotelMate/Images/HotelmateLogo.png"
				alt="HotelMate Logo" width="60" height="45" class="d-inline-block">
		</div>
		<form action="${pageContext.request.contextPath}/admin/login"
			method="post">
			<h2>Admin Login</h2>

			<%
			if (request.getAttribute("error") != null) {
			%>
			<div class="alert alert-danger">${error}</div>
			<%
			}
			%>

			<div class="form-group">
				<input type="text" name="username" class="form-control"
					placeholder="Username" required>
			</div>

			<div class="form-group">
				<input type="password" name="password" class="form-control"
					placeholder="Password" required>
			</div>

			<button type="submit" class="btn btn-primary w-100">Login</button>

			<div class="text-center mt-3">
				<a href="/HotelMate">Click here to get back to main page.</a>
			</div>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
