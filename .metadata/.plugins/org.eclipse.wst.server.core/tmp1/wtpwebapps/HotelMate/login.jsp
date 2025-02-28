<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - HotelMate</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

.login-container {
	max-width: 400px;
	margin: 150px auto;
	padding: 20px;
	border-radius: 15px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
	background-color: #fff;
}

.login-btn {
	background-color: #97CC04 !important;
	color: #fff;
}

.login-btn:hover {
	background-color: #76b302 !important;
}
</style>
</head>
<body>

	<%@ include file="/Components/navbar.jsp"%>

	<div class="login-container">
		<h2 class="text-center mb-4">Login</h2>

		<%
		String errorMessage = (String) request.getAttribute("errorMessage");
		if (errorMessage != null && !errorMessage.isEmpty()) {
		%>
		<div class="alert alert-danger" role="alert"><%=errorMessage%></div>
		<%
		}
		%>

		<form action="LoginServlet" method="post">
			<div class="mb-3">
				<label for="email" class="form-label">Email address</label> <input
					type="email" class="form-control" id="email" name="email" required>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Password</label> <input
					type="password" class="form-control" id="password" name="password"
					required>
			</div>
			<button type="submit" class="btn login-btn w-100">Login</button>
			<div class="mt-3 text-center">
				<a href="signup.jsp">Don't have an account? Sign Up</a>
			</div>
		</form>
	</div>

	<%@ include file="/Components/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
