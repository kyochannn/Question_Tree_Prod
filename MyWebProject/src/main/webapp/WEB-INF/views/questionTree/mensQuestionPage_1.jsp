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
            <li><a href="/">에겐 / 테토 테스트</a></li>
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
              <h4>페이지 1/3</h4>
			  <img src="img/mensQuestionImg.webp" class="img-fluid mb-3" style="max-width:500px; width: 100%;">
              <p><strong>당신은 에겐남일까요, 테토남일까요?</strong><br>지금 바로 확인해보세요!</p>
              <p><strong>총 24개의 질문</strong>이 준비되어 있어요. <br>
              솔직하게 응답해 주시면 정확한 결과를 알려드릴게요! 💬</p>
              <a class="btn-getstarted" href="/selectGenderPage"><i class="fas fa-redo-alt"></i> 성별 다시 선택하기</a>
            </div><!-- End Services List -->

            <div id="question-container" class="mt-4"></div>

            <script>
            // 남자
            const questions = [
	              "✨ 옷을 입을 때 다양한 스타일을 구현하기위해 노력하시나요?",//1
	              "🔧 스트레스받는 상황에서 감정에 휘둘리기보다 문제를 해결하기 위한 구체적인 방법을 찾는 데 집중하시나요?",//2
	              "🗣️ 모임에서 대화 주제가 정해지지 않으면 먼저 나서서 어떤 이야기를 할지 제안하거나 분위기를 이끌어가는 편이신가요?",//3
	              "🏆 인생에서 가장 중요하게 생각하는 성공은 사회적인 인정이나 경제적인 성취와 같이 눈에 보이는 결과인가요?",//4
	              "⚙️ 옷을 쇼핑을 할 때 무*사, 탑* 등의 무난한 브랜드에서 자주 구매하시나요?",//5
	              "💖 친구가 고민을 털어놓을 때, 해결책을 제시하기보다 친구의 감정에 깊이 공감하고 위로해 주는 것을 더 잘하시나요?",//6
	              "💬 힘든 일이 있을 때 혼자 해결하기보다 친한 친구에게 속마음을 털어놓고 감정을 나누는 것을 선호하시나요?",//7
	              "🚧 새로운 도전을 할 때 성공 가능성보다 실패했을 때의 위험이나 불안감을 더 크게 느끼는 편이신가요?"//8
            ];
            
              // const options = ["매우 그렇다", "그렇다", "보통이다", "그렇지 않다", "매우 그렇지 않다"];
              const options = ["매우 그렇다", "그렇다", "그렇지 않다", "매우 그렇지 않다"];
            
              const container = document.getElementById("question-container");
            
              questions.forEach((question, index) => {
                const box = document.createElement("div");
                box.className = "service-box qustion-box";
                box.innerHTML = `
                  <h4 class="question-title">Q\${index + 1}. \${question}</h4>
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

            <div class="mt-4 d-flex flex-row-reverse">
              <div>
                <p class="next-page-btn"><span>다음 페이지 </span><i class="bi bi-arrow-right"></i></p>
              </div>
            </div>
              
          </div>
        </div>
      </div>
    </section> <!-- /Service Details Section -->

	<% } else { %>

    <!-- Service Details Section -->
    <section id="service-details" class="service-details section">

	<div class="container">
       	<div class="row gy-5">
          	<div class="col-lg-12" data-aos="fade-up" data-aos-delay="100">
	            <div class="service-box text-center">
	              <h4>페이지 1/3</h4>
				  <img src="img/womensQuestionImg.webp" class="img-fluid mb-3" style="max-width:500px; width: 100%;">
	              <p><strong>당신은 에겐녀일까요, 테토녀일까요?</strong><br>지금 바로 확인해보세요!</p>
	              <p><strong>총 24개의 질문</strong>이 준비되어 있어요. <br>
	              솔직하게 응답해 주시면 정확한 결과를 알려드릴게요! 💬</p>
	              <a class="btn-getstarted" href="/selectGenderPage"><i class="fas fa-redo-alt"></i> 성별 다시 선택하기</a>
	            </div><!-- End Services List -->
	
	            <div id="question-container" class="mt-4"></div>

	           	<script>
           		// 여자
				const questions = [
				 "🌸 친구나 주변 사람들의 스타일 변화를 보고 나도 한번 시도해 볼까 하는 생각이 자주 드시나요?",//1
				 "🙈 누군가에게 섭섭함을 느꼈을 때, 직접 이야기하기보다는 조용히 거리를 두시나요?",//2
				 "⏰ 친구들과의 약속을 잡을 때, 가장 효율적인 시간과 장소를 제안하며 일정을 조율하는 역할을 주로 하시나요?",//3
				 "🌟 인생의 목표를 설정할 때, 자신의 커리어나 사회적인 지위 향상과 같은 개인적인 성취를 중요하게 생각하시나요?",//4
				 "📝 소녀스럽거나 여성스러운 옷을 입기보다는 힙한 코디를 주로 하시나요?",//5
				 "😥 누군가와 의견 충돌이 생겼을 때, 상대방의 기분이 상하지 않도록 자신의 의견을 표현하는 것을 어려워하거나 망설이는 편이신가요?",//6
				 "🤗 기분이 안 좋을 때, 혼자 있기보다 누군가와 함께 시간을 보내거나 감정을 이야기하면서 위로받고 싶어 하시나요?",//7
				 "🛋️ 새로운 일을 시작할 때 안정성을 최우선으로 고려하고, 불확실하거나 위험한 도전은 망설이는 편이신가요?"//8
				];
					
					// const options = ["매우 그렇다", "그렇다", "보통이다", "그렇지 않다", "매우 그렇지 않다"];
					const options = ["매우 그렇다", "그렇다", "그렇지 않다", "매우 그렇지 않다"];
					
					const container = document.getElementById("question-container");
					
					questions.forEach((question, index) => {
					  const box = document.createElement("div");
					  box.className = "service-box qustion-box";
					  box.innerHTML = `
					    <h4 class="question-title">Q\${index + 1}. \${question}</h4>
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

		        <div class="mt-4 d-flex flex-row-reverse">
		          <div>
		            <p class="next-page-btn"><span>다음 페이지 </span><i class="bi bi-arrow-right"></i></p>
		          </div>
		        </div>
		          
		      </div>
		    </div>
		  </div>
		</section><!-- /Service Details Section -->

		<% } %>

		<!-- 질문 응답 전송을 위한 form -->
		<form id="questionForm" action="/mensQuestionPage_1" method="post">
		  <!-- 여기에 자바스크립트로 hidden input을 삽입할 예정 -->
		</form>
	
		<script>
			const form = document.getElementById("questionForm");
			
			// 버튼 클릭 시 선택을 hidden input으로 만들어 form에 삽입
			function updateFormInputs() {
			  // 기존 input 초기화
			  form.innerHTML = "";
			
			  // 각 질문 박스를 순회하면서 선택된 응답 수집
			  document.querySelectorAll('.qustion-box').forEach((box, idx) => {
			    const selected = box.querySelector('.option-btn.selected');
			    if (selected) {
			 	    console.log(idx);
			      const input = document.createElement("input");
			      input.type = "hidden";
			      input.name = `question\${idx + 1}`; // question1, question2 ...
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
						data-ad-unit = "DAN-ZByYIFY1t3iY8Kz3"
						data-ad-width = "300"
						data-ad-height = "250"></ins>
					<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
				</div>
		    	<div class="col">
					<script src="https://ads-partners.coupang.com/g.js"></script>
					<script>
						new PartnersCoupang.G({"id":866271,"template":"carousel","trackingCode":"AF9633124","width":"300","height":"250","tsource":""});
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