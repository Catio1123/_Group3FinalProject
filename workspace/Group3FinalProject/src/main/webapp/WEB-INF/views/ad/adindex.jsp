<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>I Podcast</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/ipodcast/wayne/creative/assets/favicon.ico" />
<!-- Bootstrap Icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<!-- SimpleLightbox plugin CSS-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/ipodcast/wayne/creative/css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
		id="mainNav">
		<div class="container px-4 px-lg-5">

			<a class="navbar-brand" href="<c:url value='/' />"> <img
				src="/ipodcast/wayne/images/iPocast.png" width="200" align="top"></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto my-2 my-lg-0">




					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/company'/>">${Member.name }廣告商專區</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead">

		<div id="carouselExampleCaptions" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="3" aria-label="Slide 4"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="4" aria-label="Slide 5"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="5" aria-label="Slide 6"></button>

			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="<c:url value='/wayne/creative/assets/img/ad1.jpg'/>"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5></h5>
						<p></p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/wayne/creative/assets/img/ad3.jpg'/>"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5></h5>
						<p></p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/wayne/creative/assets/img/ad6.jpg'/>"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5></h5>
						<p></p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/wayne/creative/assets/img/ad2.jpg'/>"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5></h5>
						<p></p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/wayne/creative/assets/img/ad5.jpg'/>"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5></h5>
						<p></p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/wayne/creative/assets/img/ad4.jpg'/>"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5></h5>
						<p></p>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

	</header>
	<!-- About-->

	<!-- Services-->
	<section class="page-section" id="services">
		<div class="container px-4 px-lg-5">
			<h2 class="text-center mt-0">更精準、高黏著、高轉換的廣告選擇</h2>
			<hr class="divider" />
			<div class="row gx-4 gx-lg-5">
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<div class="mb-2">
							<img
								src="<c:url value='/wayne/creative/assets/img/icon11-B.png'/>"
								width="200" height="200">
						</div>
						<h3 class="h4 mb-2">主持人背書效應</h3>
						<p class="text-muted mb-0">主持人親口描述，聽眾容易對產品、品牌產生較高接受度，同時具有背書效應。
						</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<div class="mb-2">
							<img
								src="<c:url value='/wayne/creative/assets/img/icon12-B.png'/>"
								width="200" height="200">
						</div>
						<h3 class="h4 mb-2">聽眾黏著度高</h3>
						<p class="text-muted mb-0">多數節目有 60-70 % 的聽眾都會聽完整集內容。</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<div class="mb-2">
							<img
								src="<c:url value='/wayne/creative/assets/img/icon13-B.png'/>"
								width="200" height="200">
						</div>
						<h3 class="h4 mb-2">精準客群投放</h3>
						<p class="text-muted mb-0">節目調性、時事議題和主持人風格明確，下的廣告直接對應需要的客群。</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<div class="mb-2">
							<img
								src="<c:url value='/wayne/creative/assets/img/icon14-B.png'/>"
								width="200" height="200">
						</div>
						<h3 class="h4 mb-2">數據精準計算</h3>
						<p class="text-muted mb-0">最大市占掌握完整數據</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Portfolio-->
	<div id="portfolio">
		<div class="container-fluid p-0">
			<div class="row g-0">
				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box"
						href="<c:url value='/wayne/creative/assets/img/portfolio/fullsize/1.jpg'/>"
						title="Project Name"> <img class="img-fluid"
						src="<c:url value='/wayne/creative/assets/img/portfolio/thumbnails/1.jpg'/>"
						alt="..." />
						<div class="portfolio-box-caption">
							<div class="project-category text-white-50">Category</div>
							<div class="project-name">123</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box"
						href="<c:url value='/wayne/creative/assets/img/portfolio/fullsize/2.jpg'/>"
						title="Project Name"> <img class="img-fluid"
						src="<c:url value='/wayne/creative/assets/img/portfolio/thumbnails/2.jpg'/>"
						alt="..." />
						<div class="portfolio-box-caption">
							<div class="project-category text-white-50">Category</div>
							<div class="project-name">Project Name</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box"
						href="<c:url value='/wayne/creative/assets/img/portfolio/fullsize/3.jpg'/>"
						title="Project Name"> <img class="img-fluid"
						src="<c:url value='/wayne/creative/assets/img/portfolio/thumbnails/3.jpg'/>"
						alt="..." />
						<div class="portfolio-box-caption">
							<div class="project-category text-white-50">Category</div>
							<div class="project-name">Project Name</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box"
						href="<c:url value='/wayne/creative/assets/img/portfolio/fullsize/4.jpg'/>"
						title="Project Name"> <img class="img-fluid"
						src="<c:url value='/wayne/creative/assets/img/portfolio/thumbnails/4.jpg'/>"
						alt="..." />
						<div class="portfolio-box-caption">
							<div class="project-category text-white-50">Category</div>
							<div class="project-name">Project Name</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box"
						href="<c:url value='/wayne/creative/assets/img/portfolio/fullsize/5.jpg'/>"
						title="Project Name"> <img class="img-fluid"
						src="<c:url value='/wayne/creative/assets/img/portfolio/thumbnails/5.jpg'/>"
						alt="..." />
						<div class="portfolio-box-caption">
							<div class="project-category text-white-50">Category</div>
							<div class="project-name">Project Name</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box"
						href="<c:url value='/wayne/creative/assets/img/portfolio/fullsize/6.jpg'/>"
						title="Project Name"> <img class="img-fluid"
						src="<c:url value='/wayne/creative/assets/img/portfolio/thumbnails/6.jpg'/>"
						alt="..." />
						<div class="portfolio-box-caption p-3">
							<div class="project-category text-white-50">Category</div>
							<div class="project-name">Project Name</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Call to action-->
	<section class="page-section bg-dark text-white">
		<div class="container px-4 px-lg-5 text-center">
			<h2 class="mb-4">所有你想要的、你還不知道你需要的，我們都能協助您。</h2>
			<a class="btn btn-light btn-xl"
				href="https://startbootstrap.com/theme/creative/">免費諮詢</a>
		</div>
	</section>
	<!-- Contact-->
	<section class="page-section" id="contact">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-lg-8 col-xl-6 text-center">
					<h2 class="mt-0">最新客製化 Podcast 廣告投放，您也有興趣嗎？</h2>
					<hr class="divider" />
					<p class="text-muted mb-5">膩了一般社群，想試試 Podcast 廣告投放嗎？
						放心交給我們，精心客製化的設計，絕對讓您的品牌更加分。</p>
				</div>
			</div>
			<div class="row gx-4 gx-lg-5 justify-content-center mb-5">
				<div class="col-lg-6">
					<!-- * * * * * * * * * * * * * * *-->
					<!-- * * SB Forms Contact Form * *-->
					<!-- * * * * * * * * * * * * * * *-->
					<!-- This form is pre-integrated with SB Forms.-->
					<!-- To make this form functional, sign up at-->
					<!-- https://startbootstrap.com/solution/contact-forms-->
					<!-- to get an API token!-->
					<form id="contactForm" data-sb-form-api-token="API_TOKEN">
						<!-- Name input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="name" type="text"
								placeholder="Enter your name..." data-sb-validations="required" />
							<label for="name">姓名</label>
							<div class="invalid-feedback" data-sb-feedback="name:required">請填寫姓名</div>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="name" type="text"
								placeholder="Enter your name..." data-sb-validations="required" />
							<label for="name">公司名稱</label>
							<div class="invalid-feedback" data-sb-feedback="name:required">
								請填寫公司名稱</div>
						</div>
						<!-- Email address input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="email" type="email"
								placeholder="name@example.com"
								data-sb-validations="required,email" /> <label for="email">Email
							</label>
							<div class="invalid-feedback" data-sb-feedback="email:required">An
								email is required.</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">Email
								is not valid.</div>
						</div>
						<!-- Phone number input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="phone" type="tel"
								placeholder="(123) 456-7890" data-sb-validations="required" />
							<label for="phone">聯絡電話</label>
							<div class="invalid-feedback" data-sb-feedback="phone:required">A
								請填寫電話</div>
						</div>
						<!-- Message input-->
						<div class="form-floating mb-3">
							<textarea class="form-control" id="message" type="text"
								placeholder="Enter your message here..." style="height: 10rem"
								data-sb-validations="required"></textarea>
							<label for="message">詢問內容</label>
							<div class="invalid-feedback" data-sb-feedback="message:required">A
								請填寫想詢問的內容</div>
						</div>
						<!-- Submit success message-->
						<!---->
						<!-- This is what your users will see when the form-->
						<!-- has successfully submitted-->
						<div class="d-none" id="submitSuccessMessage">
							<div class="text-center mb-3">
								<div class="fw-bolder">Form submission successful!</div>
								To activate this form, sign up at <br /> <a
									href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
							</div>
						</div>
						<!-- Submit error message-->
						<!---->
						<!-- This is what your users will see when there is-->
						<!-- an error submitting the form-->
						<div class="d-none" id="submitErrorMessage">
							<div class="text-center text-danger mb-3">Error sending
								message!</div>
						</div>
						<!-- Submit Button-->
						<div class="d-grid">
							<button class="btn btn-primary btn-xl disabled" id="submitButton"
								type="submit">送出</button>
						</div>
					</form>
				</div>
			</div>
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-lg-4 text-center mb-5 mb-lg-0">
					<i class="bi-phone fs-2 mb-3 text-muted"></i>
					<div>(03)-425-1108</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="bg-light py-5">
		<div class="container px-4 px-lg-5">
			<div class="small text-center text-muted">Copyright &copy; 2021
				- 資策會</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- SimpleLightbox plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
	<!-- Core theme JS-->
	<script src="/ipodcast/wayne/creative/js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
