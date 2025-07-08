<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.MyWebProject.broker.TestUserBroker"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="../layout/meta.jsp" />
<link href="css/testResult-page.css" rel="stylesheet">

<!-- highcharts --> 
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="starter-page-page">

	<!-- layout: 헤더 영역 -->
	<%@ include file="../layout/header.jsp"%>

	<%
	Object participantAttr = request.getAttribute("participant");
	
	int participant = 0;
	if (participantAttr instanceof Integer) {
		participant = (Integer) participantAttr;
	}

	double primaryGoal = participant * 100.0 / 10000.0;
	double secondGoal = participant * 100.0 / 30000.0;
	double finalGoal = participant * 100.0 / 100000.0;
	double extendedGoal = participant * 100.0 / 1000000.0;

	int mCnt = 0;
	int wCnt = 0;
	
	double mCntPercent = 0.0;
	double wCntPercent = 0.0;

	int tetoMCnt = 0;
	int tetoWCnt = 0;
	int egenMCnt = 0;
	int egenWCnt = 0;
	
	double tetoMCntPercent = 0.0;
	double tetoWCntPercent = 0.0;
	double egenMCntPercent = 0.0;
	double egenWCntPercent = 0.0;

	int todayCnt = 0;
	int yesterdayCnt = 0;
	
	List<Integer> todayHourlyUsageList = new ArrayList<>(24);
	List<Integer> yesterdayHourlyUsageList = new ArrayList<>();	
	
	Map<String, Integer> dailyUsageMap = new TreeMap<>(); // 날짜 오름차순 정렬용

	Object userListObj = request.getAttribute("userList");
	if (userListObj instanceof List<?>) {
		List<?> rawList = (List<?>) userListObj;

		// 날짜 포맷 설정 (예: "2024-05-26 14:32:00" 형태)
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDate today = LocalDate.now();
		LocalDate yesterday = today.minusDays(1);

		for (Object obj : rawList) {
			if (obj instanceof TestUserBroker) {
				TestUserBroker user = (TestUserBroker) obj;
		
				// 성별 카운트
				String gender = user.getGender();
				if ("M".equalsIgnoreCase(gender)) {
					mCnt++;
				} else if ("W".equalsIgnoreCase(gender)) {
					wCnt++;
				}
		
				// 날짜 파싱
				String testDateStr = user.getTestDate();
				if (testDateStr != null && !testDateStr.isEmpty()) {
					try {
						testDateStr = testDateStr.split("\\.")[0]; // ".0" 제거
						LocalDateTime dateTime = LocalDateTime.parse(testDateStr, formatter);
						LocalDate testDate = dateTime.toLocalDate();
		
						if (testDate.equals(today)) {
							// 금일 사용량 
							todayCnt++;
							// 금일 시간별 사용량
							getTodayHourlyUsage(todayHourlyUsageList, user);
						} else if (testDate.equals(yesterday)) {
							// 전일 사용량
							yesterdayCnt++;
							// 전일 시간별 사용량
							getTodayHourlyUsage(yesterdayHourlyUsageList, user);							
						}
					} catch (Exception e) {
						System.err.println("날짜 파싱 실패: " + testDateStr);
					}
				}
				
				// 테토 에겐 비율 계산
				String testResultType = user.getTestResultType();
				
				if (testResultType != null && !testResultType.isEmpty()) {
					if ("테토남".equals(testResultType)) {
						tetoMCnt++;
					} else if ("테토녀".equals(testResultType)) {
						tetoWCnt++;
					} else if ("에겐남".equals(testResultType)) {
						egenMCnt++;
					} else {
						egenWCnt++;
					}
				}
			}
		}
		
		// 일별 계산
		for (Object obj : rawList) {
			if (obj instanceof TestUserBroker) {
				TestUserBroker user = (TestUserBroker) obj;
				String testDateStr = user.getTestDate();

				if (testDateStr != null && !testDateStr.isEmpty()) {
					try {
						testDateStr = testDateStr.split("\\.")[0];
						LocalDateTime dateTime = LocalDateTime.parse(testDateStr, formatter);
						String dayKey = dateTime.toLocalDate().toString(); // yyyy-MM-dd 형태

						dailyUsageMap.put(dayKey, dailyUsageMap.getOrDefault(dayKey, 0) + 1);
					} catch (Exception e) {
						System.err.println("일자 파싱 오류: " + testDateStr);
					}
				}
			}
		}
	}

	if (participant > 0) {
		mCntPercent = (double) mCnt * 100 / participant;
		wCntPercent = (double) wCnt * 100 / participant;
	}
	
	tetoMCntPercent = (double) tetoMCnt * 100 / participant;
	egenMCntPercent = (double) egenMCnt * 100 / participant;
	tetoWCntPercent = (double) tetoWCnt * 100 / participant;
	egenWCntPercent = (double) egenWCnt * 100 / participant;

	%>

	<%!
	// 시간별 사용량
	public List<Integer> getTodayHourlyUsage(List<Integer> list, TestUserBroker user) {
	    String testDateStr = user.getTestDate();
	
	    if (testDateStr != null && !testDateStr.isEmpty()) {
	        try {
	            testDateStr = testDateStr.split("\\.")[0]; // ".0" 제거
	            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	            LocalDateTime dateTime = LocalDateTime.parse(testDateStr, formatter);
	
	            int hour = dateTime.getHour(); // 0~23
	
	            // 리스트 크기가 부족하면 채우기
	            while (list.size() <= hour) {
	            	list.add(0);
	            }
	
	            // 현재 시간 인덱스에 값 증가
	            int currentCount = list.get(hour);
	            list.set(hour, currentCount + 1);
	
	        } catch (Exception e) {
	            System.err.println("시간 파싱 오류: " + testDateStr);
	        }
	    }
	
	    return list;
	}
	
	// 일별 사용량
	
	
	%>

	<main class="main">
	
		<!-- Contact Section -->
		<section id="contact" class="contact section">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<h2>Admin Console</h2>
				<p>
					<strong><%= userName %> 관리자</strong>님 안녕하세요. <br><br> 
					해당 페이지는 <strong>최상위 관리자만 접속 가능</strong>합니다. <br>
					<strong>시스템 전체 상태를 실시간으로 모니터링</strong>하며, <strong>주요 기능 및 정책을 제어 및 제공</strong>합니다. <br><br>
					권한 없는 접근은 <span style="text-decoration: underline;">엄중히 금지</span>됩니다. <br>
					<strong>모든 접속 기록은 철저히 로그</strong>로 남으며, <strong>무단 접근 시 로그 분석을 통해 즉각 식별 및 조치</strong>됩니다.  <br><br>
					<strong>권한이 없는 사용자는 <span><a style="color: red;" href="https://ecrm.police.go.kr/minwon/crs/quick/cyber1">즉시 페이지를 벗어나십시오.</a></span></strong>
				</p>
			</div>
			<!-- End Section Title -->

			<div class="container" data-aos="fade-up" data-aos-delay="100">

				<div class="row gy-4">
					<div class="col-lg-3 col-md-6">
						<div
							class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="100">
							<i class="bi bi-people"></i>
							<h3>총 테스트 진행자 수</h3>
							<div class="pricing">
								<p>
									<div class="participant-count"><%= participant %></div>명이 함께했어요!
								</p>
							</div>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-lg-3 col-md-6">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="200">
							<i class="bi bi-pie-chart"></i>
							<h3>테스트 리스트 조회</h3>
							<a href="#goList100">실시간 조회 [개발 중]</a>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-lg-3 col-md-6">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="300">
							<i class="bi bi-graph-up-arrow"></i>
							<h3>작일 테스트 진행자 수</h3>
							<div class="pricing">
								<p>
									<div class="participant-count"><%= yesterdayCnt %></div>명이 참여했어요!
								</p>
							</div>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-lg-3 col-md-6">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="400">
							<i class="bi bi-graph-up-arrow"></i>
							<h3>금일 테스트 진행자 수</h3>
							<div class="pricing">
								<p>
									<div class="participant-count"><%= todayCnt %></div>명이 더 참여했어요!
								</p>
							</div>
						</div>
					</div>
					<!-- End Info Item -->
				</div>

				<div class="row gy-4 mt-1">
					<div class="col-lg-6 col-md-12">
						<div style="height: 580px;"
							class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="400">
							<div style="height: 100px; display: flex; flex-direction: column; align-items: center; justify-content: center;">
							    <i class="bi bi-bar-chart"></i>
							    <h3>시간별 테스트 진행자 수</h3>
							</div>

							<figure class="highcharts-figure" style="width: 100%;">
							    <div id="HourlyUsage"></div>
							</figure>
							
							<script type="text/javascript">
								Highcharts.chart('HourlyUsage', {
								    chart: {
								        zooming: {
								            type: 'xy'
								        }
								    },
								    title: {
								        text: null,
								        align: null
								    },
								    credits: {
								        text: null
								    },
								    exporting: {
								        enabled: false // 햄버거 아이콘 제거
								    },
								    xAxis: [{
								        categories: [
								            '0시', '1시', '2시', '3시', '4시', '5시', '6시', '7시', '8시', '9시', '10시', '11시',
								            '12시', '13시', '14시', '15시', '16시', '17시', '18시', '19시', '20시', '21시', '22시', '23시'
								            ],
								            crosshair: true
								        }],
								        yAxis: [{ // Primary yAxis only
								            labels: {
								                format: '{value}',
								                style: {
								                    color: Highcharts.getOptions().colors[1]
								                }
								            },
								            title: {
								                text: null,
								                style: {
								                    color: Highcharts.getOptions().colors[1]
								                }
								            }
								        }],
								        tooltip: {
								            shared: true
								        },
								        legend: {
								            align: 'center',
								            verticalAlign: 'bottom',
								            backgroundColor:
								                Highcharts.defaultOptions.legend.backgroundColor || // theme
								                'rgba(255,255,255,0.25)'
								        },
								        series: [{
								            name: '금일 시간별 테스트 사용자',
								            type: 'column',
								            data: [
								        	<% 
								        	for (Integer i : todayHourlyUsageList) {
								        	%>
								        		<%= i %>,
								        	<% 
								        	}
								        	%>
								        	],
								            tooltip: {
								                valueSuffix: '명'
								            }
	
								        	}, {
								            name: '작일 시간별 테스트 사용자',
								            type: 'spline',
								            data: [
								        	<% 
								        	for (Integer i : yesterdayHourlyUsageList) {
								        	%>
								        		<%= i %>,
								        	<% 
								        	}
								        	%>
								        	],
								            tooltip: {
								                valueSuffix: '명'
								            }
								        }]
								    });
							</script>
						</div>
					</div>
					<div class="col-lg-6 col-md-12">
						<div style="height: 580px;"
							class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="400">
							<div style="height: 100px; display: flex; flex-direction: column; align-items: center; justify-content: center;">
							    <i class="bi bi-bar-chart"></i>
							    <h3>일별 테스트 진행자 수</h3>
							</div>
							<figure class="highcharts-figure" style="width: 100%;">
							    <div id="DailyUsage"></div>
							</figure>
							
							<script type="text/javascript">
							Highcharts.chart('DailyUsage', {
							    chart: {
							    	type: 'area',
							        zooming: {
							            type: 'xy'
							        }
							    },
						        title: {
							        text: null,
							        align: null
						        },
							    credits: {
							        text: null
							    },
							    exporting: {
							        enabled: false // 햄버거 아이콘 제거
							    },
							    xAxis: {
							        categories: [
							        	<%
							        	for (Iterator<String> it = dailyUsageMap.keySet().iterator(); it.hasNext();) {
							        		String dateKey = it.next();
							        	%>
							        		'<%= dateKey %>'<%= it.hasNext() ? "," : "" %>
							        	<% } %>
							        ],
							        title: {
							            text: '날짜'
							        }
							    },
							    yAxis: {
							        title: {
							        	text: null,
								        align: null
							        }
							    },
							    tooltip: {
							        valueSuffix: '명'
							    },
							    series: [{
							        name: '일별 사용자',
							        data: [
							        	<%
							        	for (Iterator<Integer> it = dailyUsageMap.values().iterator(); it.hasNext();) {
							        		Integer count = it.next();
							        	%>
							        		<%= count %><%= it.hasNext() ? "," : "" %>
							        	<% } %>
							        ]
							    }]
							});
							</script>

						</div>
					</div>
					<div class="col-lg-12 col-md-12">
						<div style="height: 580px; overflow-y: auto;"
							class="info-item d-flex flex-column align-items-center"
							data-aos="fade-up" data-aos-delay="500">
							
							<div class="d-flex flex-column justify-content-center align-items-center" style="height: 100px;">
								<i class="bi bi-table"></i>
								<h3 class="mt-2">실시간 테스트 현황 (100건)</h3>
							</div>
							
							<table class="table table-hover" id="goList100" style="width: 95%;">
							  	<colgroup>
							    	<col style="width: 10%;">
							   		<col style="width: 20%;">
							    	<col style="width: 20%;">
							    	<col style="width: 20%;">
							    	<col style="width: 30%;">
							  	</colgroup>
								<thead class="table-light">
									<tr>
										<th class="text-center"></th>
										<th class="text-center">링크</th>
										<th class="text-center">공유 이름</th>
										<th class="text-center">백분율</th>
										<th class="text-center">생성일</th>
									</tr>
								</thead>
								<tbody>
									<%
									List<TestUserBroker> userList = (List<TestUserBroker>) request.getAttribute("userList");
									if (userList != null) {
										// [25.06.24] 해당 반복문 userList가 100보다 작을 때 오류 발생함. 해결 필요
										for (int i = 0; i < 100; i++) {
											TestUserBroker user = userList.get(i);
											String shareUserName = user.getUserName();
											if ("".equals(shareUserName) || shareUserName == null) {
												shareUserName = "-";
											}
									%>
									<tr>
										<td class="text-center"><%=i + 1%></td>
										<td class="text-center"><a href="https://kckoo.co.kr/testSharePage?userNo=<%=user.getUserNo()%>" target="_blank"><%=user.getTestResultType()%></a></td>
										<td class="text-center"><%= shareUserName %></td>
										<td class="text-center">상위 <%= user.getTopPercent() %>%</td>
										<td class="text-center"><%=user.getTestDate()%></td>
									</tr>
									<%
										}
									}
									%>

								</tbody>
							</table>

						</div>
					</div>
				</div>

				<div class="row gy-4 mt-1">
					<div class="col-lg-6 col-md-12">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="100">
							<i class="bi bi-1-circle"></i>
							<h3>1차 목표[⭕]: 이용자 1만 명</h3>
							<div style="width: 90%; height: 25px;" class="progress mt-2"
								role="progressbar" aria-label="Example with label"
								aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
								<div class="progress-bar progress-bar-striped bg-questiontree progress-bar-animated" style="width: <%=primaryGoal%>%"><%=primaryGoal%>%
								</div>
							</div>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-lg-6 col-md-12">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="100">
							<i class="bi bi-2-circle"></i>
							<h3>2차 목표[⭕]: 이용자 3만 명</h3>
							<div style="width: 90%; height: 25px;" class="progress mt-2"
								role="progressbar" aria-label="Example with label"
								aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
								<div class="progress-bar progress-bar-striped bg-questiontree progress-bar-animated" style="width: <%=String.format("%.2f", secondGoal)%>%"><%=String.format("%.2f", secondGoal)%>%
								</div>
							</div>
						</div>
					</div>
					<!-- End Info Item -->
				</div>
				
				<div class="row gy-4 mt-1">
					<div class="col-lg-6 col-md-12">
						<div
							class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="100">
							<i class="bi bi-star-fill"></i>
							<h3>최종 목표[⭕]: 이용자 10만 명</h3>
							<div style="width: 90%; height: 25px;" class="progress mt-2"
								role="progressbar" aria-label="Example with label"
								aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
								<div class="progress-bar progress-bar-striped bg-questiontree progress-bar-animated" style="width: <%=String.format("%.2f", finalGoal)%>%"><%=String.format("%.2f", finalGoal)%>%
								</div>
							</div>
						</div>
					</div>
					<!-- End Info Item -->
					<div class="col-lg-6 col-md-12">
						<div
							class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="100">
							<i class="bi bi-arrows-angle-expand"></i>
							<h3>확장 목표[🔺]: 이용자 100만 명</h3>
							<div style="width: 90%; height: 25px;" class="progress mt-2"
								role="progressbar" aria-label="Example with label"
								aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
								<div class="progress-bar progress-bar-striped bg-danger progress-bar-animated" style="width: <%=String.format("%.2f", extendedGoal)%>%"><%=String.format("%.2f", extendedGoal)%>%
								</div>
							</div>
						</div>
					</div>
					<!-- End Info Item -->					
				</div>

				<div class="row gy-4 mt-1">
					<div class="col-lg-3 col-md-6">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="100">
							<i class="bi bi-pencil-square"></i>
							<h3>Questions Editor</h3>
							<a href="/selectQuestionListPage" target="_blank">질문지 수정하기</a>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-lg-3 col-md-6">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="200">
							<i class="bi bi-pencil-square"></i>
							<h3>User Info Editor</h3>
							<div style="display: inline-block;">
								<a href="/userInfoUpdateForAdmin" target="_blank">사용자 정보 수정하기</a>
							</div>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-lg-3 col-md-6">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="300">
							<i class="bi bi-pencil-square"></i>
							<h3>User Review Editor</h3>
							<a href="#">사용자 리뷰 수정하기</a>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-lg-3 col-md-6">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="400">
							<i class="bi bi-substack"></i>
							<h3>Login User Log</h3>
							<div style="display: inline-block;">
								<a href="#" target="_blank">로그인 정보 로그 확인</a>
							</div>
						</div>
					</div>
					<!-- End Info Item -->
				</div>

				<div class="row gy-4 mt-1">
					<div class="col-lg-3 col-md-6">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="500">
							<i class="bi bi-stack"></i>
							<h3>cafe24 접속</h3>
							<a href="https://hosting.cafe24.com/?controller=myservice_hosting_main" target="_blank">cafe 24 바로가기</a>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-lg-3 col-md-6">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="600">
							<i class="bi bi-chat-left-quote"></i>
							<h3>Notion 접속</h3>
							<a href="https://www.notion.so/k2chome/Koo-Kyo-Chan-ecf7d087d17f4f76a1c3d8fdce3d4a40" target="_blank">Notion 바로가기</a>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-lg-3 col-md-6">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="700">
							<i class="bi bi-google"></i>
							<h3>Google Adsense 접속</h3>
							<a href="https://adsense.google.com/intl/ko_kr/start/" target="_blank">구글 애드센스 바로가기</a>
						</div>
					</div>
					<!-- End Info Item -->
					
					<div class="col-lg-3 col-md-6">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="800">
							<i class="bi bi-chat-fill"></i>
							<h3>Kakao Adfit 접속</h3>
							<div style="display: inline-block;">
								<a href="https://www.google.co.kr/search?q=%EC%97%90%EA%B2%90+%ED%85%8C%ED%86%A0&sca_esv=768393473445289f&hl=ko&source=hp&ei=v9E1aNP_G8COvr0P4vSC6A4&iflsig=AOw8s4IAAAAAaDXfzw5SoObxNAr_6Gn-XHKsb6TvX37M&ved=0ahUKEwiT2_6988ONAxVAh68BHWK6AO0Q4dUDCBc&uact=5&oq=%EC%97%90%EA%B2%90+%ED%85%8C%ED%86%A0&gs_lp=Egdnd3Mtd2l6Ig3sl5DqspAg7YWM7YagMgUQABiABDIFEAAYgAQyBRAAGIAEMg0QABiABBixAxiDARgKMg0QABiABBixAxiDARgKMgUQABiABDIFEAAYgAQyBRAAGIAEMgUQABiABDIFEAAYgARIgxdQAFjzEHAGeACQAQGYAXagAf8LqgEEMC4xNLgBA8gBAPgBAZgCDaACnweoAgDCAgcQLhiABBgKwgILEAAYgAQYsQMYgwHCAg4QLhiABBixAxjRAxjHAcICBxAAGIAEGArCAhEQLhiABBixAxjRAxiDARjHAcICCRAAGIAEGAoYKsICCBAuGIAEGLEDwgILEC4YgAQYsQMYgwHCAg0QLhiABBjRAxjHARgKwgIIEAAYgAQYsQPCAgQQABgDmAMA8QWo8a0oH0_PB5IHAzUuOKAH3V6yBwMwLji4B48H&sclient=gws-wiz" target="_blank">카카오 애드핏 바로가기</a>
							</div>
						</div>
					</div>
					<!-- End Info Item -->
				</div>
				
				<div class="row gy-4 mt-1">
					<div class="col-lg-3 col-md-6">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="900">
							<i class="bi bi-columns-gap"></i>
							<h3>Docking Station 접속</h3>
							<a href="#" target="_blank">Docking Station [개발 중]</a>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-lg-3 col-md-6">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="1000">
							<i class="bi bi-search"></i>
							<h3>에겐 테토 검색</h3>
							<div style="display: inline-block;">
								<a href="https://www.google.co.kr/search?q=%EC%97%90%EA%B2%90+%ED%85%8C%ED%86%A0&sca_esv=768393473445289f&hl=ko&source=hp&ei=v9E1aNP_G8COvr0P4vSC6A4&iflsig=AOw8s4IAAAAAaDXfzw5SoObxNAr_6Gn-XHKsb6TvX37M&ved=0ahUKEwiT2_6988ONAxVAh68BHWK6AO0Q4dUDCBc&uact=5&oq=%EC%97%90%EA%B2%90+%ED%85%8C%ED%86%A0&gs_lp=Egdnd3Mtd2l6Ig3sl5DqspAg7YWM7YagMgUQABiABDIFEAAYgAQyBRAAGIAEMg0QABiABBixAxiDARgKMg0QABiABBixAxiDARgKMgUQABiABDIFEAAYgAQyBRAAGIAEMgUQABiABDIFEAAYgARIgxdQAFjzEHAGeACQAQGYAXagAf8LqgEEMC4xNLgBA8gBAPgBAZgCDaACnweoAgDCAgcQLhiABBgKwgILEAAYgAQYsQMYgwHCAg4QLhiABBixAxjRAxjHAcICBxAAGIAEGArCAhEQLhiABBixAxjRAxiDARjHAcICCRAAGIAEGAoYKsICCBAuGIAEGLEDwgILEC4YgAQYsQMYgwHCAg0QLhiABBjRAxjHARgKwgIIEAAYgAQYsQPCAgQQABgDmAMA8QWo8a0oH0_PB5IHAzUuOKAH3V6yBwMwLji4B48H&sclient=gws-wiz" target="_blank">Google</a>
								/ <a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EC%97%90%EA%B2%90+%ED%85%8C%ED%86%A0&ackey=ja7dyxf2" target="_blank">Naver</a>
							</div>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-lg-3 col-md-6">
						<div
							class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="1100">
							<i class="bi bi-search"></i>
							<h3>kckoo.co.kr 검색</h3>
							<div style="display: inline-block;">
								<a href="https://www.google.com/search?q=kckoo.co.kr&sca_esv=75e0c975f2ff141b&ei=9cpcaNGFM4fd2roPopTPwQI&ved=0ahUKEwiR1La_no6OAxWHrlYBHSLKMygQ4dUDCBA&uact=5&oq=kckoo.co.kr&gs_lp=Egxnd3Mtd2l6LXNlcnAiC2tja29vLmNvLmtyMgkQABiABBgKGA0yCBAAGAgYDRgeMgoQABgFGAoYDRgeMggQABgFGA0YHjIKEAAYCBgKGA0YHjIIEAAYCBgNGB4yCBAAGAgYDRgeMggQABgIGA0YHjIKEAAYCBgKGA0YHjIIEAAYCBgNGB5IyS5QhAZYtS1wA3gAkAEAmAGZAqAB6geqAQUyLjQuMbgBA8gBAPgBAZgCBaAC4QLCAgwQABiABBiwAxgTGArCAggQABiwAxjvBcICCxAAGIAEGLADGKIEwgILEAAYsAMYogQYiQXCAgYQABgNGB7CAg0QLhiABBjHARgNGK8BwgIHEAAYgAQYDcICHBAuGIAEGMcBGA0YrwEYlwUY3AQY3gQY4ATYAQGYAwCIBgGQBga6BgYIARABGBSSBwM0LjGgB6UYsgcDMi4xuAfcAsIHBTEuMi4yyAcL&sclient=gws-wiz-serp" target="_blank">Google</a>
								/ <a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=kckoo.co.kr&ackey=zcny22rv" target="_blank">Naver</a>
							</div>
						</div>
					</div>
					<!-- End Info Item -->
					
					<div class="col-lg-3 col-md-6">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="1200">
							<i class="bi bi-substack"></i>
							<h3>감쟈의 꿀팁 전수 접속</h3>
							<div style="display: inline-block;">
								<a href="https://m.blog.naver.com/chx_xmi/223878390007" target="_blank">감쟈의 꿀팁 전수 바로가기</a>
							</div>
						</div>
					</div>
					<!-- End Info Item -->
				</div>

			</div>
		</section>
		<!-- /Contact Section -->
	</main>

	<!-- layout: 헤더 영역 -->
	<%@ include file="../layout/footer.jsp"%>

</body>

</html>