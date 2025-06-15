<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <jsp:include page="./layout/meta.jsp" />
  
  <!-- 구글 애드센스에서 소스를 읽어 광고를 적정한 위치에 넣음. -->
	<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-5509463812555494"
	     crossorigin="anonymous"></script>
</head>

<body class="index-page">

  <!-- layout: 헤더 영역 -->
  <%@ include file="./layout/header.jsp" %>
  
  <%
  int participant = (int) request.getAttribute("participant");
  %>

  <main class="main">
    <!-- Start QuestionTree Section -->
    <section id="hero" class="hero section">
      <div class="hero-bg">
        <img src="img/hero-bg-light.webp" alt="">
      </div>
      <div class="container text-center">
      	<div class="d-flex flex-column justify-content-center align-items-center">
          	<h1 data-aos="fade-up"><span> 에겐 VS 테토</span> 테스트</h1>
          	<p data-aos="fade-up" data-aos-delay="100">넌 에겐이야? 테토야? - 현대남녀 구분법!<br></p>
			<div class="d-flex mt-1" data-aos="fade-up" data-aos-delay="100">
			  <a href="/selectGenderPage" class="btn-get-started"><span>테스트 시작</span><i class="bi bi-arrow-right"></i></a>
			  <a href="/viewEgenTetoSummaryPage" class="btn-watch-video d-flex align-items-center"><i class="bi bi-vignette"></i><span>에겐/테토 통계</span></a>
			</div>
			<div class="d-flex mt-4" data-aos="fade-up" data-aos-delay="200">
				<div class="pricing">
				  	<h4><span>현재까지 </span><div class="participant-count"><%= participant %></div><span> 명이 참여했어요!</span></h4>
				</div>          
			</div>          
			<div class="">
			  <img src="img/indexPageImg.webp" class="img-fluid hero-img" alt="" data-aos="zoom-out" data-aos-delay="300">
			</div>
      	</div>
      </div>
    </section>
    <!-- End QuestionTree Section -->
    

    <!-- 테토/에겐 유형 설명 -->
  	<%@ include file="./tetoEganType/tetoEganType.jsp" %>

	<!-- About Section -->
    <section id="about" class="about section">

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-6 content" data-aos="fade-up" data-aos-delay="100">
            <p class="who-we-are">현대남녀 구분법!</p>
            <h3>넌 에겐이야? 테토야?</h3>
            <p class="fst-italic">
              친구가 보는 나는 에겐인데, 나는 테토라고 생각한다고? <br>
                당황하지 말고 퀴즈로 확인해 봐요, 결과가 다 말해줄 테니까요!
            </p>
            <ul>
              <li><i class="bi bi-check-circle"></i> <span>성향에 맞는 연애 조언부터 찰떡 궁합까지 알려줘요.</span></li>
              <li><i class="bi bi-check-circle"></i> <span>서로의 차이를 이해하는 것만으로도, 관계는 훨씬 편안해질 수 있어요.</span></li>
              <li><i class="bi bi-check-circle"></i> <span>나도 몰랐던 내 성향이 궁금하다면 지금 바로 테스트 해보세요!</span></li>
            </ul>
            <a href="/selectGenderPage" class="read-more"><span>테스트 시작</span><i class="bi bi-arrow-right"></i></a>
          </div>

          <div class="col-lg-6 about-images" data-aos="fade-up" data-aos-delay="200">
            <div class="col-12">
              <div class="row gy-4">
                <div class="col-6 col-xl-6 col-lg-6">
                  <img src="img/indexImg/indexImg-3-1.webp" class="img-fluid" alt="">
                </div>
                <div class="col-6 col-xl-6 col-lg-6">
                  <img src="img/indexImg/indexImg-3-2.webp" class="img-fluid" alt="">
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- /About Section -->
    
    <!-- Start advertisement -->
	<div class="container text-center my-3" data-aos="fade-up" data-aos-delay="100">
		<ins class="kakao_ad_area" style="display:none;"
		data-ad-unit = "DAN-gDrxaFvbUdO5zYRz"
		data-ad-width = "300"
		data-ad-height = "250"></ins>
		<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
	</div>

    <!-- Testimonials Section -->
    <section id="testimonials" class="testimonials section light-background">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2><span>에겐 VS 테토</span> 리뷰</h2>
        <p>에겐 / 테토 테스트를 진행한 사용자의 다양한 반응들!</p>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="swiper init-swiper">
          <script type="application/json" class="swiper-config">
            {
              "loop": true,
              "speed": 600,
              "autoplay": {
                "delay": 5000
              },
              "slidesPerView": "auto",
              "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
              },
              "breakpoints": {
                "320": {
                  "slidesPerView": 1,
                  "spaceBetween": 40
                },
                "1200": {
                  "slidesPerView": 3,
                  "spaceBetween": 1
                }
              }
            }
          </script>
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  ㅋㅋ 저 테토녀 나왔어요... 친구가 자꾸 인정하래요;; 재밌고 깔끔해서 좋았어요. 다음에 연애 궁합도 보고 싶음!
                </p>
                <div class="profile mt-auto">
                  <img src="img/testerImg/tester1.webp" class="testimonial-img" alt="" style="width: 90px; height: 90px;">
                  <h3>ujin_777</h3>
                  <h4>테토녀</h4>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  테토 에겐이 요즘 유행이라 궁금했는데 테스트가 있길래 해봤어요!! 잘 맞는 것 같아요😎
                </p>
                <div class="profile mt-auto">
                  <img src="img/testerImg/tester2.webp" class="testimonial-img" alt=""  style="width: 90px; height: 90px;">
                  <h3>U4</h3>
                  <h4>테토녀</h4>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  결과에 연애 성향까지 나오는 거 신박했어요. 에겐남이랑 잘 맞는다는데 주변엔 다 테토 뿐... 😅
                </p>
                <div class="profile mt-auto">
                  <img src="img/testerImg/tester5.webp" class="testimonial-img" alt="">
                  <h3>tkatjd123</h3>
                  <h4>에겐녀</h4>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  테스토스테론/에스트로겐이라는 단어가 들어가 있어서 처음엔 과학적일 줄 알았는데, 의외로 심리 테스트 느낌이라 흥미로웠습니다.
                </p>
                <div class="profile mt-auto">
                  <img src="img/testerImg/tester2.webp" class="testimonial-img" alt="">
                  <h3>yoonbin</h3>
                  <h4>테토남</h4>
                </div>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  요즘 MBTI처럼 가볍게 할 수 있어서 재밌었어요! 결과도 은근 잘 맞고, 친구랑 비교하면서 웃었네요 😊
                </p>
                <div class="profile mt-auto">
                  <img src="img/testerImg/tester4.webp" class="testimonial-img" alt="">
                  <h3>x_xxonxxx</h3>
                  <h4>에겐남</h4>
                </div>
              </div>
            </div><!-- End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>

    </section><!-- /Testimonials Section -->

  </main>

  <!-- layout: 헤더 영역 -->
  <%@ include file="./layout/footer.jsp" %>

</body>

</html>