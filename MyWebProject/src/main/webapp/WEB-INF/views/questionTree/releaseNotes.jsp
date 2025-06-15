<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<jsp:include page="../layout/meta.jsp" />
	<link href="css/testResult-page.css" rel="stylesheet">
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- 구글 애드센스에서 소스를 읽어 광고를 적정한 위치에 넣음. -->
	<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-5509463812555494"
	     crossorigin="anonymous"></script>
</head>

<body class="starter-page-page">

	<!-- layout: 헤더 영역 -->
	<%@ include file="../layout/header.jsp"%>
	
	<main class="main">
	
	    <!-- Page Title -->
	    <div class="page-title" data-aos="fade">
	      <div class="container d-lg-flex justify-content-between align-items-center">
	        <h1 class="mb-2 mb-lg-0">Release Note</h1>
	        <nav class="breadcrumbs">
	          <ol>
	            <li><a href="#">구현 및 업데이트 반영 사항</a></li>
	            <li class="current">Release Note</li>
	          </ol>
	        </nav>
	      </div>
	    </div>
	    <!-- End Page Title -->
	    
	    <!-- More Features Section -->
	    <section id="more-features" class="more-features section">
	    
	      <!-- Section Title -->
	      <div class="container section-title" data-aos="fade-up">
	        <h2>사용자 의견 및 문의 안내</h2>
	      </div>
	      <!-- End Section Title -->
	      
	      <div class="container">
	
	        <div class="row justify-content-around gy-4">
	
	          <div class="col-lg-6 d-flex flex-column justify-content-center order-2 order-lg-1" data-aos="fade-up" data-aos-delay="100">
	            <h3>Question tree</h3>
	            <p><strong>Question tree는 여러분의 소중한 의견</strong>을 기다립니다.<br><br>
					개선사항이나 문의가 있으실 경우, <br>
					아래 이메일로 보내주시면 순차적으로 검토 및 반영하겠습니다.<br>
					<strong>문의 메일:</strong> webmaster@kckoo.co.kr</p>
	            <div class="row">
	
	              <div class="col-lg-6 icon-box d-flex">
	                <i class="bi bi-easel flex-shrink-0"></i>
	                <div>
	                  <h4>결과 해석 관련 문의</h4>
	                  <p>테토/에겐 결과가 이해되지 않거나, 추가 설명이 필요한 경우 </p>
	                </div>
	              </div><!-- End Icon Box -->
	
	              <div class="col-lg-6 icon-box d-flex">
	                <i class="bi bi-patch-check flex-shrink-0"></i>
	                <div>
	                  <h4>오류 및 버그 신고</h4>
	                  <p>페이지가 제대로 작동하지 않거나, 데이터가 비정상적으로 보일 때</p>
	                </div>
	              </div><!-- End Icon Box -->
	
	              <div class="col-lg-6 icon-box d-flex">
	                <i class="bi bi-brightness-high flex-shrink-0"></i>
	                <div>
	                  <h4>결과 공유 기능 요청/불편</h4>
	                  <p>결과를 SNS나 메신저에 공유할 수 있는 기능이 작동하지 않을 때</p>
	                </div>
	              </div><!-- End Icon Box -->
	
	              <div class="col-lg-6 icon-box d-flex">
	                <i class="bi bi-brightness-high flex-shrink-0"></i>
	                <div>
	                  <h4>콘텐츠 제안 및 개선 요청</h4>
	                  <p>질문 문항, UI 디자인, 결과 내용 등에서 개선되었으면 하는 부분</p>
	                </div>
	              </div><!-- End Icon Box -->
	              
	            </div>
	          </div>
	          <div class="features-image col-lg-5 order-1 order-lg-2" data-aos="fade-up" data-aos-delay="200">
	            <img src="img/releaseNoteImg.webp" alt="">
	          </div>
	        </div>
	      </div>
	
	    </section><!-- /More Features Section -->
	
	    <!-- Start 구현 및 업데이트 Section -->
	    <section id="faq" class="faq section">
	
	      <!-- Section Title -->
	      <div class="container section-title" data-aos="fade-up">
	        <h2>구현 및 업데이트 반영 사항</h2>
	      </div><!-- End Section Title -->
	
	      <div class="container">
	        <div class="row justify-content-center">
	          <div class="col-lg-10" data-aos="fade-up" data-aos-delay="100">
	            <div class="faq-container">
	            
	              <div class="faq-item faq-active">
	                <h3>✔ v1.10.0 사이트 트래픽 초과 문제 해결에 대한 배포 (2025-06-10 완료)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜:</strong> 2025-06-10<br>
	                  <strong>유형:</strong> v1.10.0 완료<br>
	                  <strong>내용:</strong> 사이트 트래픽 초과 문제 해결에 대한 배포를 시작하였습니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End Faq item-->

          	      <div class="faq-item">
	                <h3>✔ v1.9.1 에겐/테토 통계 페이지 상세 통계 추가 배포 (2025-06-03 완료)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜:</strong> 2025-06-03<br>
	                  <strong>유형:</strong> v1.9.1 완료<br>
	                  <strong>내용:</strong> 에겐/테토 통계 페이지 상세 통계 추가 배포를 시작하였습니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End Faq item-->
	              
          	      <div class="faq-item">
	                <h3>✔ v1.9.0 에겐/테토 통계 페이지 배포 (2025-05-31 완료)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜:</strong> 2025-05-31<br>
	                  <strong>유형:</strong> v1.9.0 완료<br>
	                  <strong>내용:</strong> 에겐/테토 통계 페이지 배포를 시작하였습니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End Faq item-->
	              
          	      <div class="faq-item">
	                <h3>✔ v1.8.0 홈페이지 매니저 및 관리자 기능 추가 (2025-05-29 완료)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜:</strong> 2025-05-29<br>
	                  <strong>유형:</strong> v1.8.0 완료<br>
	                  <strong>내용:</strong> 홈페이지 매니저 및 관리자 기능 추가되였습니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End Faq item-->
	              
         	      <div class="faq-item">
	                <h3>✔ v1.7.0 에겐/테토 테스트가 정상 운영 시작 (2025-05-25 완료)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜:</strong> 2025-05-25<br>
	                  <strong>유형:</strong> v1.7.0 완료<br>
	                  <strong>내용:</strong> 에겐/테토 테스트가 정상 운영을 시작하였습니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End Faq item-->
	              
         	      <div class="faq-item">
	                <h3>✔ v1.6.0 에겐/테토 테스트 공유용 이미지 다운로드 기능 배포 (2025-05-20 완료)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜:</strong> 2025-05-20<br>
	                  <strong>유형:</strong> v1.6.0 배포 완료<br>
	                  <strong>내용:</strong> 에겐/테토 테스트 공유용 이미지 다운로드 기능 배포 완료하였습니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End Faq item-->
	              
         	      <div class="faq-item">
	                <h3>🔼 v1.5.0 서버 사양 강화 처리 중 (2025-06-02 예정)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜:</strong> 2025-06-02<br>
	                  <strong>유형:</strong> v1.5.0 처리 예정<br>
	                  <strong>내용:</strong> 서버 사양 강화 처리 중 입니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End Faq item-->
	              
  	              <div class="faq-item">
	                <h3>✔ v1.4.0 서버 내부 보안 강화 처리 완료 (2025-05-20 완료)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜:</strong> 2025-05-20<br>
	                  <strong>유형:</strong> v1.4.0 처리 예정<br>
	                  <strong>내용:</strong> 서버 내부 보안 강화 처리를 완료하였습니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End Faq item-->
	
  	              <div class="faq-item">
	                <h3>✔ v1.3.1 페이지 이동 오류 시 처리 배포 (2025-05-20 완료)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜:</strong> 2025-05-20<br>
	                  <strong>유형:</strong> v1.3.1 배포 완료<br>
	                  <strong>내용:</strong> 페이지 오류 시 처리에 대한 세부 업데이트가 진행되었습니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End Faq item-->
	
	              <div class="faq-item">
	                <h3>✔ v1.4.0 릴리즈 노트 페이지 배포 (2025-05-19 완료)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜:</strong> 2025-05-19<br>
	                  <strong>유형:</strong> v1.4.0 배포 완료<br>
	                  <strong>내용:</strong> 릴리즈 노트 배포에 대한 업데이트가 진행되었습니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End Faq item-->
	              
	              <div class="faq-item">
	                <h3>✔ v1.3.0 페이지 이동 오류 시 처리 문의 (2025-05-19 완료)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜:</strong> 2025-05-19 완료<br>
	                  <strong>유형:</strong> v1.3.0 배포 완료<br>
	                  <strong>내용:</strong> 페이지 오류 시 처리에 대한 분석 및 업데이트가 진행되었습니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End Faq item-->
	              
	              <div class="faq-item">
	                <h3>✔ v1.2.0 에겐/테토 질문지 변경 문의 (2025-05-19 완료)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜:</strong> 2025-05-19 완료<br>
	                  <strong>유형:</strong> v1.2.0 배포 완료<br>
	                  <strong>내용:</strong> 질문지 변경 문의로 질문지 업데이트가 진행되었습니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End Faq item-->
	
	              <div class="faq-item">
	                <h3>✔ v1.1.0 안정화 기간 (2025-05-19 ~ 2025-05-25)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜</strong>: 2025-05-19 ~ 2025-05-25<br>
	                  <strong>유형</strong>: v1.1.0 배포 완료<br>
	                  <strong>내용:</strong> 프로젝트 안정화 기간을 마쳤습니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End Faq item-->
	              
       	          <div class="faq-item">
	                <h3>✔ v1.0.1 에겐/테토 테스트 배포 시작 (2025-05-18 완료)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜</strong>: 2025-05-18<br>
	                  <strong>유형</strong>: v1.0.1 배포 완료<br>
	                  <strong>내용:</strong> 프로젝트 배포 및 서비스를 시작하였습니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End Faq item-->
	
	              <div class="faq-item">
	                <h3>✔ v1.0.0 question tree 배포 및 서비스 시작 (2025-05-18 완료)</h3>
	                <div class="faq-content">
	                  <p><strong>날짜:</strong> 2025-05-18<br>
	                  <strong>유형:</strong> v1.0.0 최초 배포 완료<br>
	                  <strong>내용:</strong> 프로젝트 배포 및 서비스를 시작하였습니다.</p>
	                </div>
	                <i class="faq-toggle bi bi-chevron-right"></i>
	              </div><!-- End 구현 및 업데이트 item-->
	            </div>
	          </div><!-- End 구현 및 업데이트 Column-->
	        </div>
	      </div>
	    </section><!-- /구현 및 업데이트 Section -->
	</main>

	<!-- layout: 헤더 영역 -->
	<%@ include file="../layout/footer.jsp"%>

</body>

</html>