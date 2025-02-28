
<style>
body {
	background-color: #f8f9fa;
}

.container {
	width: 100%;
	margin-right: auto;
	margin-left: auto;
	text-align: left;
	position: relative !important;
	padding: 0 15px;
}

.text-start {
	text-align: left !important;
}

.text-break {
	word-break: break-word;
}

.btn {
	display: inline-block;
	font-weight: 400;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	user-select: none;
	border: 1px solid transparent;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.btn-primary {
	color: #fff;
	background-color: #0d6efd;
	border-color: #0d6efd;
}

.section-container {
	padding: 60px 0;
	background: url("http://localhost:8080/HotelMate/Images/AboutBg.jpg")
		center center/cover no-repeat;
}

.elements-grid {
	padding: 0px 0px 0px 10px;
	background: rgba(0, 0, 0, 0);
	border-radius: 0px;
}

.d-flex {
	display: flex !important;
}

.align-items-center {
	align-items: center !important;
}

.position-relative {
	position: relative !important;
}

.mw-100 {
	max-width: 100%;
}

.me-2 {
	margin-right: .5rem !important;
}

.ms-2 {
	margin-left: .5rem !important;
}

.w-100 {
	width: 100% !important;
}

.mt-4 {
	margin-top: 1.5rem !important;
}

.container-fluid {
	width: 100%;
	margin-right: auto;
	margin-left: auto;
	padding-right: var(--bs-gutter-x, 0.75rem);
	padding-left: var(--bs-gutter-x, 0.75rem);
}

.section-heading {
	font-size: 40px;
	color: rgb(25, 70, 61);
	padding: 0;
}

.section-subheading {
	font-size: 16px;
	color: rgb(49, 53, 56);
	padding: 20px 0 20px 1px;
}

.footer-summary {
	font-size: 14px;
	color: rgb(255, 255, 255);
	background: rgb(176, 176, 176);
	padding: 14px;
}

.btn-primary {
	background-color: #15803d;
	border: none;
	padding: 6px 20px;
	font-size: 1.1rem;
	border-radius: 5px;
	transition: background-color 0.3s ease, color 0.3s ease, transform 0.2s
		ease;
	margin: 10px;
}

.btn-primary:hover {
	background-color: #22c55e;
	transform: scale(1.05);
}
</style>

<section
	id = "about"
	class="block container-fluid position-relative view text-start section-container">
	<div class="main-wrapper container p-0">
		<div class="container-fluid p-0 position-relative">
			<div class="h-auto moveItem-1">
				<div class="col">
					<div id="swiper" class="elements-grid position-relative null">
						<div class="row">
							<div class="col-12 col-md-7 d-flex align-items-center">
								<div class="mw-100">
									<div id="heading"
										class="text-break m-0 elements text text-start section-heading">
										Affordable and Comfortable Stays with HotelMate</div>
									<div id="summary"
										class="text-break elements textHtml text-start section-subheading">
										HotelMate offers affordable, clean hotels across India,
										ensuring a comfortable stay for every traveler.</div>
									<div class="">
										<a href="signup.jsp" class="btn btn-primary">Get Started</a>
									</div>
								</div>
							</div>
							<div class="col-12 col-md-5">
								<div class="position-relative w-100 ai-generated"
									style="padding: 23px 0px 10px; background: rgba(0, 0, 0, 0);">
									<img id="banner" class="elements image w-100"
										src="https://media.mediadirhub.com/images/image-1x1.png"
										alt=""
										style="background: url('http://localhost:8080/HotelMate/Images/AboutImg.jpeg') center center/cover no-repeat; border-radius: 0px;">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div id="footerSummary"
						class="text-break elements textHtml mobile-d-none text-center footer-summary">
						HotelMate is a streamlined hotel booking platform designed to
						facilitate easy reservations at hotels within the brand. The Room
						Reservation feature allows users to quickly book rooms with
						various amenities, ensuring a seamless and user-friendly booking
						experience.</div>
				</div>
			</div>
		</div>
	</div>
</section>
