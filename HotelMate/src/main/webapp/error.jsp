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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

.error-container {
	background: rgba(255, 255, 255, 0.95);
	padding: 3rem;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1), 0 1px 8px
		rgba(0, 0, 0, 0.05);
	width: 100%;
	max-width: 600px;
	text-align: center;
	position: relative;
	overflow: hidden;
}

.error-container::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 5px;
	background: linear-gradient(90deg, #dc3545, #fd7e14, #dc3545);
	animation: gradient 3s ease infinite;
	background-size: 200% auto;
}

@
keyframes gradient { 0% {
	background-position: 0% 50%;
}

50
%
{
background-position
:
100%
50%;
}
100
%
{
background-position
:
0%
50%;
}
}
.error-icon {
	font-size: 80px;
	color: #dc3545;
	margin-bottom: 1.5rem;
	animation: bounce 2s ease infinite;
}

@
keyframes bounce { 0%, 100% {
	transform: translateY(0);
}

50
%
{
transform
:
translateY(
-10px
);
}
}
.error-title {
	font-size: 2.5rem;
	font-weight: 700;
	color: #343a40;
	margin-bottom: 1rem;
}

.error-message {
	font-size: 1.1rem;
	color: #6c757d;
	margin-bottom: 2rem;
	line-height: 1.6;
}

.error-suggestions {
	background-color: #f8f9fa;
	padding: 1.5rem;
	border-radius: 12px;
	margin-bottom: 2rem;
}

.suggestion-list {
	text-align: left;
	margin-bottom: 0;
	padding-left: 1.5rem;
}

.suggestion-list li {
	margin-bottom: 0.5rem;
	color: #495057;
}

.btn-back {
	padding: 0.8rem 2rem;
	font-size: 1.1rem;
	font-weight: 500;
	transition: all 0.3s ease;
	background-color: #0d6efd;
	border: none;
}

.btn-back:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(13, 110, 253, 0.2);
	background-color: #0b5ed7;
}

.additional-links {
	margin-top: 1.5rem;
	display: flex;
	justify-content: center;
	gap: 1rem;
}

.additional-links a {
	color: #6c757d;
	text-decoration: none;
	font-size: 0.9rem;
	transition: color 0.3s ease;
}

.additional-links a:hover {
	color: #343a40;
}
</style>
</head>
<body>
	<div class="error-container">
		<i class="bi bi-exclamation-triangle error-icon"></i>
		<h1 class="error-title">Oops!</h1>
		<p class="error-message">We encountered an unexpected error while
			processing your request.</p>

		<div class="error-suggestions">
			<ul class="suggestion-list">
				<li>Refresh the page and try again</li>
				<li>Clear your browser cache and cookies</li>
				<li>Check your internet connection</li>
				<li>Try accessing the page later</li>
			</ul>
		</div>

		<a href="index.jsp" class="btn btn-primary btn-back"> <i
			class="bi bi-house-door me-2"></i>Return to Homepage
		</a>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>