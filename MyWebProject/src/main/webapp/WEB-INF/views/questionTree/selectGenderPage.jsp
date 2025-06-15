<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <jsp:include page="../layout/meta.jsp" />
  
  <!-- 구글 애드센스에서 소스를 읽어 광고를 적정한 위치에 넣음. -->
	<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-5509463812555494"
	     crossorigin="anonymous"></script>
</head>

<body class="starter-page-page">

  <!-- layout: 헤더 영역 -->
  <%@ include file="../layout/header.jsp" %>

  <main class="main">
    <!-- Page Title -->
    <div class="page-title" data-aos="fade">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0">1단계</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="/">에겐 / 테토 테스트</a></li>
            <li class="current">1단계: 성별 선택</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

    <!-- Starter Section Section -->
    <section id="pricing" class="pricing section">

	    <!-- Section Title -->
	    <div class="container section-title" data-aos="fade-up">
	      <h2>성별 선택</h2>
	      <p>에겐/테토 성향을 찾기 전에, 먼저 성별을 알려주세요!<br></p>
	    </div><!-- End Section Title -->
	    
	    <%
	    int mSize = (int) request.getAttribute("mSize");
	    int wSize = (int) request.getAttribute("wSize");
	    %>
	
		<div class="container">
		  <div class="row gy-4">
	      	<div class="col-lg-6" data-aos="zoom-in" data-aos-delay="100">
				<form id="mensQustionPageForm" method="post" action="/selectGenderPage">
				    <input type="hidden" name="gender" id="menInput">
		        	<div class="pricing-item">
		          		<h3><i class="fas fa-mars"></i> 남자</h3>
				        <p class="description"><strong>에겐남인지 테토남인지</strong> 구분해 드릴게요.</p>
				        <h4><sup></sup><div class="participant-count"><%= mSize %></div><span> 명이 참여했어요.</span></h4>
				        <a onclick="submitForm('M')" class="cta-btn">
				        	<span>에겐남 / 테토남 테스트</span>
				        	<i class="bi bi-arrow-right"></i>
				        </a>
		        	</div>
		    	</form>
		      </div><!-- End Pricing Item -->
		      <div class="col-lg-6" data-aos="zoom-in" data-aos-delay="100">
		    	<form id="womensQustionPageForm" method="post" action="/selectGenderPage">
			    	<input type="hidden" name="gender" id="womenInput">
		        	<div class="pricing-item">
		          	<h3><i class="fas fa-venus"></i> 여자</h3>
		          	<p class="description"><strong>에겐녀인지 테토녀인지</strong> 구분해 드릴게요.</p>
		          	<h4><sup></sup><div class="participant-count"><%= wSize %></div><span> 명이 참여했어요.</span></h4>
		          	<a onclick="submitForm('W')" class="cta-btn">
		            	<span>에겐녀 / 테토녀 테스트</span>
	  	            	<i class="bi bi-arrow-right"></i>
		          	</a>
		        	</div>
		    	</form>
	    	  </div><!-- End Pricing Item -->
		  </div>
		</div>
	  
		<script>
		function submitForm(gender) {
			// alert("gender: " + gender);
			if ('M' === gender) {
				document.getElementById('menInput').value = gender;
				document.getElementById('mensQustionPageForm').submit();
			} else {
				document.getElementById('womenInput').value = gender;
				document.getElementById('womensQustionPageForm').submit();
			}
		}
		</script>
	  
    </section><!-- /Starter Section Section -->

    <!-- 테토/에겐 유형 설명 -->
  	<%@ include file="../tetoEganType/tetoEganType.jsp" %>
  	
    <!-- Start advertisement -->
	<div class="container text-center mt-5" data-aos="fade-up" data-aos-delay="100">
		<div class="row">
	    	<div class="col">
				<ins class="kakao_ad_area" style="display:none;"
				data-ad-unit = "DAN-9vMBQ2MSqzBLYWs4"
				data-ad-width = "300"
				data-ad-height = "250"></ins>
				<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
			</div>
	    	<div class="col">
				<script src="https://ads-partners.coupang.com/g.js"></script>
				<script>
					new PartnersCoupang.G({"id":866233,"template":"carousel","trackingCode":"AF9633124","width":"300","height":"250","tsource":""});
				</script>
			</div>
		</div>
	</div>
	<!-- End advertisement -->
	
  </main>

  <!-- layout: 헤더 영역 -->
  <%@ include file="../layout/footer.jsp" %>
  
</body>

</html>