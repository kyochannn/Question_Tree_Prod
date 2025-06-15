<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <jsp:include page="../layout/meta.jsp" />
  <link href="css/question-page.css" rel="stylesheet">
</head>

<body class="service-details-page">

  <!-- layout: 헤더 영역 -->
  <%@ include file="../layout/header.jsp" %>

  <main class="main">

    <!-- Page Title -->
    <div class="page-title" data-aos="fade">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0">2단계</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="index.html">에겐 / 테토 테스트</a></li>
            <li class="current">2단계: 질문 응답</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->
    
   	<% 
	System.out.println(session.getAttribute("gender"));
	Boolean menFlag = "M".equals(session.getAttribute("gender")) ? true : false;
	
	if ( menFlag ) { 
	%>

    <!-- Service Details Section -->
    <section id="service-details" class="service-details section">

      <div class="container">

        <div class="row gy-5">

          <div class="col-lg-12" data-aos="fade-up" data-aos-delay="100">
            <div class="service-box text-center">
              <h4>페이지 2/3</h4>
			  <img src="img/mensQuestionImg.webp" class="img-fluid mb-3" style="max-width:500px; width: 100%;">
              <p><strong>에겐남인지 테토남인지</strong> 거의 다 왔어요!</p>
              <p><strong>총 24문항 중 8개 완료!</strong><br>
              이제 <strong>14개</strong>만 더 답하면 결과가 나옵니다! 아래 질문에 응답해 주세요. 💡</p>
                <div class="progress" role="progressbar" aria-label="Animated striped example" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                  <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 60%"></div>
                </div>
            </div><!-- End Services List -->

            <div id="question-container" class="mt-4"></div>

            <script>
            // 남자
            const questions = [
	              "🔥 목표를 정하면 어려운 상황에서도 포기하지 않고 끈기 있게 밀어붙여서 기어코 달성하려는 의지가 강하신가요?",//9
	              "❤️ 자신의 외모나 스타일에 대해 누군가 칭찬해 주면 하루 종일 기분이 좋고 자신감이 더 생기시나요?",//10
	              "🧠 자신의 실수나 약점에 대해 비판을 들으면 감정적으로 상처받기보다 그 내용을 분석해서 배우려는 자세를 보이시나요?",//11
	              "📊 여러 사람과의 관계에서 감정적인 문제보다 논리적인 사실 관계를 파악하는 것이 더 중요하다고 생각하시나요?",//12
	              "💼 남들이 말하는 성공(좋은 직장, 고연봉, 명예 등)을 이뤄야 한다는 부담을 종종 느끼시나요?",//13
	              "👀 새로운 사람들과 만나는 자리에서 상대방의 분위기를 먼저 살피고 편안하게 다가가기 위해 노력하는 편이신가요?",//14
	              "📈 옷을 입을 때 힙한 코디보다는 베이직하고 깔끔한 코디를 선호하시나요?",//15
	              "💬 친한 친구에게 서운한 점이 있다면 감정적으로 표현하기보다 왜 서운한지 구체적인 상황과 이유를 설명하며 대화하려 하시나요?"//16
            ];
            
           	  // const options = ["매우 그렇다", "그렇다", "보통이다", "그렇지 않다", "매우 그렇지 않다"];
              const options = ["매우 그렇다", "그렇다", "그렇지 않다", "매우 그렇지 않다"];
              
              const container = document.getElementById("question-container");
            
              questions.forEach((question, index) => {
                const box = document.createElement("div");
                box.className = "service-box qustion-box";
                box.innerHTML = `
                  <h4 class="question-title">Q\${index + 9}. \${question}</h4>
                  <div class="options">
                    \${options.map(opt => `
                      <button class="option-btn">
                        <i class="bi bi-arrow-right-circle"></i><span> \${opt}</span>
                      </button>
                    `).join('')}
                  </div>
                `;
                container.appendChild(box);
              });
            
              // 선택 이벤트
              document.addEventListener('click', (e) => {
                if (e.target.closest('.option-btn')) {
                  const group = e.target.closest('.options');
                  group.querySelectorAll('.option-btn').forEach(btn => btn.classList.remove('selected'));
                  e.target.closest('.option-btn').classList.add('selected');
                }
              });
            </script>

            <div class="mt-4 d-flex justify-content-between">
              <div data-aos="fade-up" data-aos-delay="100">
                <!-- 
                <a href="/mensQuestionPage_1" class="next-page-btn"><span><i class="bi bi-arrow-left"></i> 이전 페이지</span></a>
                 -->
              </div>
              <div>
                <a href="#" class="next-page-btn"><span>다음 페이지 </span><i class="bi bi-arrow-right"></i></a>
              </div>
            </div>
              
          </div>
        </div>
      </div>
    </section><!-- /Service Details Section -->
	<!-- 질문 응답 전송을 위한 form -->
	
	<% } else { %>
	
   	<!-- Service Details Section -->
    <section id="service-details" class="service-details section">

      <div class="container">

        <div class="row gy-5">

          <div class="col-lg-12" data-aos="fade-up" data-aos-delay="100">
            <div class="service-box text-center">
              <h4>페이지 2/3</h4>
			  <img src="img/womensQuestionImg.webp" class="img-fluid mb-3" style="max-width:500px; width: 100%;">
              <p><strong>에겐녀인지 테토녀인지</strong> 거의 다 왔어요!</p>
              <p><strong>총 24문항 중 8개 완료!</strong><br>
              이제 <strong>14개</strong>만 더 답하면 결과가 나옵니다! 아래 질문에 응답해 주세요. 💡</p>
              <div class="progress" role="progressbar" aria-label="Animated striped example" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 60%"></div>
              </div>
            </div><!-- End Services List -->

            <div id="question-container" class="mt-4"></div>

            <script>
            // 여자
            const questions = [
	              "🤖 자신의 일이나 목표를 위해 필요하다면 다른 사람과의 관계에서 발생하는 감정적인 부분은 잠시 제쳐둘 수 있나요?",//9
	              "💅 미용실, 네일아트, 마사지샵, 명품관 등을 방문하는 것을 좋아하시나요?",//10
	              "🗣️ 속상하거나 화가 날 때, 누군가에게 조용히 털어놓는 대신 뒷담화를 통해 풀 때가 있나요?",//11
	              "⚖️ 인간관계에서 감정적인 문제보다 신뢰나 약속 같은 원칙을 더 중요하게 생각하시나요?",//12
	              "🕊️ 미래에 대해 생각할 때, 구체적인 성공 계획보다 행복하고 편안한 삶, 그리고 소중한 사람들과의 관계에 대한 그림을 더 많이 그리시나요?",//13
	              "👂 주변 사람들의 기분이나 감정을 잘 파악하는 편이고, 그에 맞춰 자신의 태도를 조절하는 것이 익숙하신가요?",//14
	              "🎯 자신만의 확고한 스타일이 있어서 유행에 크게 흔들리지 않고 좋아하는 스타일을 고수하는 편이신가요?",//15
	              "🔍 친구들과의 대화에서 개인적인 감정이나 관계에 대한 깊은 이야기보다 관심 있는 정보나 분석에 대해 이야기하는 것을 더 즐기시나요?"//16
            ];
            
              // const options = ["매우 그렇다", "그렇다", "보통이다", "그렇지 않다", "매우 그렇지 않다"];
              const options = ["매우 그렇다", "그렇다", "그렇지 않다", "매우 그렇지 않다"];
            
              const container = document.getElementById("question-container");
            
              questions.forEach((question, index) => {
                const box = document.createElement("div");
                box.className = "service-box qustion-box";
                box.innerHTML = `
                  <h4 class="question-title">Q\${index + 9}. \${question}</h4>
                  <div class="options">
                    \${options.map(opt => `
                      <button class="option-btn">
                        <i class="bi bi-arrow-right-circle"></i><span> \${opt}</span>
                      </button>
                    `).join('')}
                  </div>
                `;
                container.appendChild(box);
              });
            
              // 선택 이벤트
              document.addEventListener('click', (e) => {
                if (e.target.closest('.option-btn')) {
                  const group = e.target.closest('.options');
                  group.querySelectorAll('.option-btn').forEach(btn => btn.classList.remove('selected'));
                  e.target.closest('.option-btn').classList.add('selected');
                }
              });
            </script>

            <div class="mt-4 d-flex justify-content-between">
              <div data-aos="fade-up" data-aos-delay="100">
                <!-- 
                <a href="/mensQuestionPage_1" class="next-page-btn"><span><i class="bi bi-arrow-left"></i> 이전 페이지</span></a>
                 -->
              </div>
              <div>
                <a href="#" class="next-page-btn"><span>다음 페이지 </span><i class="bi bi-arrow-right"></i></a>
              </div>
            </div>
              
          </div>
        </div>
      </div>
    </section><!-- /Service Details Section -->
	<!-- 질문 응답 전송을 위한 form -->
	
	<% } %>
	
	<form id="questionForm" action="/mensQuestionPage_2" method="post">
	  <!-- 여기에 자바스크립트로 hidden input을 삽입할 예정 -->
	</form>
	
	<script>
	  const form = document.getElementById("questionForm");

	  // 버튼 클릭 시 선택을 hidden input으로 만들어 form에 삽입
	  function updateFormInputs() {
	    // 기존 input 초기화
	    form.innerHTML = "";

	    // 각 질문 박스를 순회하면서 선택된 응답 수집
	    document.querySelectorAll('.service-box').forEach((box, idx) => {
	      const selected = box.querySelector('.option-btn.selected');
	      if (selected) {
	        const input = document.createElement("input");
	        input.type = "hidden";
	        input.name = `question\${idx + 8}`; // question1, question2 ...
	        input.value = selected.innerText.trim();
	        form.appendChild(input);
	      }
	    });
	  }

	  // 강조 효과 함수
	  function highlightUnanswered(box) {
	    box.classList.add("highlight-missing");
	    box.scrollIntoView({ behavior: 'smooth', block: 'center' });

	    setTimeout(() => {
	      box.classList.remove("highlight-missing");
	    }, 1500);
	  }

	  // "다음 페이지" 버튼 클릭 시
	  document.querySelector('.next-page-btn').addEventListener('click', (e) => {
	    e.preventDefault(); // 기본 동작 방지

	    // 모든 질문 응답 확인
	    const boxes = document.querySelectorAll('.qustion-box');
	    let allAnswered = true;
	    for (const box of boxes) {
	      if (!box.querySelector('.option-btn.selected')) {
	        allAnswered = false;
	        highlightUnanswered(box);
	        break; // 첫 번째 미응답 질문만 강조하고 종료
	      }
	    }

	    if (allAnswered) {
	      updateFormInputs();
	      form.submit(); // form POST 전송
	    }
	  });
	</script>
	
	    <!-- Start advertisement -->
		<div class="container text-center mt-5" data-aos="fade-up" data-aos-delay="100">
			<div class="row">
		    	<div class="col">
					<ins class="kakao_ad_area" style="display:none;"
					data-ad-unit = "DAN-raSG6yuqxYGmdNSE"
					data-ad-width = "300"
					data-ad-height = "250"></ins>
					<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
				</div>
		    	<div class="col">
					<script src="https://ads-partners.coupang.com/g.js"></script>
					<script>
						new PartnersCoupang.G({"id":866270,"template":"carousel","trackingCode":"AF9633124","width":"300","height":"250","tsource":""});
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