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
              <h4>페이지 3/3</h4>
			  <img src="img/mensQuestionImg.webp" class="img-fluid mb-3" style="max-width:500px; width: 100%;">
              <p><strong>에겐남인지 테토남인지</strong> 이제 곧 결과가 나옵니다!</p>
              <p><strong>총 24문항 중 마지막 8개</strong>만 남았어요!<br>
              조금만 더 힘내서 아래 질문에 응답해 주세요 💪</p>
                <div class="progress" role="progressbar" aria-label="Animated striped example" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
                  <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 90%"></div>
                </div>
            </div><!-- End Services List -->

            <div id="question-container" class="mt-4"></div>

            <script>
            // 남자
            const questions = [
              "😢 슬픈 영화를 보거나 감동적인 음악을 들으면 눈물이 나거나 감정적으로 크게 동요하는 편이신가요?",//17
              "⏩ 과거의 아쉬웠던 일이나 후회되는 감정에 오래 머물기보다 빠르게 털어내고 현실에 집중하는 편이신가요?",//18
              "🤗 남들이 모르는 브랜드나 스타일을 탐색하는 것을 좋아하시나요?",//19
              "🙏 다른 사람의 어려운 상황을 보면 마치 자신의 일처럼 가슴 아파하고 진심으로 안타까워하는 편이신가요?",//20
              "🏅 경쟁 상황에 놓이면 반드시 이겨야 한다는 승부욕이 강하게 발동하는 편이신가요?",//21
              "🙏 어려운 문제에 부딪혔을 때 혼자 해결하기보다 주변 사람들에게 도움을 요청하거나 함께 해결하는 것을 선호하시나요?",//22
              "✅ 옷 쇼핑이 귀찮고 누가 대신 골라줬으면 좋겠다는 생각을 자주 하시나요?",//23
              "🤝 단체 활동을 할 때, 모두가 조화롭게 어울리고 편안한 분위기를 만드는 것에 신경을 많이 쓰시나요?"//24
            ];
            
            // const options = ["매우 그렇다", "그렇다", "보통이다", "그렇지 않다", "매우 그렇지 않다"];
            const options = ["매우 그렇다", "그렇다", "그렇지 않다", "매우 그렇지 않다"];
          
            const container = document.getElementById("question-container");
          
            questions.forEach((question, index) => {
              const box = document.createElement("div");
              box.className = "service-box qustion-box";
              box.innerHTML = `
                <h4 class="question-title">Q\${index + 17}. \${question}</h4>
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
                <a href="/mensQuestionPage_2" class="next-page-btn"><span><i class="bi bi-arrow-left"></i> 이전 페이지</span></a>
              	 -->
              </div>
              <div>
                <a href="#" class="next-page-btn"><span>결과 확인하기 </span><i class="bi bi-arrow-right"></i></a>
              </div>
            </div>
              
          </div>
        </div>
      </div>
    </section><!-- /Service Details Section -->
    
   	<% } else { %>
   	
   	<!-- Service Details Section -->
    <section id="service-details" class="service-details section">

      <div class="container">

        <div class="row gy-5">

          <div class="col-lg-12" data-aos="fade-up" data-aos-delay="100">
            <div class="service-box text-center">
              <h4>페이지 3/3</h4>
			  <img src="img/womensQuestionImg.webp" class="img-fluid mb-3" style="max-width:500px; width: 100%;">
              <p><strong>에겐녀인지 테토녀인지</strong> 이제 곧 결과가 나옵니다!</p>
              <p><strong>총 24문항 중 마지막 8개</strong>만 남았어요!<br>
              조금만 더 힘내서 아래 질문에 응답해 주세요 💪</p>
                <div class="progress" role="progressbar" aria-label="Animated striped example" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
                  <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 90%"></div>
                </div>
            </div><!-- End Services List -->

            <div id="question-container" class="mt-4"></div>

            <script>
            // 여자
            const questions = [
              "🤗 주변 사람들의 작은 말이나 행동에도 쉽게 감정이 동요하고 영향을 받는 편이신가요?",//17
              "🤗 주변 사람이 힘들어할 때 먼저 다가가 안아주거나 말을 걸어주는 따뜻한 면이 있나요?",//18
              "😊 원피스와 같은 소녀스럽고 여성스러운 옷을 좋아하시나요?",//19
              "😔 다른 사람과의 관계에서 발생하는 감정적인 문제들로 인해 힘들어하거나 스트레스를 받는 경우가 많으신가요?",//20
              "🧐 자신의 능력이나 가능성에 대해 비교적 객관적이고 때로는 자신에게 엄격한 평가를 내리는 편이신가요?",//21
              "🤝 목표를 향해 나아가는 과정에서 결과보다 함께 하는 사람들과의 관계나 감정적인 교류를 더 중요하게 생각하시나요?",//22
              "👍 외모에 대한 칭찬을 들었을 때, 쑥스러워하거나 크게 기뻐하기보다 담담하게 '감사합니다' 하고 넘어가는 편이신가요?",//23
              "🕊️ 소중한 사람과의 관계 유지를 위해 자신의 일부를 희생하거나 양보하는 것에 대해 비교적 쉽게 결정하시나요?"//24
            ];
            
           // const options = ["매우 그렇다", "그렇다", "보통이다", "그렇지 않다", "매우 그렇지 않다"];
              const options = ["매우 그렇다", "그렇다", "그렇지 않다", "매우 그렇지 않다"];
            
              const container = document.getElementById("question-container");
            
              questions.forEach((question, index) => {
                const box = document.createElement("div");
                box.className = "service-box qustion-box";
                box.innerHTML = `
                  <h4 class="question-title">Q\${index + 17}. \${question}</h4>
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
                <a href="/mensQuestionPage_2" class="next-page-btn"><span><i class="bi bi-arrow-left"></i> 이전 페이지</span></a>
              	 -->
              </div>
              <div>
                <a href="#" class="next-page-btn"><span>결과 확인하기 </span><i class="bi bi-arrow-right"></i></a>
              </div>
            </div>
              
          </div>
        </div>
      </div>
    </section><!-- /Service Details Section -->
    
    <% } %>
    
	<!-- 질문 응답 전송을 위한 form -->
	<form id="questionForm" action="/mensQuestionPage_3" method="post">
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
	        input.name = `question\${idx + 17}`; // question1, question2 ...
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
	
	<!-- Start kakao advertisement -->
	<div class="ad_banner" data-aos="fade-up" data-aos-delay="100">

	</div><!-- End kakao advertisement -->
	
	    <!-- Start advertisement -->
		<div class="container text-center mt-5" data-aos="fade-up" data-aos-delay="100">
			<div class="row">
		    	<div class="col">
					<ins class="kakao_ad_area" style="display:none;"
					data-ad-unit = "DAN-o4VrtVqXDaZkj3ri"
					data-ad-width = "300"
					data-ad-height = "250"></ins>
					<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
				</div>
		    	<div class="col">
					<script src="https://ads-partners.coupang.com/g.js"></script>
					<script>
						new PartnersCoupang.G({"id":866268,"template":"carousel","trackingCode":"AF9633124","width":"300","height":"250","tsource":""});
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