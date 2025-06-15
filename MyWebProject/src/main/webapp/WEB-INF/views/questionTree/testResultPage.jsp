<%@page import="com.example.MyWebProject.broker.TestUserBroker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<jsp:include page="../layout/meta.jsp" />
	<link href="css/testResult-page.css" rel="stylesheet">
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
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
			<div
				class="container d-lg-flex justify-content-between align-items-center">
				<h1 class="mb-2 mb-lg-0">테스트 결과</h1>
				<nav class="breadcrumbs">
					<ol>
						<li><a href="/">에겐 / 테토 테스트</a></li>
						<li class="current">테스트 결과</li>
					</ol>
				</nav>
			</div>
		</div>
		<!-- End Page Title -->

		<!-- Starter Section Section -->
		<section id="starter-section" class="starter-section section">

			<!-- Section Title -->
			<div class="container section-title pb-2" data-aos="fade-up">
				<h2>나는 에겐? 테토?</h2>
				<p>검사가 모두 완료되었어요! 이제 결과를 확인해 볼까요?</p>
				<br>
				<!-- 
				<button class="goAdBtn btn btn-primary next-page-btn mt-3"
					type="button">
					<span>쿠팡 보고 결과보기 </span><i class="bi bi-arrow-right"></i>
				</button>
				 -->
			</div>
			<!-- End Section Title -->
		</section>

		<!-- 
		<div class="goAdBtn for-ad">
		-->
		<div>
			<section id="starter-section" class="starter-section section p-0">
				<div class="container pt-0 pb-4" data-aos="fade-up">
					<div class="px-2 text-center"
						style="max-width: 900px; width: 90%; margin: 0 auto;">
						<%
						TestUserBroker userBroker = (TestUserBroker) request.getAttribute("userBroker");
						if (userBroker == null) {
							response.sendRedirect("/");
							return;
						}

						String userNo = userBroker.getUserNo();
						String testResultType = userBroker.getTestResultType();
						String styleSelfcareResultType = userBroker.getStyleSelfcareResultType();
						String socialSkillResultType = userBroker.getSocialSkillResultType();
						String innerTendencyResultType = userBroker.getInnerTendencyResultType();
						String ambitionResultType = userBroker.getAmbitionResultType();

						int tetoScore = userBroker.getTetoScore();
						int egenScore = userBroker.getEgenScore();
						int zScore = userBroker.getzScore();
						int topPercent = userBroker.getTopPercent();
						System.out.println(":::::::::::::::::");
						System.out.println("topPercent: " + topPercent);
						System.out.println("zScore: " + zScore);
						int styleSelfcarePoint = userBroker.getStyleSelfcarePoint();
						int socialSkillPoint = userBroker.getSocialSkillPoint();
						int innerTendencyPoint = userBroker.getInnerTendencyPoint();
						int ambitionPoint = userBroker.getAmbitionPoint();
						
						String styleSelfcarePointStr = ( 0 == styleSelfcarePoint ) ? "에겐 반 테토 반" : "총 " + styleSelfcarePoint + "점";
						String socialSkillPointStr = ( 0 == socialSkillPoint ) ? "에겐 반 테토 반" : "총 " + socialSkillPoint + "점";
						String innerTendencyPointStr = ( 0 == innerTendencyPoint ) ? "에겐 반 테토 반" : "총 " + innerTendencyPoint + "점";
						String ambitionPointStr = ( 0 == ambitionPoint ) ? "에겐 반 테토 반" : "총 " + ambitionPoint + "점";
						
						System.out.println("styleSelfcarePointStr: " + styleSelfcarePointStr);
						System.out.println("socialSkillPointStr: " + socialSkillPointStr);
						System.out.println("innerTendencyPointStr: " + innerTendencyPointStr);
						System.out.println("ambitionPointStr: " + ambitionPointStr);

						Boolean tetoFlag = testResultType.startsWith("테토") ? true : false;
						Boolean menFlag = testResultType.endsWith("남") ? true : false;
						%>
						<!-- 
						<h5>tetoScore: <%=tetoScore%></h5>
						<h5>egenScore: <%=egenScore%></h5>
		       			-->
						<%
						if (tetoFlag && menFlag) {
						%>
						<img src="img/tetoNamImg.webp" class="img-fluid mb-3 height-limit"
							style="">
						<h5>
							<span class="fs-3 fw-bold text-teto">상위 <%=topPercent%>%
								<%=testResultType%></span>입니다!
						</h5>
						<%
						} else if (!tetoFlag && menFlag) {
						%>
						<img src="img/egenNamImg.webp" class="img-fluid mb-3 height-limit"
							style="">
						<h5>
							<span class="fs-3 fw-bold text-egen">상위 <%=topPercent%>%
								<%=testResultType%></span>입니다!
						</h5>
						<%
						} else if (tetoFlag && !menFlag) {
						%>
						<img src="img/tetoNuImg.webp" class="img-fluid mb-3 height-limit"
							style="">
						<h5>
							<span class="fs-3 fw-bold text-teto">상위 <%=topPercent%>%
								<%=testResultType%></span>입니다!
						</h5>
						<%
						} else {
						%>
						<img src="img/egenNuImg.webp" class="img-fluid mb-3 height-limit"
							style="">
						<h5>
							<span class="fs-3 fw-bold text-egen">상위 <%=topPercent%>%
								<%=testResultType%></span>입니다!
						</h5>
						<%
						}
						%>
						<p class="text-secondary">백분위는 에겐/테토 영역별 상세점수 결과를 바탕으로 산출합니다</p>
					</div>
				</div>
				<div id="chatContainer" style="max-width: 500px; width: 90%; height: 220px; margin: 0 auto;" data-aos="fade-up" data-aos-delay="100"></div>
				<div style="max-width: 460px; width: 90%; margin: 0 auto;" data-aos="fade-up" data-aos-delay="200">
					<div class="row">
						<%
						if (tetoFlag) {
						%>
						<div class="col-auto me-auto">
							<img src="img/TImg.webp" class="img-fluid" style="height: 80px;">
						</div>
						<div class="col-auto">
							<img src="img/EImg-deafult.webp" class="img-fluid"
								style="height: 80px;">
						</div>
						<%
						} else {
						%>
						<div class="col-auto me-auto">
							<img src="img/TImg-deafult.webp" class="img-fluid"
								style="height: 80px;">
						</div>
						<div class="col-auto">
							<img src="img/EImg.webp" class="img-fluid" style="height: 80px;">
						</div>
						<%
						}
						%>
					</div>
				</div>
				<div style="max-width: 800px; width: 90%; margin: 0 auto;">						
					<%
					if (tetoFlag && menFlag) {
					%>
					<!-- Start 테토남 상세 분석 살펴보기 Section -->
			    	<section id="faq" class="faq section" data-aos="fade-up" data-aos-delay="100">
						<!-- Start Section Title -->
						<div class="container section-title" data-aos="fade-up">
						  	<h2>상세 분석 살펴보기</h2>
						</div>
						<!-- End Section Title -->
						
						<div class="container">
						  	<div class="row justify-content-center">
								<h5 class="text-center mb-3">당신의 결과를 기준으로 <span class="fs-3 fw-bold text-teto"><%= testResultType %></span>에 대해서 설명드릴게요.</h5>
						    	<div class="col-lg-10">
									<div class="faq-container">
									
									  	<!-- End 종합적인 평가 item-->
										<div class="faq-item faq-active">
											<h3>📋 종합적인 평가 [<%= testResultType %> (총 <%= egenScore %>점)]</h3>
									  		<div class="faq-content">
									    		<p>종합적으로 당신은 <strong>'테스토스테론(testosterone)'이 많이 느껴지는 <span class="fw-bold text-teto"><%= testResultType %></span></strong>입니다.<br><br>
								    			<strong><span class="fw-bold text-teto">테토남</span>은 직선적이고 추진력</strong>이 강하며, 상황을 주도하는 <strong>리더형 성향</strong>이에요.<br><br>
								    			(종합적인 평가는 아래 하위 상세 영역을 바탕으로 산출합니다.)<br> 
								    			</p>
									  		</div>
										  	<i class="faq-toggle bi bi-chevron-right"></i>
										</div>
										<!-- End 종합적인 평가 item-->
						
										<!-- Start 외적 스타일 및 자기관리 item-->
								        <div class="faq-item">
								          	<h3>😎 외적 스타일 및 자기관리 [<%= styleSelfcareResultType %> (<%= styleSelfcarePointStr %>)]</h3>
								          	<div class="faq-content">
		            							<%
												if ("스타일 테토형".equals(styleSelfcareResultType)) {
												%>
												<p>⚙️ 당신은 기본적인 테토남의 성향대로 실용성과 효율성을 중시하며, 스타일이나 외모 관리에 크게 시간이나 공을 들이지 않는 편입니다.<br><br>
												다른 분야에서는 계획적일 수 있으나, 외모 관리에서는 간편함과 편안함을 우선시하며 다소 무관심한 모습을 보일 수 있습니다.<br><br>
												유행에 민감하기보다 자신에게 편한대로 입고 관리하는 기본적인 성향을 보입니다.</p>
												<%
												} else if ("스타일 에겐형".equals(styleSelfcareResultType)) {
												%>
												<p>📉 당신은 테토남의 특징인 철저한 계획성과 효율성을 외모 관리에서도 발휘하는 분입니다.<br><br>
												유행에 휩쓸리지 않고 자신에게 맞는 스타일을 정해 꾸준히 관리하며, 준비 과정에서도 오차 없이 딱 떨어지는 것을 선호합니다.<br><br>
												자신을 가꾸는 행위 자체를 중요한 일과로 여기고, 이를 통해 얻는 깔끔함과 정돈된 모습에서 오는 만족감을 즐깁니다.</p>
												<%
												} else {
												%>
												<p>🎁 당신은 기본적인 테토남의 실용성을 중시하지만, 외모 관리에 있어서는 아주 철저하지도, 그렇다고 완전히 무관심하지도 않은 균형 잡힌 모습을 보입니다. <br><br>
												어느 정도 계획을 세우고 관리하려 하지만, 상황이나 기분에 따라 유연하게 조절하기도 합니다. <br><br>
												자신에게 맞는 스타일을 선호하지만, 때로는 새로운 시도를 하거나 주변의 추천을 받아들이기도 하는 열린 태도를 가지고 있습니다.</p>
												<%
												}
												%>
							          		</div>
								          	<i class="faq-toggle bi bi-chevron-right"></i>
						        		</div>
						        		<!-- End 외적 스타일 및 자기관리 item-->
						
								        <!-- Start 사회성 및 인간관계 item-->
								        <div class="faq-item">
											<h3>🙌 사회성 및 인간관계 [<%= socialSkillResultType %> (<%= socialSkillPointStr %>)]</h3>
											<div class="faq-content">
												<%
												if ("사회적 테토형".equals(socialSkillResultType)) {
												%>
												<p>🗣️ 당신은 관계에서도 논리적이고 주도적인 테토남의 특징이 두드러집니다.<br><br>
												대화나 모임에서 리더 역할을 자연스럽게 맡거나, 문제 상황 발생 시 감정보다는 사실과 논리로 해결하려 합니다.<br><br>
												신뢰를 기반으로 한 관계를 중요하게 생각하며, 자신의 의견을 솔직하고 직설적으로 표현하는 편입니다. 때로는 차갑게 느껴질 수 있으나, 당신의 명확함이 관계의 방향을 제시합니다.</p>
												<%
												} else if ("사회적 에겐형".equals(socialSkillResultType)) {
												%>
												<p>👂 당신은 기본적인 테토남의 성향은 가졌지만, 사회성 및 인간관계 영역에서는 다소 어려움을 느낄 수 있습니다.<br><br>
												논리적인 사고방식을 가지고 있지만, 이를 관계 속에서 유연하게 활용하기보다는 침묵하거나 고집을 부릴 수 있습니다.<br><br>
												감정적인 소통을 어색해하고, 갈등 상황에서 비협조적이거나 회피적인 모습을 보일 수 있습니다.</p>
												<%
												} else {
												%>
												<p>👍 당신은 기본적인 테토남의 논리적인 사고방식을 관계에서도 활용하지만, 사람들의 감정이나 분위기도 어느 정도 고려하는 편입니다. <br><br>
												대화를 이끌어가기도 하지만, 경청하는 역할도 할 수 있습니다. <br><br>
												갈등이 생기면 해결하려 하지만, 때로는 완곡하게 표현하거나 중재하려 노력하는 등 유연한 모습을 보입니다. <br><br>
												관계에서 효율성과 인간적인 측면 사이에서 균형을 찾으려 합니다.</p>
												<%
												}
												%>
											</div>
											<i class="faq-toggle bi bi-chevron-right"></i>
								        </div>
								        <!-- End 사회성 및 인간관계 item-->
						
								        <!-- Start 내면 성향 및 감정 처리 방식 item-->
								        <div class="faq-item">
								          	<h3>📌 내면 성향 및 감정 처리 방식 [<%= innerTendencyResultType %> (<%= innerTendencyPointStr %>)]</h3>
								          	<div class="faq-content">
		           								<%
												if ("내면 테토형".equals(innerTendencyResultType)) {
												%>
												<p>🔧 당신은 감정에 휘둘리기보다 이성적으로 상황을 판단하고 해결책을 찾는 테토남의 내면 성향이 강합니다.<br><br>
												스트레스 상황에서도 감정을 억누르고 문제 자체에 집중하며, 자신의 실수에 대한 비판을 감정적으로 받아들이기보다 분석하여 개선하려 합니다.<br><br>
												과거의 후회나 아쉬움에 오래 머물지 않고 현실에 집중하는 편이며, 감정을 솔직하게 드러내는 것보다 논리적으로 상황을 설명하는 것을 더 편하게 느낍니다.</p>
												<%
												} else if ("내면 에겐형".equals(innerTendencyResultType)) {
												%>
												<p>😔 당신은 기본적인 테토남의 성향은 가졌지만, 감정 처리에서는 어려움을 겪을 수 있습니다.<br><br>
												감정을 느끼지 않는 것은 아니지만, 이를 인지하고 표현하는 데 서툴러 감정을 억누르거나 회피하려 할 수 있습니다.<br><br>
												스트레스 상황에서 문제 해결보다는 감정적으로 경직되거나 방어적인 모습을 보일 수 있습니다.</p>							
												<%
												} else {
												%>
												<p>📌 당신은 기본적인 테토남의 이성적인 사고방식을 가지고 있지만, 감정을 완전히 배제하지는 않습니다. <br><br>
												감정을 느끼고 인지하지만, 이를 논리적으로 이해하거나 조절하려 노력합니다. <br><br>
												스트레스 상황에서 문제 해결에 집중하려 하지만, 감정적인 어려움도 함께 느낄 수 있습니다. <br><br>
												내면의 생각과 감정 사이에서 균형을 찾으려 하는 성향을 보입니다.</p>
												<%
												}
												%>
											</div>
											<i class="faq-toggle bi bi-chevron-right"></i>
								        </div>
								        <!-- End 내면 성향 및 감정 처리 방식 item-->
						
								        <!-- Start 야망 및 인생태도 item-->
								        <div class="faq-item">
								          	<h3>🎖 야망 및 인생 태도 [<%= ambitionResultType %> (<%= ambitionPointStr %>)]</h3>
								          	<div class="faq-content">
		            							<%
												if ("야망 테토형".equals(ambitionResultType)) {
												%>
												<p>🏆 당신은 명확한 목표와 강한 의지를 바탕으로 성공을 향해 나아가는 테토남의 야망을 지녔습니다.<br><br>
												사회적인 인정, 경제적 성취 등 구체적이고 눈에 보이는 결과를 중요하게 생각하며, 경쟁에서 이기려는 승부욕이 강합니다.<br><br>
												어려운 상황에도 쉽게 포기하지 않고 끈기 있게 노력하며, 목표 달성을 위해 필요한 경우 감정적인 부분은 잠시 유보할 수 있습니다.<br><br>
												당신의 강한 추진력과 확신이 목표 달성의 원동력입니다.</p>
												<%
												} else if ("야망 에겐형".equals(ambitionResultType)) {
												%>
												<p>🕊️ 당신은 기본적인 테토남의 성향은 가졌지만,<br><br>
												야망 및 인생 태도 영역에서는 덜 경쟁적이거나 목표 지향적일 수 있습니다.<br><br>
												논리적이고 효율성을 중시하지만, 전통적인 성공이나 경쟁보다는 안정적이거나 예측 가능한 삶을 선호할 수 있습니다.<br><br>
												목표를 세우더라도 강하게 밀어붙이기보다 상황에 맞춰 유연하게 조절하는 경향을 보입니다.</p>
												<%
												} else {
												%>
												<p>😎 당신은 기본적인 테토남의 논리적이고 목표 지향적인 성향을 가지고 있지만, 성공 자체보다는 과정이나 개인적인 만족도 함께 고려합니다. <br><br>
												어느 정도의 야망을 가지고 계획을 세우지만, 삶의 다른 영역(관계, 행복 등)과의 균형도 중요하게 생각합니다. <br><br>
												도전적인 목표를 추구하기도 하지만, 안정성이나 현실 가능성도 함께 고려하는 유연함을 보입니다.</p>
												<%
												}
												%>
								        	</div>
								         	<i class="faq-toggle bi bi-chevron-right"></i>
						        		</div>
						        		<!-- End 야망 및 인생태도 item-->
						      		</div>
						    	</div>
							</div>
						</div>
					</section>
					<%
					} else if (tetoFlag && !menFlag) {
					%>
					<!-- Start 테토녀 상세 분석 살펴보기 Section -->
			    	<section id="faq" class="faq section" data-aos="fade-up" data-aos-delay="100">
						<!-- Start Section Title -->
						<div class="container section-title" data-aos="fade-up">
						  	<h2>상세 분석 살펴보기</h2>
						</div>
						<!-- End Section Title -->
						
						<div class="container">
						  	<div class="row justify-content-center">
								<h5 class="text-center mb-3">당신의 결과를 기준으로 <span class="fs-3 fw-bold text-teto"><%= testResultType %></span>에 대해서 설명드릴게요.</h5>
						    	<div class="col-lg-10">
									<div class="faq-container">
									
									  	<!-- End 종합적인 평가 item-->
										<div class="faq-item faq-active">
											<h3>📋 종합적인 평가 [<%= testResultType %> (총 <%= egenScore %>점)]</h3>
									  		<div class="faq-content">
									    		<p>종합적으로 당신은 <strong>'테스토스테론(testosterone)'이 많이 느껴지는 <span class="fw-bold text-teto"><%= testResultType %></span></strong>입니다.<br><br>
								    			<strong><span class="fw-bold text-teto">테토녀</span>는 자신감 있고 주체적인 성격</strong>으로, <strong>원하는 것을 똑 부러지게 표현하는 타입</strong>이에요.<br><br>
								    			(종합적인 평가는 아래 하위 상세 영역을 바탕으로 산출합니다.)</p>
									  		</div>
										  	<i class="faq-toggle bi bi-chevron-right"></i>
										</div>
										<!-- End 종합적인 평가 item-->
						
										<!-- Start 외적 스타일 및 자기관리 item-->
								        <div class="faq-item">
								          	<h3>😎 외적 스타일 및 자기관리 [<%= styleSelfcareResultType %> (<%= styleSelfcarePointStr %>)]</h3>
								          	<div class="faq-content">
		            							<%
												if ("스타일 테토형".equals(styleSelfcareResultType)) {
												%>
												<p>📉 당신은 기본적인 테토녀의 성향대로 실용성과 효율성을 중시하며, 스타일이나 외모 관리에 크게 공을 들이지 않는 편입니다. <br><br>
												다른 분야에서는 계획적이고 논리적일 수 있으나, 외모 관리는 다소 즉흥적이거나 우선순위에서 밀릴 수 있습니다. <br><br>
												꾸준한 관리 루틴보다는 편의성을 추구하는 테토녀의 기본적인 성향이 나타납니다.</p>
												<%
												} else if ("스타일 에겐형".equals(styleSelfcareResultType)) {
												%>
												<p>⚙️ 당신은 테토녀의 특징인 독립성과 합리성을 스타일 관리에 적용하는 분입니다. <br><br>
												쇼핑도 계획적으로, 필요한 것만 구매하는 효율성을 중시하며, 자신만의 확고한 스타일 기준이 있어 유행에 쉽게 흔들리지 않습니다. <br><br>
												자신을 가꾸는 행위를 스스로의 만족을 위한 투자로 여기고, 칭찬에도 크게 동요하지 않고 담담함을 유지합니다.</p>
												<%
												} else {
												%>
												<p>🎲 당신은 기본적인 테토녀의 실용성을 중시하지만, 외모 관리에 있어서는 아주 엄격한 기준을 적용하지는 않는 편입니다. <br><br>
												자신에게 필요한 물건이나 어울리는 스타일을 합리적으로 선택하려 하지만, 때로는 기분 전환을 위해 충동적인 쇼핑이나 새로운 스타일을 시도하기도 합니다. <br><br>
												자기 관리 루틴도 중요하게 생각하지만, 완벽하게 지키기보다는 유연하게 대처하는 실용적인 모습을 보입니다.</p>
												<%
												}
												%>
							          		</div>
								          	<i class="faq-toggle bi bi-chevron-right"></i>
						        		</div>
						        		<!-- End 외적 스타일 및 자기관리 item-->
						
								        <!-- Start 사회성 및 인간관계 item-->
								        <div class="faq-item">
											<h3>🙌 사회성 및 인간관계 [<%= socialSkillResultType %> (<%= socialSkillPointStr %>)]</h3>
											<div class="faq-content">
												<%
												if ("사회적 테토형".equals(socialSkillResultType)) {
												%>
												<p>🗣️ 당신은 기본적인 테토녀의 성향은 가졌지만, 사회성 및 인간관계 영역에서는 어려움을 느낄 수 있습니다. <br><br>
												논리적이고 독립적인 성향 때문에 감정적인 교류나 공감하는 데 서툴 수 있으며, 이로 인해 관계에서 오해를 사거나 고립감을 느낄 수 있습니다. <br><br>
												자신의 솔직한 의견 표현이 때로는 상처가 될 수 있습니다.</p>
												<%
												} else if ("사회적 에겐형".equals(socialSkillResultType)) {
												%>
												<p>👂 당신은 기본적인 테토녀의 성향대로 관계에서도 효율적이고 합리적인 판단을 중시하는 분입니다. <br><br>
												약속을 잡을 때 가장 효율적인 방안을 제안하거나, 인간관계에서 감정적인 문제보다 신뢰와 원칙을 더 중요하게 생각합니다. <br><br>
												친구들과의 대화에서는 감정적인 이야기보다 정보 교환이나 관심사 공유를 선호하는 테토녀의 기본적인 성향이 강하게 나타납니다.</p>
												<%
												} else {
												%>
												<p>✨ 당신은 기본적인 테토녀의 합리성을 바탕으로 관계를 맺지만, 사람들과의 감정적인 교류도 어느 정도 필요하다고 느낍니다. <br><br>
												관계에서 효율성과 신뢰를 중요하게 생각하면서도, 가까운 사람에게는 자신의 감정이나 생각을 표현하기도 합니다. <br><br>
												불필요한 감정 소모를 피하려 하지만, 관계 유지를 위해 필요한 노력은 기꺼이 하는 유연함을 보입니다.</p>
												<%
												}
												%>
											</div>
											<i class="faq-toggle bi bi-chevron-right"></i>
								        </div>
								        <!-- End 사회성 및 인간관계 item-->
						
								        <!-- Start 내면 성향 및 감정 처리 방식 item-->
								        <div class="faq-item">
								          	<h3>📌 내면 성향 및 감정 처리 방식 [<%= innerTendencyResultType %> (<%= innerTendencyPointStr %>)]</h3>
								          	<div class="faq-content">
		           								<%
												if ("내면 테토형".equals(innerTendencyResultType)) {
												%>
												<p>🔧 당신은 기본적인 테토녀의 성향대로 이성적인 평정심을 바탕으로 감정을 관리하는 분입니다. <br><br>
												화가 나거나 속상할 때도 감정에 휘둘리기보다 상황을 객관적으로 파악하고 이성적으로 대처하려 노력합니다. <br><br>
												자신의 감정을 솔직하게 표현하는 것에 어색함을 느끼지만, 내면의 안정을 유지하는 것을 중요하게 생각하는 테토녀의 기본적인 성향이 강합니다.</p>
												<%
												} else if ("내면 에겐형".equals(innerTendencyResultType)) {
												%>
												<p>😔 당신은 기본적인 테토녀의 성향은 가졌지만, 감정 처리에서는 다소 취약한 모습을 보일 수 있습니다. <br><br>
												감정을 억누르려 하지만 잘 되지 않고, 힘든 상황에서 감정적으로 쉽게 동요하거나 압도될 수 있습니다. <br><br>
												자신의 감정을 표현하는 것을 어려워하면서도 내면의 감정 기복으로 인해 힘들어하는 경우가 있습니다.</p>							
												<%
												} else {
												%>
												<p>📌 당신은 기본적인 테토녀의 이성적인 성향을 가지고 있으며, 감정적인 상황에서도 감정을 조절하려 노력합니다. <br><br>
												감정을 느끼고 인지하지만, 이를 논리적으로 이해하고 합리적으로 처리하려 합니다. <br><br>
												때로는 감정적으로 동요하기도 하지만, 빠르게 평정을 되찾으려 하며 내면의 생각과 감정을 균형 있게 다루려 하는 성향을 보입니다.</p>
												<%
												}
												%>
											</div>
											<i class="faq-toggle bi bi-chevron-right"></i>
								        </div>
								        <!-- End 내면 성향 및 감정 처리 방식 item-->
						
								        <!-- Start 야망 및 인생태도 item-->
								        <div class="faq-item">
								          	<h3>🎖 야망 및 인생 태도 [<%= ambitionResultType %> (<%= ambitionPointStr %>)]</h3>
								          	<div class="faq-content">
		            							<%
												if ("야망 테토형".equals(ambitionResultType)) {
												%>
												<p>🏆 당신은 기본적인 테토녀의 성향대로 독립적인 성취욕과 분석적인 태도로 삶의 목표를 향해 나아가는 분입니다. <br><br>
												자신의 커리어나 개인적인 성장에 대한 야망이 크고, 이를 위해 스스로에게 엄격한 기준을 적용합니다. <br><br>
												목표 달성을 위해서는 감정적인 어려움이나 관계의 불편함도 감수할 수 있으며, 자신의 능력에 대해 객관적이고 때로는 냉철한 평가를 내리는 테토녀의 기본적인 성향이 강합니다.</p>
												<%
												} else if ("야망 에겐형".equals(ambitionResultType)) {
												%>
												<p>🕊️ 당신은 기본적인 테토녀의 성향은 가졌지만, 야망 및 인생 태도 영역에서는 덜 경쟁적이거나 성취 지향적일 수 있습니다. <br><br>
												논리적이고 합리적이지만, 전통적인 성공보다는 안정성이나 개인적인 편안함을 우선시할 수 있습니다. <br><br>
												목표를 세우더라도 이를 달성하기 위해 강하게 자신을 몰아붙이기보다 유연하게 접근하는 경향을 보입니다.</p>
												<%
												} else {
												%>
												<p>📋 당신은 기본적인 테토녀의 논리적이고 계획적인 성향을 가지고 있으며, 어느 정도의 야망과 목표 의식을 지니고 있습니다. <br><br>
												자신의 커리어 발전이나 개인적인 성장을 중요하게 생각하지만, 삶의 다른 영역(관계, 행복 등)과의 조화도 함께 고려합니다. <br><br>
												목표를 향해 노력하지만, 너무 과도하게 자신을 몰아붙이기보다 현실적인 수준에서 균형을 찾으려 합니다.</p>
												<%
												}
												%>
								        	</div>
								         	<i class="faq-toggle bi bi-chevron-right"></i>
						        		</div>
						        		<!-- End 야망 및 인생태도 item-->
						      		</div>
						    	</div>
							</div>
						</div>
					</section>
					<%
					} else if (!tetoFlag && menFlag) {
					%>
				    <!-- Start 에겐남 상세 분석 살펴보기 Section -->
			    	<section id="faq" class="faq section" data-aos="fade-up">
						<!-- Start Section Title -->
						<div class="container section-title" data-aos="fade-up" data-aos-delay="100">
						  	<h2>상세 분석 살펴보기</h2>
						</div>
						<!-- End Section Title -->
						
						<div class="container">
						  	<div class="row justify-content-center" data-aos="fade-up" data-aos-delay="200">
								<h5 class="text-center mb-3">당신의 결과를 기준으로 <span class="fs-3 fw-bold text-egen"><%= testResultType %></span>에 대해서 설명드릴게요.</h5>
						    	<div class="col-lg-10">
									<div class="faq-container">
									
					  					<!-- Start 종합적인 평가 item-->
										<div class="faq-item faq-active">
											<h3>📋 종합적인 평가 [<%= testResultType %> (총 <%= egenScore %>점)]</h3>
									  		<div class="faq-content">
									    		<p>종합적으로 당신은 <strong>'에스트로겐(estrogen)'이 많이 느껴지는 <span class="fw-bold text-egen"><%= testResultType %></span></strong>입니다.<br><br>
								    			<strong><span class="fw-bold text-egen">에겐남</span>은 감성적이고 공감 능력</strong>이 뛰어나며, <strong>배려심 깊은 분위기의 소유자</strong>이에요.<br><br>
								    			(종합적인 평가는 아래 하위 상세 영역을 바탕으로 산출합니다.)</p>
									  		</div>
										  	<i class="faq-toggle bi bi-chevron-right"></i>
										</div>
										<!-- End 종합적인 평가 item-->
						
										<!-- Start 외적 스타일 및 자기관리 item-->
								        <div class="faq-item">
								          	<h3>😎 외적 스타일 및 자기관리 [<%= styleSelfcareResultType %>]</h3>
								          	<div class="faq-content">
		            							<%
												if ("스타일 테토형".equals(styleSelfcareResultType)) {
												%>
												<p>👚 당신은 에겐남의 특징인 관계 중심적 성향을 가지고 있지만, 외모 관리 영역에서는 상대적으로 크게 신경 쓰지 않는 편입니다.<br><br>
												사람들과의 감정적인 교류나 관계 자체를 더 중요하게 여기며, 외모 관리가 관계에 미치는 영향에 대해 크게 의식하지 않거나, 이 영역에 시간과 에너지를 투자하는 것을 번거롭게 느낄 수 있습니다.<br><br>
												편안함과 내추럴함을 선호하는 경향이 있습니다.</p>
												<%
												} else if ("스타일 에겐형".equals(styleSelfcareResultType)) {
												%>
												<p>🌸 당신은 기본적인 에겐남의 성향대로 주변의 시선이나 반응에 영향을 받으며 스타일을 즐기는 분입니다.<br><br>
												외모 관리를 통해 기분 전환을 하거나 사람들과의 관계에서 긍정적인 영향을 주기를 바라며, 새로운 스타일이나 트렌드를 시도하는 데 열려 있습니다.<br><br>
												자신을 가꾸는 활동 자체를 즐겁게 생각하는 에겐남의 기본적인 성향이 강하게 나타납니다.</p>
												<%
												} else {
												%>
												<p>✨ 당신은 기본적인 에겐남의 관계 중심적 성향을 가지고 있으며, 외모 관리가 관계에 영향을 준다는 것을 인지하고 있습니다.<br><br>
												주변의 반응이나 유행에 어느 정도 신경 쓰지만, 자신만의 편안함이나 선호도도 함께 고려합니다.<br><br>
												자신을 가꾸는 활동을 즐기기도 하지만, 매일 철저하게 루틴을 지키기보다는 상황에 따라 조절하는 유연함을 보이며, 외모를 통해 자신과 타인 모두에게 긍정적인 기운을 주려 합니다.</p>
												<%
												}
												%>
							          		</div>
								          	<i class="faq-toggle bi bi-chevron-right"></i>
						        		</div>
						        		<!-- End 외적 스타일 및 자기관리 item-->
						
								        <!-- Start 사회성 및 인간관계 item-->
								        <div class="faq-item">
											<h3>🙌 사회성 및 인간관계 [<%= socialSkillResultType %>]</h3>
											<div class="faq-content">
												<%
												if ("사회적 테토형".equals(socialSkillResultType)) {
												%>
												<p>😅 당신은 기본적인 에겐남의 성향대로 사람들과의 관계를 중요하게 생각하지만, 사회성 및 인간관계 영역에서는 다소 서툰 모습을 보일 수 있습니다.<br><br>
												자신의 감정을 표현하거나 타인의 감정에 섬세하게 반응하는 것을 어려워할 수 있으며, 이로 인해 관계에서 불안감을 느끼는 경우가 있을 수 있습니다.<br><br>
												관계를 원하지만 다소 수동적인 에겐남의 기본적인 성향이 나타납니다.</p>
												<%
												} else if ("사회적 에겐형".equals(socialSkillResultType)) {
												%>
												<p>💖 당신은 에겐남의 특징인 뛰어난 공감 능력과 따뜻함을 관계 속에서 잘 드러내는 사람입니다.<br><br>
												상대방의 감정을 잘 읽고 진심으로 공감하며 위로하는 데 능숙합니다.<br><br>
												갈등을 싫어하고 모두가 편안한 분위기를 만들기 위해 노력하며, 새로운 사람에게도 먼저 다가가려 합니다.<br><br>
												관계에서 정서적 안정과 조화를 최우선으로 생각하는, 에겐남 중에서도 사회성이 특히 발달한 유형입니다.</p>
												<%
												} else {
												%>
												<p>✔ 당신은 기본적인 에겐남의 따뜻함과 공감 능력을 가지고 있으며, 관계 속에서 편안하고 친근한 분위기를 만드는 데 기여합니다.<br><br>
												타인의 감정을 어느 정도 살피고 배려하지만, 자신의 의견이나 필요도 적절히 표현할 수 있습니다.<br><br>
												갈등 상황에서도 감정적으로 동요하기보다 원만하게 해결하려 노력하는 등, 관계에서 조화와 개인의 균형을 찾는 원만한 성향을 보입니다.</p>
												<%
												}
												%>
											</div>
											<i class="faq-toggle bi bi-chevron-right"></i>
								        </div>
								        <!-- End 사회성 및 인간관계 item-->
						
								        <!-- Start 내면 성향 및 감정 처리 방식 item-->
								        <div class="faq-item">
								          	<h3>📌 내면 성향 및 감정 처리 방식 [<%= innerTendencyResultType %>]</h3>
								          	<div class="faq-content">
		           								<%
												if ("내면 테토형".equals(innerTendencyResultType)) {
												%>
												<p>📣 당신은 에겐남의 특징인 풍부한 감수성과 개방성을 내면에서 드러내는 분입니다.<br><br>
												자신의 감정을 솔직하게 인정하고 가까운 사람들과 나누며 위로받는 것을 통해 스트레스를 해소합니다.<br><br>
												타인의 아픔에 깊이 공감하고 함께 슬퍼하며, 감정적인 경험(영화, 음악 등)을 통해 정서적 만족을 얻는, 에겐남 중에서도 내면 성향이 특히 발달한 유형입니다.</p>
												<%
												} else if ("내면 에겐형".equals(innerTendencyResultType)) {
												%>
												<p>😂 당신은 기본적인 에겐남의 성향대로 감정은 풍부하지만, 이를 효과적으로 표현하거나 다루는 방법을 몰라 혼란스러워합니다.<br><br>
												타인의 감정에 쉽게 영향을 받지만, 이를 어떻게 처리해야 할지 몰라 위축되거나 방황할 수 있으며, 감정적인 어려움을 혼자 해결하려 하는 에겐남의 기본적인 성향이 나타납니다.</p>							
												<%
												} else {
												%>
												<p>🎲 당신은 기본적인 에겐남의 감수성을 가지고 있으며, 자신의 감정을 느끼고 타인과 나누는 것을 중요하게 생각합니다.<br><br>
												감정적인 어려움이 있을 때 주변의 위로를 구하기도 하지만, 스스로 감정을 다스리려 노력하는 모습도 보입니다. <br><br>
												타인의 감정에 공감하지만, 너무 깊이 몰입하기보다는 적절한 거리를 유지하는 등, 감정 표현과 조절 사이에서 균형을 찾습니다.</p>
												<%
												}
												%>
											</div>
											<i class="faq-toggle bi bi-chevron-right"></i>
								        </div>
								        <!-- End 내면 성향 및 감정 처리 방식 item-->
						
								        <!-- Start 야망 및 인생태도 item-->
								        <div class="faq-item">
								          	<h3>🎖 야망 및 인생 태도 [<%= ambitionResultType %>]</h3>
								          	<div class="faq-content">
		            							<%
												if ("야망 테토형".equals(ambitionResultType)) {
												%>
												<p>😁 당신은 에겐남의 특징인 관계 중심적 가치를 바탕으로 삶을 살아가는 분입니다.<br><br>
												성공이나 성취보다 현재의 행복과 만족, 그리고 소중한 사람들과의 좋은 관계를 최우선으로 생각합니다.<br><br>
												위험을 감수하는 도전보다는 안정성을 추구하며, 어려운 문제에 부딪혔을 때 혼자 해결하기보다 주변 사람들의 도움을 요청하고 함께 나아가는 것을 선호하는, 에겐남 중에서도 관계에서의 성취를 중요하게 생각하는 유형입니다.</p>
												<%
												} else if ("야망 에겐형".equals(ambitionResultType)) {
												%>
												<p>😎 당신은 기본적인 에겐남의 성향대로 안정과 관계를 중시하며, 야망 및 인생 태도 영역에서는 다소 소극적이거나 목표 설정에 어려움을 느낄 수 있습니다.<br><br>
												관계를 중요하게 생각하지만, 자신의 미래나 목표에 대해 구체적으로 계획하거나 적극적으로 나아가는 데 어려움을 느낄 수 있으며, 삶에 대한 막연한 불안감이나 무기력함을 느낄 수도 있는 에겐남의 기본적인 성향이 나타납니다.</p>
												<%
												} else {
												%>
												<p>😎 당신은 기본적인 에겐남의 안정과 관계 중시 성향을 가지고 있지만, 어느 정도의 개인적인 성장이나 목표 달성에도 관심을 가집니다.<br><br>
												삶의 만족과 행복을 중요하게 생각하면서도, 자신의 역할을 충실히 하고 인정받고 싶은 마음도 있습니다.<br><br>
												혼자 해결하기 어려운 문제에 대해서는 주변에 도움을 요청하지만, 스스로의 노력으로 성과를 이루는 것에서도 만족감을 얻는 균형 잡힌 태도를 보입니다.</p>
												<%
												}
												%>
								        	</div>
								         	<i class="faq-toggle bi bi-chevron-right"></i>
						        		</div>
						        		<!-- End 야망 및 인생태도 item-->
						      		</div>
						    	</div>
							</div>
						</div>
					</section>
					<!-- End 상세 분석 살펴보기 Section -->
					<%
					} else {
					%>
					<!-- Start 에겐녀 상세 분석 살펴보기 Section -->
			    	<section id="faq" class="faq section" data-aos="fade-up" data-aos-delay="100">
						<!-- Start Section Title -->
						<div class="container section-title" data-aos="fade-up">
						  	<h2>상세 분석 살펴보기</h2>
						</div>
						<!-- End Section Title -->
						
						<div class="container">
						  	<div class="row justify-content-center">
								<h5 class="text-center mb-3">당신의 결과를 기준으로 <span class="fs-3 fw-bold text-egen"><%= testResultType %></span>에 대해서 설명드릴게요.</h5>
						    	<div class="col-lg-10">
									<div class="faq-container">
									
									  	<!-- End 종합적인 평가 item-->
										<div class="faq-item faq-active">
											<h3>📋 종합적인 평가 [<%= testResultType %> (총 <%= egenScore %>점)]</h3>
									  		<div class="faq-content">
									    		<p>종합적으로 당신은 <strong>'에스트로겐(estrogen)'이 많이 느껴지는 <span class="fw-bold text-egen">에겐녀</span></strong>입니다.<br><br>
								    			<strong><span class="fw-bold text-egen">에겐녀</span>는 섬세하고 따뜻한 감성</strong>을 지녔으며, <strong>주변 사람을 편안하게 해주는 스타일</strong>이에요.<br><br>
								    			(종합적인 평가는 아래 하위 상세 영역을 바탕으로 산출합니다.)</p>
									  		</div>
										  	<i class="faq-toggle 	bi bi-chevron-right"></i>
										</div>
										<!-- End 종합적인 평가 item-->
						
										<!-- Start 외적 스타일 및 자기관리 item-->
								        <div class="faq-item">
								          	<h3>😎 외적 스타일 및 자기관리 [<%= styleSelfcareResultType %> (<%= styleSelfcarePointStr %>)]</h3>
								          	<div class="faq-content">
		            							<%
												if ("스타일 테토형".equals(styleSelfcareResultType)) {
												%>
												<p>👚 당신은 에겐녀의 특징인 관계 중심적 성향을 가지고 있지만, 스타일 및 자기관리 영역에서는 크게 신경 쓰지 않는 편입니다.<br><br>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
												사람들과의 감정 교류나 관계 자체를 매우 중요하게 생각하지만, 외모 관리가 그 관계에 미치는 영향은 적다고 여기거나, 자신을 가꾸는 일에 시간과 에너지를 투자하는 것을 선호하지 않을 수 있습니다.<br><br>  
												편안함과 자연스러움을 중시합니다.</p>
												<%
												} else if ("스타일 에겐형".equals(styleSelfcareResultType)) {
												%>
												<p>👚 당신은 기본적인 에겐녀의 성향대로 섬세한 감수성과 관계 지향성을 스타일 관리에 녹여내는 분입니다.<br><br>  
												자신을 예쁘게 가꾸는 것 자체를 즐기고, 기분에 따라 다양한 스타일 변화를 시도합니다.<br><br>  
												주변 사람들의 반응이나 유행에도 민감하며, 외모 관리가 사람들과의 관계에 긍정적인 영향을 준다고 생각하는 에겐녀의 기본적인 성향이 강합니다.</p>
												<%
												} else {
												%>
												<p>👚 당신은 기본적인 에겐녀의 관계 중심적 성향을 가지고 있으며, 외모 관리가 자신과 타인 모두에게 중요하다고 생각합니다.<br><br>  
												자신을 가꾸는 활동을 즐기기도 하지만, 너무 과도하거나 완벽하게 하려 하기보다는 적절한 수준을 유지합니다.<br><br>  
												주변의 추천이나 유행에도 열려 있지만, 자신에게 맞는 스타일을 선택하는 균형 감각을 보이며, 외모를 통해 자신감과 즐거움을 얻습니다.</p>
												<%
												}
												%>
							          		</div>
								          	<i class="faq-toggle bi bi-chevron-right"></i>
						        		</div>
						        		<!-- End 외적 스타일 및 자기관리 item-->
						
								        <!-- Start 사회성 및 인간관계 item-->
								        <div class="faq-item">
											<h3>🙌 사회성 및 인간관계 [<%= socialSkillResultType %> (<%= socialSkillPointStr %>)]</h3>
											<div class="faq-content">
												<%
												if ("사회적 테토형".equals(socialSkillResultType)) {
												%>
												<p>👂 당신은 기본적인 에겐녀의 성향대로 감수성이 풍부하지만, 사회성 및 인간관계 영역에서는 어려움을 겪을 수 있습니다.<br><br>
												타인의 감정에 민감하게 반응하지만, 이를 어떻게 표현하거나 대처해야 할지 몰라 혼란스러워합니다.<br><br>
												관계에서 쉽게 상처받고 불안감을 느끼며, 솔직한 감정 표현을 어려워하여 속으로 앓는 경우가 많은 에겐녀의 기본적인 성향이 나타납니다.</p>
												<%
												} else if ("사회적 에겐형".equals(socialSkillResultType)) {
												%>
												<p>👂 당신은 주변 사람들의 감정을 잘 읽고 민감하게 반응하는 에겐녀의 성향을 보입니다.<br><br>
												누군가와 의견 충돌 시 상대방의 기분을 상하지 않게 하려 애쓰고, 관계 유지를 위해 자신의 감정이나 의견을 양보하기도 합니다.<br><br>
												소중한 사람과의 관계에서 발생하는 감정적인 문제들로 인해 힘들어하기도 하지만, 뛰어난 공감 능력으로 타인과 깊은 유대감을 형성하는 데 강점을 보입니다.</p>
												<%
												} else {
												%>
												<p>👂 당신은 기본적인 에겐녀의 감수성을 가지고 있으며, 주변 사람들의 감정이나 분위기에 영향을 받지만, 자신만의 생각이나 감정을 완전히 잃지는 않습니다.<br><br>
												관계의 조화를 중요하게 생각하지만, 무조건 양보하기보다 자신의 의견을 부드럽게 표현하기도 합니다. 타인과의 교류를 즐기면서도 적절한 거리를 유지하는 균형 잡힌 모습을 보입니다.</p>
												<%
												}
												%>
											</div>
											<i class="faq-toggle bi bi-chevron-right"></i>
								        </div>
								        <!-- End 사회성 및 인간관계 item-->
						
								        <!-- Start 내면 성향 및 감정 처리 방식 item-->
								        <div class="faq-item">
								          	<h3>📌 내면 성향 및 감정 처리 방식 [<%= innerTendencyResultType %> (<%= innerTendencyPointStr %>)]</h3>
								          	<div class="faq-content">
		           								<%
												if ("내면 테토형".equals(innerTendencyResultType)) {
												%>
												<p>🙌 당신은 에겐녀의 특징인 섬세한 감수성을 바탕으로 내면세계를 경험하는 분입니다.<br><br>
												주변의 작은 자극에도 감정이 쉽게 동요하며, 타인과의 감정적인 교류를 통해 정서적 안정감을 얻습니다.<br><br>
												자신의 감정을 솔직하게 드러내고 타인과 나누는 것을 편안하게 느끼며, 감정적인 문제로 인해 힘들어하기도 하지만 이를 통해 타인과 깊은 유대감을 형성하는, 에겐녀 중에서도 감정 표현이 풍부한 유형입니다.</p>
												<%
												} else if ("내면 에겐형".equals(innerTendencyResultType)) {
												%>
												<p>🙌 당신은 기본적인 에겐녀의 성향대로 감정은 풍부하지만, 이를 효과적으로 표현하거나 관리하는 방법을 몰라 혼란스러워합니다.<br><br>
												타인의 감정에 쉽게 영향을 받지만, 이를 어떻게 처리해야 할지 몰라 위축되거나 방황할 수 있으며, 감정적인 어려움을 혼자 해결하려 하는 에겐녀의 기본적인 성향이 나타납니다.</p>							
												<%
												} else {
												%>
												<p>🙌 당신은 기본적인 에겐녀의 풍부한 감수성을 가지고 있으며, 자신의 감정을 느끼고 표현하는 것을 중요하게 생각합니다.<br><br>
												감정적인 어려움이 있을 때 주변 사람들과 나누며 위로를 받기도 하지만, 스스로 감정을 조절하고 긍정적으로 받아들이려 노력합니다.<br><br>
												타인의 감정에 공감하면서도 자신의 정서적 안정도 함께 고려하는, 균형 잡힌 내면 성향을 보입니다.</p>
												<%
												}
												%>
											</div>
											<i class="faq-toggle bi bi-chevron-right"></i>
								        </div>
								        <!-- End 내면 성향 및 감정 처리 방식 item-->
						
								        <!-- Start 야망 및 인생태도 item-->
								        <div class="faq-item">
								          	<h3>🎖 야망 및 인생 태도 [<%= ambitionResultType %> (<%= ambitionPointStr %>)]</h3>
								          	<div class="faq-content">
		            							<%
												if ("야망 테토형".equals(ambitionResultType)) {
												%>
												<p>👏 당신은 에겐녀의 특징인 따뜻한 감성과 관계 중심적 가치를 바탕으로 삶을 살아가는 분입니다.<br><br>
												구체적인 성취나 사회적 지위보다 행복하고 편안한 삶, 그리고 소중한 사람들과의 깊은 관계를 가장 중요하게 생각합니다. <br><br>
												안정성을 최우선으로 고려하며 위험하거나 불확실한 도전은 피하려 하고, 목표를 향한 과정에서 함께 하는 사람들과의 교류를 소중하게 생각하는, 에겐녀 중에서도 삶에 대한 만족도나 관계적 성취 욕구가 높은 유형입니다.</p>
												<%
												} else if ("야망 에겐형".equals(ambitionResultType)) {
												%>
												<p>👏 당신은 기본적인 에겐녀의 성향대로 관계를 중요하게 생각하지만, 야망 및 인생 태도 영역에서는 다소 수동적이거나 목표 설정에 어려움을 느낄 수 있습니다.<br><br>
												자신의 미래나 삶의 방향에 대해 주체적으로 고민하고 계획하는 데 어려움을 느끼며, 삶에 대한 막연한 불안감이나 불확실성을 느낄 수도 있는 에겐녀의 기본적인 성향이 나타납니다.</p>
												<%
												} else {
												%>
												<p>👏 당신은 기본적인 에겐녀의 안정과 관계 중시 성향을 가지고 있으며, 어느 정도의 개인적인 발전이나 의미 있는 활동에도 관심을 가집니다.<br><br>
												행복하고 편안한 삶을 추구하면서도, 자신이 속한 공동체나 관계 속에서 긍정적인 영향력을 발휘하고 싶어 할 수 있습니다. <br><br>
												큰 야망을 가지고 있지는 않지만, 삶에서 의미와 만족을 찾는 것을 중요하게 생각하는 성향을 보입니다.</p>
												<%
												}
												%>
								        	</div>
								         	<i class="faq-toggle bi bi-chevron-right"></i>
						        		</div>
						        		<!-- End 야망 및 인생태도 item-->
						      		</div>
						    	</div>
							</div>
						</div>
					</section>
					<%
					}
					%>
					
					<script>
						const topPercent = <%= topPercent %>; // 받아온 상위 몇 퍼센트인지 (1~99 정수)
						const isTeto = <%= tetoFlag %>;       // 테토 여부
						
						const tetoScore = <%= tetoScore %>;
						const egenScore = <%= egenScore %>;
						
						console.log("topPercent: " + topPercent);
						
						// X축 계산: 총 201칸 (0~200)
						let xTetoCoord = Math.floor(((topPercent - 1) / 99) * 200 - 100);   // -100 ~ +100
						let xEgenCoord = Math.floor(((100 - topPercent) / 99) * 200 - 100); // -100 ~ +100

						
						function normalDistribution(x, mean, stdDev) {
						  return (1 / (stdDev * Math.sqrt(2 * Math.PI))) * Math.exp(-0.5 * Math.pow((x - mean) / stdDev, 2)) * 1000;
						}
						
						const data = [];
						const mean = 0, stdDev = 1;
						for (let i = -100; i <= 100; i++) {
						  const x = (i) / 35; // 정규분포 형태를 만들기 위한 변환
						  data.push([i, normalDistribution(x, mean, stdDev)]);
						}
						
						Highcharts.chart('chatContainer', {
						  chart: {
						    type: 'area',
						    backgroundColor: 'transparent',
						    spacingTop: 30,
						    spacingBottom: 30,
						  },
						  title: {
						    text: ''
						  },
						  tooltip: {
						    enabled: false
						  },
						  plotOptions: {
						    series: {
						      states: {
						        hover: {
						          enabled: false
						        }
						      },
						      enableMouseTracking: false
						    },
						    area: {
						      marker: {
						        enabled: false
						      },
						      fillOpacity: 0.5,
						    }
						  },
						  legend: {
						    enabled: false
						  },
						  xAxis: {
						    min: -105,
						    max: 105,
						    gridLineWidth: 0,
						    lineWidth: 0,
						    tickWidth: 0,
						    labels: {
						      enabled: false
						    },
						    plotLines: [
						       {
						         color: isTeto ? '#3876f2' : '#de66e9',
						         width: 3,
						         value: isTeto ? xTetoCoord : xEgenCoord,
						         dashStyle: 'Solid',
						         label: {
						           text: isTeto ? '내 위치' : '내 위치',
						           rotation: 0,
						           verticalAlign: 'bottom',
						           textAlign: 'center',
						           y: 20,
						           style: {
						             color: isTeto ? '#3876f2' : '#de66e9',
						             fontWeight: 'bold'
						           }
						         },
						         zIndex: 6
						       }
						     ]
						  },
						  yAxis: {
						    gridLineWidth: 0,
						    lineWidth: 0,
						    tickWidth: 0,
						    labels: {
						      enabled: false
						    },
						    title: {
						      text: ''
						    },
						    max: normalDistribution(0, mean, stdDev)
						  },
						  series: [{
						    name: 'TEData',
						    data: data,
						    color: 'steelblue',
						    fillColor: {
						      linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
						      stops: [
						        [0, 'steelblue'],
						        [1, 'rgba(70, 130, 180, 0)']
						      ]
						    }
						  }]
						});
					</script>
				</div>
				
				<div class="container pt-2 d-flex justify-content-center" data-aos="fade-up">
				    <div class="container mb-3">
				        <div class="pb-1 d-flex flex-wrap justify-content-center" data-aos="fade-up">
				            <a href="/selectGenderPage" 
				               class="btn btn-primary shadow px-3 py-2 mb-3 rounded-pill fw-bold d-flex align-items-center gap-2 mx-3">
				                <i class="fas fa-redo-alt"></i> 테스트 다시하기
				            </a>			            
				            <a onclick="copyLink()" 
				               class="btn btn-primary shadow px-3 py-2 mb-3 rounded-pill fw-bold d-flex align-items-center gap-2 mx-3">
				                <i class="bi bi-copy"></i> 결과 링크 복사
				            </a>
				            <a onclick="saveImage()" 
				               class="btn btn-primary shadow px-3 py-2 mb-3 rounded-pill fw-bold d-flex align-items-center gap-2 mx-3">
				                <i class="bi bi-instagram"></i> 결과 이미지 다운로드
				            </a>
				            <a onclick="shareKakaoAction()" 
				               class="btn btn-primary shadow px-4 py-2 mb-3 rounded-pill fw-bold d-flex align-items-center gap-2 mx-3">
				                <i class="fas fa-comment"></i> 카카오톡 공유
				            </a>
   				            <a href="/viewEgenTetoSummaryPage" 
				               class="btn btn-primary shadow px-3 py-2 mb-3 rounded-pill fw-bold d-flex align-items-center gap-2 mx-3">
				                <i class="bi bi-pie-chart"></i> 에겐/테토 통계
				            </a>	
				        </div>
				    </div>
				</div>

				<div class="copyMessage text-center"><i class="bi bi-clipboard-check-fill"></i> 결과 링크 복사 완료</div>
			    
		    	<!-- 카카오 공유 모달 창 -->
				<div class="modal" tabindex="-1" id="nameInputModal">
					<div class="modal-dialog">
					  	<div class="modal-content" style="margin-top: 30%;">
					    	<div class="modal-header">
					   			<img src="img/kakaoImg.webp" class="img-fluid hero-img" alt="" data-aos="zoom-out" data-aos-delay="100" style="width: 24px;">
					      		<h5 class="modal-title ms-2"> 카카오톡 공유</h5>
					      		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					    	</div>
					    	<div class="modal-body text-center">
					   			<img src="img/indexPageImg.webp" class="img-fluid kakao-popup-img" alt="" data-aos="zoom-out" data-aos-delay="100">
					      
					 		   	<div class="footer" style="padding-bottom: 0;">
								    <div class="container">
										<div class="col-12 footer-newsletter">
											
											<div class="newsletter-form">
												<input type="email" id="userNameInput" placeholder="친구가 볼 내 이름 또는 닉네임을 입력하세요">
												<input onclick="updateUserName()" type="submit" value="공유하기">
											</div>
										</div>
									</div>
								</div>
					    	</div>
					  	</div>
					</div>
				</div>

			</section>
			<!-- /Starter Section Section -->

			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script>
				Kakao.init('f7e8a65417f5e8856b0ae844e6e1e6fb'); // 카카오 JavaScript 키
				
				function shareKakaoAction() {
			      $('#nameInputModal').modal('show');
				}

				function updateUserName() {
				  var userName = document.getElementById('userNameInput').value;
				  
				  // 유효성 검사
				  if (!userName) {
				    document.getElementById('userNameInput').focus();
				    return;
				  }
				
				  if (userName.length > 8) {
				    alert("8자 이내로 입력해주세요.");
				    return;
				  }
				  
				  // 사용자명 입력 확인
				  if (userName) {
				    $.ajax({
				      url: '/updateTestUserName',
				      method: 'POST',
				      data: {
				        userNo: '<%=userNo%>',
				        userName: userName
				      },
				      success: function(response) {
				        if (response.success) {
				          // 성공적으로 업데이트 된 후, 카카오톡 공유 실행
				          $('#nameInputModal').modal('hide');  // 모달 닫기
				          shareKakao(response.userName);
				        } else {
				          alert('사용자명 업데이트 실패 (관리자에게 문의하세요.)');
				        }
				      },
				      error: function(error) {
				        alert('서버 오류 (관리자에게 문의하세요.)');
				      }
				    });
				  }
				}

				function shareKakao(userName) {
				  Kakao.Link.sendDefault({
				    objectType: 'feed',
				    content: {
				      title: '에겐 VS 테토 테스트',
				      description: userName + '님의 테스트 결과는 "<%= testResultType %>"입니다!',
				      imageUrl: 'https://kckoo.co.kr/img/thumbnailShareImg.webp',
				      link: {
				        mobileWebUrl: 'https://kckoo.co.kr/testSharePage?userNo=<%=userNo%>',
				        webUrl: 'https://kckoo.co.kr/testSharePage?userNo=<%=userNo%>'
				      }
				    },
				    buttons: [
				      {
				        title: '결과 보러가기',
				        link: {
				          mobileWebUrl: 'https://kckoo.co.kr/testSharePage?userNo=<%=userNo%>',
				          webUrl: 'https://kckoo.co.kr/testSharePage?userNo=<%=userNo%>'
				        }
				      }
				    ]
				  });
				}
				
			  	function copyLink() {
				    const url = "https://kckoo.co.kr/testSharePage" + "?userNo=<%= userNo %>";

				    navigator.clipboard.writeText(url)
				      .then(() => {
				        const msg = document.querySelector('.copyMessage');
				        msg.style.display = 'block';

				        setTimeout(() => {
				          msg.style.display = 'none';
				        }, 2000);
				      })
				      .catch(err => {
				        alert('복사 실패: ' + err);
				      });
			    }
			</script>

			<!-- Featured Services Section -->
			<section id="featured-services" class="featured-services section light-background">
				<div class="container">
					<h3 class="px-2 py-2" data-aos="fade-up" data-aos-delay="100">
						<strong>에겐/테토 영역별 상세 점수</strong>
					</h3>
					<div class="row gy-4">
						<div class="col-xl-6 col-lg-12 px-4 py-2" data-aos="fade-up"
							data-aos-delay="100">
							<div class="col-xl-6 col-lg-12 mb-3" data-aos="fade-up"
								data-aos-delay="100">
								<span class="testResultType">외적 스타일 및 자기관리</span>
							</div>
							<%
							if ("스타일 테토형".equals(styleSelfcareResultType)) {
							%>
							<div class="d-flex align-items-center">
								<div class="flex-shrink-0 me-3">
									<img src="img/TImg.webp" class="img-fluid" style="height: 80px;">
								</div>
								<div class="flex-grow-1">
									<div class="progress" role="progressbar"
										aria-label="Example with label" aria-valuenow="25"
										aria-valuemin="0" aria-valuemax="100" style="height: 30px">
										<div class="progress-bar"
											style="width: <%=styleSelfcarePoint%>%"><%=styleSelfcarePoint%>점
										</div>
									</div>
								</div>
								<div class="flex-shrink-0 ms-3">
									<img src="img/EImg-deafult.webp" class="img-fluid"
										style="height: 80px;">
								</div>
							</div>
								<%
								if (menFlag) {
								%>
								<p class="text-secondary fw-bold mt-2">깔끔하고 딱 떨어지는 스타일 선호합니다</p>
								<%
								} else {
								%>
								<p class="text-secondary fw-bold mt-2">꾸민 듯 안 꾸민 듯 힙한 스타일을 선호합니다</p>
								<%
								}
								%>
							<%
							} else if ("스타일 에겐형".equals(styleSelfcareResultType)) {
							%>
							<div class="d-flex align-items-center">
								<div class="flex-shrink-0 me-3">
									<img src="img/TImg-deafult.webp" class="img-fluid"
										style="height: 80px;">
								</div>
								<div class="flex-grow-1">
									<div class="progress flex-row-reverse" role="progressbar"
										aria-label="Example with label" aria-valuenow="25"
										aria-valuemin="0" aria-valuemax="100" style="height: 30px">
										<div class="progress-reverse-bar"
											style="width: <%=styleSelfcarePoint%>%"><%=styleSelfcarePoint%>점
										</div>
									</div>
								</div>
								<div class="flex-shrink-0 ms-3">
									<img src="img/EImg.webp" class="img-fluid" style="height: 80px;">
								</div>
							</div>
							<div class="d-flex flex-row-reverse">
								<%
								if (menFlag) {
								%>
								<p class="text-secondary fw-bold mt-2">정돈된 느낌보다는 편안한 스타일을 선호합니다</p>
								<%
								} else {
								%>
								<p class="text-secondary fw-bold mt-2">여성스럽고 아기자기한 스타일 선호합니다</p>
								<%
								}
								%>
							</div>
							<%
							} else {
							%>
							<div class="d-flex align-items-center">
								<div class="flex-shrink-0 me-3">
									<img src="img/TImg.webp" class="img-fluid" style="height: 80px;">
								</div>
								<div class="flex-grow-1">
									<div class="progress-stacked" style="height: 30px;">
										<div class="progress" role="progressbar"
											aria-label="Segment one" aria-valuenow="15" aria-valuemin="0"
											aria-valuemax="100" style="width: 50%; height: 30px;">
											<div class="progress-bar" style="height: 30px;">50점</div>
										</div>
										<div class="progress" role="progressbar"
											aria-label="Segment two" aria-valuenow="30" aria-valuemin="0"
											aria-valuemax="100" style="width: 50%; height: 30px;">
											<div class="progress-bar" style="background-color: #de66e9">50점</div>
										</div>
									</div>
								</div>
								<div class="flex-shrink-0 ms-3">
									<img src="img/EImg.webp" class="img-fluid" style="height: 80px;">
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<p class="text-secondary fw-bold mt-2">상황에 따라 꾸미기도 하고, 자연스러움을 추구하기도 합니다</p>
							</div>
							<%
							}
							%>
						</div>
						<div class="col-xl-6 col-lg-12 px-4 py-2" data-aos="fade-up"
							data-aos-delay="200">
							<div class="col-xl-6 col-lg-12 mb-3" data-aos="fade-up"
								data-aos-delay="200">
								<span class="testResultType">사회성 및 인간관계</span>
							</div>
							<%
							if ("사회적 테토형".equals(socialSkillResultType)) {
							%>
							<div class="d-flex align-items-center">
								<div class="flex-shrink-0 me-3">
									<img src="img/TImg.webp" class="img-fluid" style="height: 80px;">
								</div>
								<div class="flex-grow-1">
									<div class="progress" role="progressbar"
										aria-label="Example with label" aria-valuenow="25"
										aria-valuemin="0" aria-valuemax="100" style="height: 30px">
										<div class="progress-bar"
											style="width: <%=socialSkillPoint%>%"><%=socialSkillPoint%>점
										</div>
									</div>
								</div>
								<div class="flex-shrink-0 ms-3">
									<img src="img/EImg-deafult.webp" class="img-fluid"
										style="height: 80px;">
								</div>
							</div>
								<%
								if (menFlag) {
								%>
								<p class="text-secondary fw-bold mt-2">리더십 있고 모임을 주도하는 편입니다</p>
								<%
								} else {
								%>
								<p class="text-secondary fw-bold mt-2">관계에서 주도적이고 솔직한 편입니다</p>
								<%
								}
								%>
							<%
							} else if ("사회적 에겐형".equals(socialSkillResultType)) {
							%>
							<div class="d-flex align-items-center">
								<div class="flex-shrink-0 me-3">
									<img src="img/TImg-deafult.webp" class="img-fluid"
										style="height: 80px;">
								</div>
								<div class="flex-grow-1">
									<div class="progress flex-row-reverse" role="progressbar"
										aria-label="Example with label" aria-valuenow="25"
										aria-valuemin="0" aria-valuemax="100" style="height: 30px">
										<div class="progress-reverse-bar"
											style="width: <%=socialSkillPoint%>%"><%=socialSkillPoint%>점
										</div>
									</div>
								</div>
								<div class="flex-shrink-0 ms-3">
									<img src="img/EImg.webp" class="img-fluid" style="height: 80px;">
								</div>
							</div>
							<div class="d-flex flex-row-reverse">
								<%
								if (menFlag) {
								%>
								<p class="text-secondary fw-bold mt-2">조용하고 신중한 편이고, 깊은 관계를 선호합니다.</p>
								<%
								} else {
								%>
								<p class="text-secondary fw-bold mt-2">갈등을 피하려는 경향이 있고, 상대방의 감정을 잘 살피는 편입니다</p>
								<%
								}
								%>
							</div>
							<%
							} else {
							%>
							<div class="d-flex align-items-center">
								<div class="flex-shrink-0 me-3">
									<img src="img/TImg.webp" class="img-fluid" style="height: 80px;">
								</div>
								<div class="flex-grow-1">
									<div class="progress-stacked" style="height: 30px;">
										<div class="progress" role="progressbar"
											aria-label="Segment one" aria-valuenow="15" aria-valuemin="0"
											aria-valuemax="100" style="width: 50%; height: 30px;">
											<div class="progress-bar" style="height: 30px;">50점</div>
										</div>
										<div class="progress" role="progressbar"
											aria-label="Segment two" aria-valuenow="30" aria-valuemin="0"
											aria-valuemax="100" style="width: 50%; height: 30px;">
											<div class="progress-bar" style="background-color: #de66e9">50점</div>
										</div>
									</div>
								</div>
								<div class="flex-shrink-0 ms-3">
									<img src="img/EImg.webp" class="img-fluid" style="height: 80px;">
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<p class="text-secondary fw-bold mt-2">공감을 잘하고 타인을 따뜻하게 이끌어주는 편입니다</p>
							</div>
							<%
							}
							%>
						</div>
						<!-- End Service Item -->
						<div class="col-xl-6 col-lg-12 px-4 py-2" data-aos="fade-up"
							data-aos-delay="300">
							<div class="col-xl-6 col-lg-12 mb-3" data-aos="fade-up"
								data-aos-delay="300">
								<span class="testResultType">내면 성향 및 감정 처리 방식</span>
							</div>
							<%
							if ("내면 테토형".equals(innerTendencyResultType)) {
							%>
							<div class="d-flex align-items-center">
								<div class="flex-shrink-0 me-3">
									<img src="img/TImg.webp" class="img-fluid" style="height: 80px;">
								</div>
								<div class="flex-grow-1">
									<div class="progress" role="progressbar"
										aria-label="Example with label" aria-valuenow="25"
										aria-valuemin="0" aria-valuemax="100" style="height: 30px">
										<div class="progress-bar"
											style="width: <%=innerTendencyPoint%>%"><%=innerTendencyPoint%>점
										</div>
									</div>
								</div>
								<div class="flex-shrink-0 ms-3">
									<img src="img/EImg-deafult.webp" class="img-fluid"
										style="height: 80px;">
								</div>
							</div>
								<%
								if (menFlag) {
								%>
								<p class="text-secondary fw-bold mt-2">문제 해결에 집중하고, 감정적인 동요를 겉으로 잘 드러내지 않아요</p>
								<%
								} else {
								%>
								<p class="text-secondary fw-bold mt-2">솔직하고 시원시원하게 감정을 표현하는 편입니다</p>
								<%
								}
								%>
							<%
							} else if ("내면 에겐형".equals(innerTendencyResultType)) {
							%>
							<div class="d-flex align-items-center">
								<div class="flex-shrink-0 me-3">
									<img src="img/TImg-deafult.webp" class="img-fluid"
										style="height: 80px;">
								</div>
								<div class="flex-grow-1">
									<div class="progress flex-row-reverse" role="progressbar"
										aria-label="Example with label" aria-valuenow="25"
										aria-valuemin="0" aria-valuemax="100" style="height: 30px">
										<div class="progress-reverse-bar"
											style="width: <%=innerTendencyPoint%>%"><%=innerTendencyPoint%>점
										</div>
									</div>
								</div>
								<div class="flex-shrink-0 ms-3">
									<img src="img/EImg.webp" class="img-fluid" style="height: 80px;">
								</div>
							</div>
							<div class="d-flex flex-row-reverse">
								<%
								if (menFlag) {
								%>
								<p class="text-secondary fw-bold mt-2">내면이 섬세하고 생각이 많은 편입니다</p>
								<%
								} else {
								%>
								<p class="text-secondary fw-bold mt-2">감정 기복이 있을 수 있지만, 자신의 감정을 솔직하게 표현하는 걸 좋아합니다</p>
								<%
								}
								%>
							</div>
							<%
							} else {
							%>
							<div class="d-flex align-items-center">
								<div class="flex-shrink-0 me-3">
									<img src="img/TImg.webp" class="img-fluid" style="height: 80px;">
								</div>
								<div class="flex-grow-1">
									<div class="progress-stacked" style="height: 30px;">
										<div class="progress" role="progressbar"
											aria-label="Segment one" aria-valuenow="15" aria-valuemin="0"
											aria-valuemax="100" style="width: 50%; height: 30px;">
											<div class="progress-bar" style="height: 30px;">50점</div>
										</div>
										<div class="progress" role="progressbar"
											aria-label="Segment two" aria-valuenow="30" aria-valuemin="0"
											aria-valuemax="100" style="width: 50%; height: 30px;">
											<div class="progress-bar" style="background-color: #de66e9">50점</div>
										</div>
									</div>
								</div>
								<div class="flex-shrink-0 ms-3">
									<img src="img/EImg.webp" class="img-fluid" style="height: 80px;">
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<p class="text-secondary fw-bold mt-2">사려 깊게 감정을 잘 다루는 편입니다</p>
							</div>
							<%
							}
							%>
						</div>
						<div class="col-xl-6 col-lg-12 px-4 py-2" data-aos="fade-up"
							data-aos-delay="400">
							<div class="col-xl-6 col-lg-12 mb-3" data-aos="fade-up"
								data-aos-delay="400">
								<span class="testResultType">야망 및 인생 태도</span>
							</div>
							<%
							if ("야망 테토형".equals(ambitionResultType)) {
							%>
							<div class="d-flex align-items-center">
								<div class="flex-shrink-0 me-3">
									<img src="img/TImg.webp" class="img-fluid" style="height: 80px;">
								</div>
								<div class="flex-grow-1">
									<div class="progress" role="progressbar"
										aria-label="Example with label" aria-valuenow="25"
										aria-valuemin="0" aria-valuemax="100" style="height: 30px">
										<div class="progress-bar" style="width: <%=ambitionPoint%>%"><%=ambitionPoint%>점
										</div>
									</div>
								</div>
								<div class="flex-shrink-0 ms-3">
									<img src="img/EImg-deafult.webp" class="img-fluid"
										style="height: 80px;">
								</div>
							</div>
								<%
								if (menFlag) {
								%>
								<p class="text-secondary fw-bold mt-2">현실적인 목표를 세우고 그걸 이루기 위해 꾸준히 노력합니다</p>
								<%
								} else {
								%>
								<p class="text-secondary fw-bold mt-2">목표를 향해 돌진하고 독립적으로 성공하려는 마음이 큽니다</p>
								<%
								}
								%>
							<%
							} else if ("야망 에겐형".equals(ambitionResultType)) {
							%>
							<div class="d-flex align-items-center">
								<div class="flex-shrink-0 me-3">
									<img src="img/TImg-deafult.webp" class="img-fluid"
										style="height: 80px;">
								</div>
								<div class="flex-grow-1">
									<div class="progress flex-row-reverse" role="progressbar"
										aria-label="Example with label" aria-valuenow="25"
										aria-valuemin="0" aria-valuemax="100" style="height: 30px">
										<div class="progress-reverse-bar"
											style="width: <%=ambitionPoint%>%"><%=ambitionPoint%>점
										</div>
									</div>
								</div>
								<div class="flex-shrink-0 ms-3">
									<img src="img/EImg.webp" class="img-fluid" style="height: 80px;">
								</div>
							</div>
							<div class="d-flex flex-row-reverse">
								<%
								if (menFlag) {
								%>
								<p class="text-secondary fw-bold mt-2">안정적이고 평화로운 삶을 추구하는 편입니다</p>
								<%
								} else {
								%>
								<p class="text-secondary fw-bold mt-2">정서적인 안정감을 중요하게 생각하는 편입니다</p>
								<%
								}
								%>
							</div>
							<%
							} else {
							%>
							<div class="d-flex align-items-center">
								<div class="flex-shrink-0 me-3">
									<img src="img/TImg.webp" class="img-fluid" style="height: 80px;">
								</div>
								<div class="flex-grow-1">
									<div class="progress-stacked" style="height: 30px;">
										<div class="progress" role="progressbar"
											aria-label="Segment one" aria-valuenow="15" aria-valuemin="0"
											aria-valuemax="100" style="width: 50%; height: 30px;">
											<div class="progress-bar" style="height: 30px;">50점</div>
										</div>
										<div class="progress" role="progressbar"
											aria-label="Segment two" aria-valuenow="30" aria-valuemin="0"
											aria-valuemax="100" style="width: 50%; height: 30px;">
											<div class="progress-bar" style="background-color: #de66e9">50점</div>
										</div>
									</div>
								</div>
								<div class="flex-shrink-0 ms-3">
									<img src="img/EImg.webp" class="img-fluid" style="height: 80px;">
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<p class="text-secondary fw-bold mt-2">묵묵히 성장하지만 기대고 싶은 마음도
									있어요</p>
							</div>
							<%
							}
							%>
						</div>
						<!-- End Service Item -->
					</div>
				</div>
			</section>
			<!-- /Featured Services Section -->

			<!-- 테토/에겐 유형 설명 -->
  			<%@ include file="../tetoEganType/tetoEganType.jsp" %>
		</div>
		
		<!-- 인스타 스토리용 화면 렌더링 영역 -->
		<jsp:include page="shareImgPage.jsp" flush="true">
		    <jsp:param name="tetoFlag" value="<%= tetoFlag %>" />
		    <jsp:param name="menFlag" value="<%= menFlag %>" />
		    <jsp:param name="topPercent" value="<%= topPercent %>" />
		    <jsp:param name="testResultType" value="<%= testResultType %>" />
		    <jsp:param name="styleSelfcareResultType" value="<%= styleSelfcareResultType %>" />
		    <jsp:param name="styleSelfcarePoint" value="<%= styleSelfcarePoint %>" />
		    <jsp:param name="socialSkillResultType" value="<%= socialSkillResultType %>" />
		    <jsp:param name="socialSkillPoint" value="<%= socialSkillPoint %>" />
		    <jsp:param name="innerTendencyResultType" value="<%= innerTendencyResultType %>" />
		    <jsp:param name="innerTendencyPoint" value="<%= innerTendencyPoint %>" />
		    <jsp:param name="ambitionResultType" value="<%= ambitionResultType %>" />
		    <jsp:param name="ambitionPoint" value="<%= ambitionPoint %>" />
		</jsp:include>
		
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
					new PartnersCoupang.G({"id":866258,"template":"carousel","trackingCode":"AF9633124","width":"300","height":"250","tsource":""});
				</script>
				</div>
			</div>
		</div>
		<!-- End advertisement -->

		<script>
			let adClicked = false; // 광고 클릭 여부를 저장하는 플래그
	
			// 광고 버튼 클릭 시 새 창 열기 + 클릭 여부 저장
			document.querySelector('.goAdBtn').addEventListener('click', () => {
			  adClicked = true;
			  window.open('https://link.coupang.com/a/csPMem', '_blank');
			});
	
			// 탭으로 돌아왔을 때 실행 (광고 클릭한 경우에만)
			window.addEventListener('focus', () => {
			  if (adClicked) {
			    document.querySelector('.for-ad').classList.add('clear');
			    document.querySelector('.goAdBtn').classList.add('visually-hidden');
			  }
			});
		</script>


	</main>

	<!-- layout: 헤더 영역 -->
	<%@ include file="../layout/footer.jsp"%>

</body>

</html>