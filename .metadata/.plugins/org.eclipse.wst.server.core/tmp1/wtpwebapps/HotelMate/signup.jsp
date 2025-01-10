<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up - HotelMate</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

.signup-container {
	max-width: 400px;
	margin: 150px auto;
	margin-bottom: 30px;
	padding: 20px;
	border-radius: 15px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
	background-color: #ffffff;
}

.signup-btn {
	background-color: #97CC04;
	color: #fff;
}

.signup-btn:hover {
	background-color: #76b302;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<%@ include file="/Components/navbar.jsp"%>

	<div class="signup-container">
		<h2 class="text-center mb-4">Sign Up</h2>

		<!-- Display Error Alert -->
		<%
		String error = (String) request.getAttribute("error");
		if (error != null && !error.isEmpty()) {
		%>
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">
			<%=error%>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<%
		}
		%>

		<form action="SignupServlet" method="post">
			<div class="mb-3">
				<label for="name" class="form-label">Full Name</label> <input
					type="text" class="form-control" id="name" name="name" required>
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">Email address</label> <input
					type="email" class="form-control" id="email" name="email" required>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Password</label> <input
					type="password" class="form-control" id="password" name="password"
					required>
			</div>
			<div class="mb-3">
				<label for="confirmPassword" class="form-label">Confirm
					Password</label> <input type="password" class="form-control"
					id="confirmPassword" name="confirmPassword" required>
			</div>
			<button type="submit" class="btn signup-btn w-100">Sign Up</button>
			<div class="mt-3 text-center">
				<a href="login.jsp">Already have an account? Login</a>
			</div>
		</form>
	</div>

	<!-- Footer -->
	<%@ include file="/Components/footer.jsp"%>

	<!-- Bootstrap JS (Popper.js included) -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
