<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="../layout/meta.jsp" />
<link href="css/testResult-page.css" rel="stylesheet">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="starter-page-page">

	<!-- layout: 헤더 영역 -->
	<%@ include file="../layout/header.jsp"%>
	
	<main class="main">
	    <!-- Start Error Page Section -->
	    <section id="hero" class="hero section">
	      <div class="hero-bg">
	        <img src="img/hero-bg-light.webp" alt="">
	      </div>
	      <div class="container text-center">
	      	<div class="d-flex flex-column justify-content-center align-items-center">
	          	<h1 data-aos="fade-up"><span><i class="bi bi-exclamation-triangle-fill"></i> 404</span> Not Found</h1>
	          	<p data-aos="fade-up mt-2" data-aos-delay="100">죄송합니다. 찾을 수 없는 페이지도 이동하였습니다.</p>
				<div class="d-flex" data-aos="fade-up" data-aos-delay="100">
				  <a href="/" class="btn-get-started"><span>메인화면으로</span><i class="bi bi-arrow-right"></i></a>
				</div>
				<div class="d-flex" data-aos="fade-up" data-aos-delay="200">
					<div class="pricing">
					  	<h4><span><i class="bi bi-envelope me-2"></i>문의: webmaster@kckoo.co.kr</span></h4>
					</div>          
				</div>          
				<div class="">
				  <img src="img/indexPageImg.webp" class="img-fluid hero-img" alt="" data-aos="zoom-out" data-aos-delay="300">
				</div>
	      	</div>
	      </div>
	    </section>
	    <!-- End Error Page Section -->
	    
	   	<!-- 테토/에겐 유형 설명 -->
	  	<%@ include file="../tetoEganType/tetoEganType.jsp" %>
	</main>

	<!-- layout: 헤더 영역 -->
	<%@ include file="../layout/footer.jsp"%>

</body>

</html>