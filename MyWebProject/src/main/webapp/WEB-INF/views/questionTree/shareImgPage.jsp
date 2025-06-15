<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String topPercent = request.getParameter("topPercent");
String testResultType = request.getParameter("testResultType");
String styleSelfcareResultType = request.getParameter("styleSelfcareResultType");
String styleSelfcarePoint = request.getParameter("styleSelfcarePoint");
String socialSkillResultType = request.getParameter("socialSkillResultType");
String socialSkillPoint = request.getParameter("socialSkillPoint");
String innerTendencyResultType = request.getParameter("innerTendencyResultType");
String innerTendencyPoint = request.getParameter("innerTendencyPoint");
String ambitionResultType = request.getParameter("ambitionResultType");
String ambitionPoint = request.getParameter("ambitionPoint");
String tetoFlagStr = request.getParameter("tetoFlag");
String menFlagStr = request.getParameter("menFlag");

boolean tetoFlag = false; // 기본값 설정
boolean menFlag = false; // 기본값 설정

if (tetoFlagStr != null && tetoFlagStr.equalsIgnoreCase("true")) {
    tetoFlag = true;
}
if (menFlagStr != null && menFlagStr.equalsIgnoreCase("true")) {
	menFlag = true;
}
%>

<div id="result-card" class="d-none" style="width: 450px;">
	<!-- Featured Services Section -->
	<section id="featured-services"
		class="featured-services section light-background">
		<div class="container">
			<div class="text-center">
				<%
				if (tetoFlag && menFlag) {
				%>
				<img src="img/indexImg/TTBImg.webp" class="img-fluid mb-3 height-limit height-limit-170"
					style="">
				<h5>
					당신은 <span class="fs-3 fw-bold text-teto">상위 <%=topPercent%>%
						<%=testResultType%></span>입니다!
				</h5>
				<%
				} else if (!tetoFlag && menFlag) {
				%>
				<img src="img/indexImg/EGBImg.webp" class="img-fluid mb-3 height-limit height-limit-170"
					style="">
				<h5>
					당신은 <span class="fs-3 fw-bold text-egen">상위 <%=topPercent%>%
						<%=testResultType%></span>입니다!
				</h5>
				<%
				} else if (tetoFlag && !menFlag) {
				%>
				<img src="img/indexImg/TTGImg.webp" class="img-fluid mb-3 height-limit height-limit-170"
					style="">
				<h5>
					당신은 <span class="fs-3 fw-bold text-teto">상위 <%=topPercent%>%
						<%=testResultType%></span>입니다!
				</h5>
				<%
				} else {
				%>
				<img src="img/indexImg/EGGImg.webp" class="img-fluid mb-3 height-limit height-limit-170"
					style="">
				<h5>
					당신은 <span class="fs-3 fw-bold text-egen">상위 <%=topPercent%>%
						<%=testResultType%></span>입니다!
				</h5>
				<%
				}
				%>
			</div>
			
			<p class="text-center">
				<img src="img/logo.webp" style="width: 18px;"> 현대 남녀 구분법? 에겐/테토 테스트<br>
				 지금 확인하고 공유해보세요! <strong>kckoo.co.kr</strong><br>
			</p>
			
			<div class="row gy-1">
				<div class="col-12 ">
					<div class="col-12 mb-3">
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
				<div class="col-12">
					<div class="col-12 mb-3">
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
				<div class="col-12 ">
					<div class="col-12 mb-3">
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
				<div class="col-12 ">
					<div class="col-12 mb-3">
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
	
</div>