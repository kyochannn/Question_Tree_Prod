package com.example.MyWebProject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.MyWebProject.broker.QuestionsBroker;
import com.example.MyWebProject.broker.QuestionsMasterBroker;
import com.example.MyWebProject.broker.TestUserBroker;
import com.example.MyWebProject.serviceImpl.QuestionResultServiceImpl;
import com.example.MyWebProject.serviceImpl.QuestionsServiceImpl;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	@Autowired
	QuestionResultServiceImpl userService;
	
	@Autowired
	QuestionsServiceImpl questionService;

	// ==================== [이하 페이지 이동 method] ====================
	
	/**
	 * index 페이지 이동
	 * 
	 * @return
	 */
	@GetMapping(value = "/")
	public ModelAndView home() {
		// /WEB-INF/views/index.jsp
		
		List<TestUserBroker> userList = userService.getAllTestUsers();
	
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("participant", userList.size());

		return mv;
	}
	
	/**
	 * 관리자 페이지 이동
	 * 관리자 페이지는 로그인을 진행한 관리자 권한의 사용자만 이용 가능함.
	 * 
	 * @param session
	 * @return
	 */
	@GetMapping(value = "/viewAdminPage")
	public ModelAndView viewAdminPage(HttpSession session) {
		List<TestUserBroker> userList = userService.getAllTestUsers();
		
		// 로그인한 사용자 정보 가져오기
		String userName = (String) session.getAttribute("userName");
		
		ModelAndView mv = new ModelAndView();
		if (userName == null) {
			mv.setViewName("redirect:/loginPage");
		} else {
			mv.setViewName("questionTree/adminPage");
			mv.addObject("participant", userList.size());
			mv.addObject("userList", userList);
		}
		
		return mv;
	}
	
	/**
	 * 참여자 통계 페이지 이동
	 * 
	 * @return
	 */
	@GetMapping(value = "/viewEgenTetoSummaryPage")
	public ModelAndView viewEgenTetoSummaryPage() {
		List<TestUserBroker> userList = userService.getAllTestUsers();

		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("questionTree/viewEgenTetoSummaryPage");
		mv.addObject("participant", userList.size());
		mv.addObject("userList", userList);
		
		return mv;
	}

	/**
	 * 성별 선택 페이지 이동
	 * 
	 * @return
	 */
	@GetMapping(value = "/selectGenderPage")
	public ModelAndView selectGenderPage() {
		List<TestUserBroker> userList = userService.getAllTestUsers();

		int mSize = 0;
		int wSize = 0;

		for (TestUserBroker user : userList) {
			if ("M".equals(user.getGender())) {
				mSize++;
			} else {
				wSize++;
			}
		}

		ModelAndView mv = new ModelAndView("questionTree/selectGenderPage");
		mv.addObject("mSize", mSize);
		mv.addObject("wSize", wSize);

		return mv;
	}

	/**
	 * 질문지 1페이지 이동
	 * 
	 * @param session
	 * @return
	 */
	@GetMapping(value = "/mensQuestionPage_1")
	public String mensQuestionPage_1(HttpSession session) {
		String gender = (String)session.getAttribute("gender");
		
		// null 체크
	    if (gender == null) {
	    	return "redirect:/";
	    }
		
		return "questionTree/mensQuestionPage_1";
	}

	/**
	 * 질문지 2페이지 이동
	 * 
	 * @param session
	 * @return
	 */
	@GetMapping(value = "/mensQuestionPage_2")
	public String mensQuestionPage_2(HttpSession session) {
		String gender = (String)session.getAttribute("gender");
		Map<String, String> page1 = (Map<String, String>) session.getAttribute("page1");		
		
		// null 체크
	    if (gender == null || page1 == null) {
	    	return "redirect:/";
	    }
		
		return "questionTree/mensQuestionPage_2";
	}

	/**
	 * 질문지 3페이지 이동
	 * @param session
	 * @return
	 */
	@GetMapping(value = "/mensQuestionPage_3")
	public String mensQuestionPage_3(HttpSession session) {
		String gender = (String)session.getAttribute("gender");
		Map<String, String> page1 = (Map<String, String>) session.getAttribute("page1");		
		Map<String, String> page2 = (Map<String, String>) session.getAttribute("page2");		
		
		// null 체크
	    if (gender == null || page1 == null || page2 == null) {
	    	return "redirect:/";
	    }
		return "questionTree/mensQuestionPage_3";
	}

	/**
	 * 테스트 결과 페이지 이동
	 * 
	 * @param session
	 * @return
	 */
	@GetMapping("/testResultPage")
	public String testResultPage(HttpSession session) {
	    String gender = (String) session.getAttribute("gender");
	    Map<String, String> page1 = (Map<String, String>) session.getAttribute("page1");
	    Map<String, String> page2 = (Map<String, String>) session.getAttribute("page2");
	    Map<String, String> page3 = (Map<String, String>) session.getAttribute("page3");

	    if (gender == null || page1 == null || page2 == null || page3 == null) {
	        return "redirect:/"; // 홈으로 리다이렉트
	    }

	    TestUserBroker userBroker = new TestUserBroker();
	    userBroker.setUserNo(UUID.randomUUID().toString());
	    userBroker.setGender(gender);
	    userBroker.setTesterMyself(true);
	    userBroker = calculateResult(page1, page2, page3, userBroker);

	    userService.userLogToDatabase(userBroker);

	    return "redirect:/testSharePage?userNo=" + userBroker.getUserNo();
	}

	/**
	 * 테스트 공유 페이지 이동
	 * 
	 * @param userNo
	 * @return
	 */
	@GetMapping("/testSharePage")
	public ModelAndView resultPage(@RequestParam String userNo) {
	    TestUserBroker userBroker = userService.getTestUser(userNo);

	    if (userBroker == null) {
	        return new ModelAndView("redirect:/"); // 존재하지 않는 userNo 처리
	    }

	    ModelAndView mv = new ModelAndView("questionTree/testResultPage");
	    mv.addObject("userBroker", userBroker);
	    return mv;
	}

	/**
	 * 릴리즈 노트 페이지 이동
	 * 
	 * @return
	 */
	@GetMapping("/releaseNotesPage")
	public ModelAndView releaseNotesPage() {
		ModelAndView mv = new ModelAndView("questionTree/releaseNotes");
		
		return mv;
	}
	
	/**
	 * 질문 리스트 조회 및 수정
	 * 관리자 권한 사용자만 접근 가능함.
	 * 
	 * @return
	 */
	@GetMapping("/selectQuestionListPage")
	public ModelAndView selectQuestionListPage(HttpSession session) {
		List<QuestionsMasterBroker> questionsMasterList = questionService.getQuestionsMasterAll();
		
		// 로그인한 사용자 정보 가져오기
		String userName = (String) session.getAttribute("userName");
		
		ModelAndView mv = new ModelAndView();
		if (userName == null) {
			mv.setViewName("redirect:/loginPage");
		} else {
			mv.setViewName("questionTree/questionManagement/selectQuestionListPage");
			mv.addObject("questionsMasterList", questionsMasterList);
		}
		
		return mv;
	}
	
	// ==================== [이하 처리 method] ====================
	@PostMapping("/selectGenderPage")
	public String selectMens(@RequestParam String gender, HttpSession session) {
		session.setAttribute("gender", gender);
		return "redirect:/mensQuestionPage_1";
	}

	@PostMapping("/mensQuestionPage_1")
	public String handleMensPage1(@RequestParam Map<String, String> params, HttpSession session) {
		session.setAttribute("page1", new HashMap<>(params)); // 예: question1=보통이다, question2=매우 그렇다
		return "redirect:/mensQuestionPage_2";
	}

	@PostMapping("/mensQuestionPage_2")
	public String handleMensPage2(@RequestParam Map<String, String> params, HttpSession session) {
		session.setAttribute("page2", new HashMap<>(params));
		return "redirect:/mensQuestionPage_3";
	}

	@PostMapping("/mensQuestionPage_3")
	public String handleMensPage3(@RequestParam Map<String, String> params, HttpSession session) {
		session.setAttribute("page3", new HashMap<>(params));
		return "redirect:/testResultPage";
	}
	
	@PostMapping("/updateTestUserName")
	@ResponseBody
	public Map<String, Object> updateTestUserNameAjax(@RequestParam String userNo, @RequestParam String userName) {
	    Map<String, Object> result = new HashMap<>();
	    
	    try {
	        // DB 업데이트 로직 예시
	    	userService.updateUserName(userNo, userName); // 해당 메서드는 직접 구현 필요

	        result.put("success", true);
	        result.put("userName", userName);
	    } catch (Exception e) {
	        result.put("success", false);
	        result.put("message", "저장 중 오류가 발생했습니다.");
	    }

	    return result;
	}
	
	@PostMapping("/getQuestionsMasterAll")
	@ResponseBody
	public List<QuestionsMasterBroker> getQuestionsMasterAll() {
	    List<QuestionsMasterBroker> questionsMasterList = questionService.getQuestionsMasterAll();
	    System.out.println("questionsMasterList 크기 :::::: " + questionsMasterList.size());

	    // JSON 배열로 반환됨
	    return questionsMasterList; 
	}
	
	@PostMapping("/getQuestionsMaster")
	@ResponseBody
	public QuestionsMasterBroker getQuestionsMasterAll(@RequestBody Map<String, String> param) {
		String questionNo = param.get("questionNo");
	    QuestionsMasterBroker questionsMaster = questionService.getQuestionsMaster(questionNo);

	    // JSON 배열로 반환됨
	    return questionsMaster;
	}
	
	@PostMapping("/getQuestions")
	@ResponseBody
	public QuestionsBroker getQuestions(@RequestBody Map<String, String> param) {
	    String questionNo = param.get("questionNo");
	    QuestionsBroker questions = questionService.getQuestions(questionNo);

	    // JSON 배열로 반환됨
	    return questions; 
	}
	
	@PostMapping("/updateQuestionsMaster")
	@ResponseBody
	public void updateQuestionsMaster(@RequestBody QuestionsMasterBroker broker) {
		String str = broker.toString();
		System.out.println("1:" + str);
	}
	
	@PostMapping("/updateQuestions")
	@ResponseBody
	public void updateQuestions(@RequestBody QuestionsBroker broker) {
		String str = broker.toString();
		System.out.println("2:" + str);
		questionService.updateQuestions(broker);
	}
	
	// ==================== [이하 정보 처리 method] ====================
	
	/**
	 * 
	 * 
	 * @param page1
	 * @param page2
	 * @param page3
	 * @param userBroker
	 * @return
	 */
	private TestUserBroker calculateResult(Map<String, String> page1, Map<String, String> page2,
			Map<String, String> page3, TestUserBroker userBroker) {
		
		Boolean menFlag = "M".equals(userBroker.getGender()) ? true : false;
		
		int tetoScore = 0;
		int egenScore = 0;
		int styleSelfcarePoint = 0;
		int tetoStyleSelfcarePoint = 0;
		int egenStyleSelfcarePoint = 0;
		int socialSkillPoint = 0;
		int tetoSocialSkillPoint = 0;
		int egenSocialSkillPoint = 0;
		int tetoInnerTendencyPoint = 0;
		int innerTendencyPoint = 0;
		int egenInnerTendencyPoint = 0;
		int ambitionPoint = 0;
		int tetoAmbitionPoint = 0;
		int egenAmbitionPoint = 0;
		
		String styleSelfcareResultType = "";
		String socialSkillResultType = "";
		String innerTendencyResultType = "";
		String ambitionResultType = "";
		
		// 테토/에겐 구분
		Map<String, String> questionToType = new HashMap<>();
		questionToType.put("question1", "E");		// 스타일에겐
		questionToType.put("question2", "T");		// 내면테토
		questionToType.put("question3", "T");		// 사회적테토
		questionToType.put("question4", "T");		// 야망테토
		questionToType.put("question5", "T");		// 스타일테토
		questionToType.put("question6", "E");		// 사회적에겐
		questionToType.put("question7", "E");		// 내면에겐
		questionToType.put("question8", "E");		// 야망에겐
		questionToType.put("question9", "T");		// 야망테토
		questionToType.put("question10", "E");		// 스타일에겐
		questionToType.put("question11", "T");		// 내면테토
		questionToType.put("question12", "T");		// 사회적테토
		questionToType.put("question13", "E");		// 야망에겐
		questionToType.put("question14", "E");		// 사회적에겐
		questionToType.put("question15", "T");		// 스타일테토
		questionToType.put("question16", "T");		// 사회적테토
		questionToType.put("question17", "E");		// 내면에겐
		questionToType.put("question18", "T");		// 내면테토
		questionToType.put("question19", "E");		// 스타일에겐
		questionToType.put("question20", "E");		// 내면에겐
		questionToType.put("question21", "T");		// 야망테토
		questionToType.put("question22", "E");		// 야망에겐
		questionToType.put("question23", "T");		// 스타일테토
		questionToType.put("question24", "E");		// 사회적에겐

		// 성향별 구분
		Set<String> styleSelfcareQs = Set.of("question1", "question5", "question10", "question15", "question19", "question23");
		Set<String> innerTendencyQs = Set.of("question2", "question7", "question11", "question17", "question18","question20");
		Set<String> socialSkillQs = Set.of("question3", "question6", "question12", "question14", "question16", "question24");
		Set<String> ambitionQs = Set.of("question4", "question8", "question9", "question13", "question21", "question22");

		List<Map<String, String>> pages = List.of(page1, page2, page3);

		for (Map<String, String> page : pages) {
			for (Map.Entry<String, String> entry : page.entrySet()) {
				String question = entry.getKey(); // 예: "question1"
				String answer = entry.getValue(); // 예: "매우 그렇다"
				String type = questionToType.getOrDefault(question, ""); // "T" or "E"

				int score = responseToScore(answer); // 1~5 변환

				// 점수 합산
				if ("T".equals(type)) {
					tetoScore += score;
				} else if ("E".equals(type)) {
					egenScore += score;
				}

				// 성향별 점수 계산
				if (styleSelfcareQs.contains(question)) {
					System.out.println("question: " + question + "/" + "type: " + type);
					if ("T".equals(type)) {
						tetoStyleSelfcarePoint += score;
					} else if ("E".equals(type)) {
						egenStyleSelfcarePoint += score;
					}
					styleSelfcarePoint = (int) ((tetoStyleSelfcarePoint > egenStyleSelfcarePoint) ? (double) egenStyleSelfcarePoint / tetoStyleSelfcarePoint * 100 : (double) tetoStyleSelfcarePoint / egenStyleSelfcarePoint * 100);
				}
				if (socialSkillQs.contains(question)) {
					if ("T".equals(type)) {
						tetoSocialSkillPoint += score;
					} else if ("E".equals(type)) {
						egenSocialSkillPoint += score;
					}
					socialSkillPoint = (int) ((tetoSocialSkillPoint > egenSocialSkillPoint) ? (double) egenSocialSkillPoint / tetoSocialSkillPoint * 100 : (double) tetoSocialSkillPoint / egenSocialSkillPoint * 100);
				}
				if (innerTendencyQs.contains(question)) {
					if ("T".equals(type)) {
						tetoInnerTendencyPoint += score;
					} else if ("E".equals(type)) {
						egenInnerTendencyPoint += score;
					}
					innerTendencyPoint = (int) ((tetoInnerTendencyPoint > egenInnerTendencyPoint) ? (double) egenInnerTendencyPoint / tetoInnerTendencyPoint * 100 : (double) tetoInnerTendencyPoint / egenInnerTendencyPoint * 100);
				}
				if (ambitionQs.contains(question)) {
					if ("T".equals(type)) {
						tetoAmbitionPoint += score;
					} else if ("E".equals(type)) {
						egenAmbitionPoint += score;
					}
					ambitionPoint = (int) ((tetoAmbitionPoint > egenAmbitionPoint) ? (double) egenAmbitionPoint / tetoAmbitionPoint * 100 : (double) tetoAmbitionPoint / egenAmbitionPoint * 100);
				}
			}
		}
		
		// 스타일
		if (tetoStyleSelfcarePoint > egenStyleSelfcarePoint) {
			styleSelfcareResultType = "스타일 테토형";
		} else if (tetoStyleSelfcarePoint < egenStyleSelfcarePoint) {
			styleSelfcareResultType = "스타일 에겐형";
		} else {
			styleSelfcareResultType = "스타일 믹스형";
			styleSelfcarePoint = 0;
		}
		
		// 사회적
		if (tetoSocialSkillPoint > egenSocialSkillPoint) {
			socialSkillResultType = "사회적 테토형";
		} else if (tetoSocialSkillPoint < egenSocialSkillPoint) {
			socialSkillResultType = "사회적 에겐형";
		} else {
			socialSkillResultType = "사회적 믹스형";
			socialSkillPoint = 0;
		}
		
		// 내면
		if (tetoInnerTendencyPoint > egenInnerTendencyPoint) {
			innerTendencyResultType = "내면 테토형";
		} else if (tetoInnerTendencyPoint < egenInnerTendencyPoint) {
			innerTendencyResultType = "내면 에겐형";
		} else {
			innerTendencyResultType = "내면 믹스형";
			innerTendencyPoint = 0;
		}
		
		// 야망
		if (tetoAmbitionPoint > egenAmbitionPoint) {
			ambitionResultType = "야망 테토형";
		} else if (tetoAmbitionPoint < egenAmbitionPoint) {
			ambitionResultType = "야망 에겐형";
		} else {
			ambitionResultType = "야망 믹스형";
			ambitionPoint = 0;
		}

		// 결과 저장
		System.out.println("tetoScore: " + tetoScore);
		System.out.println("egenScore: " + egenScore);
		userBroker.setTetoScore((int) (tetoScore * (100 / 60.0)));
		userBroker.setEgenScore((int) (egenScore * (100 / 60.0)));
		userBroker.setzScore(getzScore(egenScore - tetoScore));
		userBroker.setTopPercent(getTopPercent(egenScore, tetoScore));
		userBroker.setStyleSelfcareResultType(styleSelfcareResultType);
		userBroker.setSocialSkillResultType(socialSkillResultType);
		userBroker.setInnerTendencyResultType(innerTendencyResultType);
		userBroker.setAmbitionResultType(ambitionResultType);
		userBroker.setStyleSelfcarePoint(styleSelfcarePoint);
		userBroker.setSocialSkillPoint(socialSkillPoint);
		userBroker.setInnerTendencyPoint(innerTendencyPoint);
		userBroker.setAmbitionPoint(ambitionPoint);
		if ( menFlag ) {
			userBroker.setTestResultType((tetoScore > egenScore) ? "테토남" : "에겐남");			
		} else {
			userBroker.setTestResultType((tetoScore > egenScore) ? "테토녀" : "에겐녀");			
		}

		System.out.println("T점수: " + tetoScore);
		System.out.println("E점수: " + egenScore);
		System.out.println("스타일/자기관리: " + styleSelfcarePoint);
		System.out.println("사회성: " + socialSkillPoint);
		System.out.println("내면성향: " + innerTendencyPoint);
		System.out.println("야망: " + ambitionPoint);
		System.out.println("테스트 결과: " + userBroker.getTestResultType());

		return userBroker;
	}
	
	public int getTopPercent(int egenScore, int tetoScore) {
		int result = 0;
		
		double e = calculateTopPercentile(egenScore);
		double t = calculateTopPercentile(tetoScore);
		if (egenScore > tetoScore) {
			result = (int) (e * 0.7 + t * 0.4);
		} else {
			result = (int) (t * 0.7 + e * 0.4);			
		}
		
		return result;
	}

	private int getzScore(int mean) {
		double stdDev = 15.0;
		double zScore = (double) (mean) / stdDev;

		return (int) zScore;
	}

    // 정규분포 누적분포함수(CDF) 계산용 (표준 정규분포)
    public double normalCDF(double z) {
        return 0.5 * (1 + erf(z / Math.sqrt(2)));
    }

    // 오류 함수 (erf) 근사값 계산
    public double erf(double x) {
        // Abramowitz and Stegun formula 7.1.26 (approximation)
        double t = 1.0 / (1.0 + 0.3275911 * Math.abs(x));
        double[] a = {0.254829592, -0.284496736, 1.421413741, -1.453152027, 1.061405429};
        double sum = 0.0;
        for (int i = 0; i < a.length; i++) {
            sum += a[i] * Math.pow(t, i + 1);
        }
        double erf = 1 - sum * Math.exp(-x * x);
        return x >= 0 ? erf : -erf;
    }

    // 상위 백분위 계산 함수
    public double calculateTopPercentile(int score) {
        double mean = 30.5;
        double stdDev = 17.32;
        double z = (score - mean) / stdDev;
        double percentile = (1 - normalCDF(z)) * 100;
        return percentile;
    }

	private int responseToScore(String answer) {
		return switch (answer) {
		case "매우 그렇다" -> 5;
		case "그렇다" -> 4;
		// case "보통이다" -> 3;
		case "그렇지 않다" -> 2;
		case "매우 그렇지 않다" -> 1;
		default -> 0;
		};
	}

}