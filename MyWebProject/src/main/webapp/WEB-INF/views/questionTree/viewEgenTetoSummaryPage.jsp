<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.example.MyWebProject.broker.TestUserBroker"%>
<%@page import="java.util.List"%>
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

	<%
	int participant = 0;
	Object participantAttr = request.getAttribute("participant");
	if (participantAttr instanceof Integer) {
		participant = (Integer) participantAttr;
	}
	
	// 총 참여자 수에 쉼표 추가
	String formattedParticipant = "총 " + NumberFormat.getNumberInstance(Locale.KOREA).format((Integer) participant) + "명 참여!";

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
	
	// 영역별 
	int styleTetoMCnt = 0;
	int styleEgenMCnt = 0;
	int styleMixMCnt = 0;
	int socialTetoMCnt = 0;
	int socialEgenMCnt = 0;
	int socialMixMCnt = 0;
	int innerTetoMCnt = 0;
	int innerEgenMCnt = 0;
	int innerMixMCnt = 0;
	int ambitionTetoMCnt = 0;
	int ambitionEgenMCnt = 0;
	int ambitionMixMCnt = 0;
	
	int styleTetoWCnt = 0;
	int styleEgenWCnt = 0;
	int styleMixWCnt = 0;
	int socialTetoWCnt = 0;
	int socialEgenWCnt = 0;
	int socialMixWCnt = 0;
	int innerTetoWCnt = 0;
	int innerEgenWCnt = 0;
	int innerMixWCnt = 0;
	int ambitionTetoWCnt = 0;
	int ambitionEgenWCnt = 0;
	int ambitionMixWCnt = 0;

	/*
	double styleTetoMCntPercent = 0.0;
	double styleEgenMCntPercent = 0.0;
	double styleMixMCntPercent = 0.0;
	double socialTetoMCntPercent = 0.0;
	double socialEgenMCntPercent = 0.0;
	double socialMixMCntPercent = 0.0;
	double innerTetoMCntPercent = 0.0;
	double innerEgenMCntPercent = 0.0;
	double innerMixMCntPercent = 0.0;
	double ambitionTetoMCntPercent = 0.0;
	double ambitionEgenMCntPercent = 0.0;
	double ambitionMixMCntPercent = 0.0;
	
	double styleTetoWCntPercent = 0.0;
	double styleEgenWCntPercent = 0.0;
	double styleMixWCntPercent = 0.0;
	double socialTetoWCntPercent = 0.0;
	double socialEgenWCntPercent = 0.0;
	double socialMixWCntPercent = 0.0;
	double innerTetoWCntPercent = 0.0;
	double innerEgenWCntPercent = 0.0;
	double innerMixWCntPercent = 0.0;
	double ambitionTetoWCntPercent = 0.0;
	double ambitionEgenWCntPercent = 0.0;
	double ambitionMixWCntPercent = 0.0;
	*/

	int todayCount = 0;
	int yesterdayCount = 0;

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
							todayCount++;
						} else if (testDate.equals(yesterday)) {
							yesterdayCount++;
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
				
				// 영역별 테토 에겐 비율
				String styleSelfcareResultType = user.getStyleSelfcareResultType();
				String socialSkillResultType = user.getSocialSkillResultType();
				String innerTendencyResultType = user.getInnerTendencyResultType();
				String ambitionResultType = user.getAmbitionResultType();
				
				if (styleSelfcareResultType != null && !styleSelfcareResultType.isEmpty()) {
					if ("스타일 테토형".equals(styleSelfcareResultType)) {
						if ("M".equalsIgnoreCase(gender)) {
							styleTetoMCnt++;
						} else {
							styleTetoWCnt++;							
						}
					} else if ("스타일 에겐형".equals(styleSelfcareResultType)) {
						if ("M".equalsIgnoreCase(gender)) {							
							styleEgenMCnt++;
						} else {							
							styleEgenWCnt++;
						}
					} else {
						if ("M".equalsIgnoreCase(gender)) {	
							styleMixMCnt++;
						} else {
							styleMixWCnt++;
						}
					}
				}
				
				if (socialSkillResultType != null && !socialSkillResultType.isEmpty()) {
					if ("사회적 테토형".equals(socialSkillResultType)) {
						if ("M".equalsIgnoreCase(gender)) {								
							socialTetoMCnt++;
						} else {
							socialTetoWCnt++;							
						}
					} else if ("사회적 에겐형".equals(socialSkillResultType)) {
						if ("M".equalsIgnoreCase(gender)) {								
							socialEgenMCnt++;
						} else {
							socialEgenWCnt++;							
						}
					} else {
						if ("M".equalsIgnoreCase(gender)) {	
							socialMixMCnt++;
						} else {
							socialMixWCnt++;
						}
					}
				} 
				
				if (innerTendencyResultType != null && !innerTendencyResultType.isEmpty()) {
					if ("내면 테토형".equals(innerTendencyResultType)) {
						if ("M".equalsIgnoreCase(gender)) {	
							innerTetoMCnt++;
						} else {
							innerTetoWCnt++;							
						}
					} else if ("내면 에겐형".equals(innerTendencyResultType)) {
						if ("M".equalsIgnoreCase(gender)) {								
							innerEgenMCnt++;
						} else {
							innerEgenWCnt++;
						}
					} else {
						if ("M".equalsIgnoreCase(gender)) {							
							innerMixMCnt++;
						} else {
							innerMixWCnt++;							
						}
					}
				}
				
				if (ambitionResultType != null && !ambitionResultType.isEmpty()) {
					if ("야망 테토형".equals(ambitionResultType)) {
						if ("M".equalsIgnoreCase(gender)) {	
							ambitionTetoMCnt++;
						} else {
							ambitionTetoWCnt++;							
						}
					} else if ("야망 에겐형".equals(ambitionResultType)) {
						if ("M".equalsIgnoreCase(gender)) {
							ambitionEgenMCnt++;
						} else {
							ambitionEgenWCnt++;							
						}
					} else {
						if ("M".equalsIgnoreCase(gender)) {							
							ambitionMixMCnt++;
						} else {
							ambitionMixWCnt++;							
						}
					}
				}
				
			}
		}
	}

	if (participant > 0) {
		mCntPercent = (double) mCnt * 100 / participant;
		wCntPercent = (double) wCnt * 100 / participant;
	}
	
	tetoMCntPercent = (double) tetoMCnt * 200 / (mCnt + wCnt);
	egenMCntPercent = (double) egenMCnt * 200 / (mCnt + wCnt);
	tetoWCntPercent = (double) tetoWCnt * 200 / (mCnt + wCnt);
	egenWCntPercent = (double) egenWCnt * 200 / (mCnt + wCnt);
	
	/*
	styleTetoCntPercent = (double) styleTetoCnt * 100 / styleTetoCnt + styleEgenCnt + styleMixCnt;
	styleEgenCntPercent = (double) styleEgenCnt * 100 / styleTetoCnt + styleEgenCnt + styleMixCnt;
	styleMixCntPercent = (double) styleMixCnt * 100 / styleTetoCnt + styleEgenCnt + styleMixCnt;
	socialTetoCntPercent = (double) socialTetoCnt * 100 / socialTetoCnt + socialEgenCnt + socialMixCnt;
	socialEgenCntPercent = (double) socialEgenCnt * 100 / socialTetoCnt + socialEgenCnt + socialMixCnt;
	socialMixCntPercent = (double) socialMixCnt * 100 / socialTetoCnt + socialEgenCnt + socialMixCnt;
	innerTetoCntPercent = (double) innerTetoCnt * 100 / innerTetoCnt + innerEgenCnt + innerMixCnt;
	innerEgenCntPercent = (double) innerEgenCnt * 100 / innerTetoCnt + innerEgenCnt + innerMixCnt;
	innerMixCntPercent = (double) innerMixCnt * 100 / innerTetoCnt + innerEgenCnt + innerMixCnt;
	ambitionTetoCntPercent = (double) ambitionTetoCnt * 100 / ambitionTetoCnt + ambitionEgenCnt + ambitionMixCnt;
	ambitionEgenCntPercent = (double) ambitionEgenCnt * 100 / ambitionTetoCnt + ambitionEgenCnt + ambitionMixCnt;
	ambitionMixCntPercent = (double) ambitionMixCnt * 100 / ambitionTetoCnt + ambitionEgenCnt + ambitionMixCnt;
	*/
	%>

	<main class="main">


		<!-- Contact Section -->
		<section id="contact" class="contact section">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<h2>에겐과 테토, 누가 더 많을까?</h2>
				<p>
				  	여기서는 <strong>사람들이 가진 다양한 성향을 한눈에 확인</strong>할 수 있어요.<br>
					각자의 개성과 특징이 어떻게 다르고, 또 어떻게 닮아 있는지 살펴보는 것도 재미있답니다.<br>
					과연 당신은 어떤 성향에 속할까요? 지금 함께 찾아보세요!
				</p>
				
			</div>
			<!-- End Section Title -->

			<div class="container" data-aos="fade-up" data-aos-delay="100">
			
			<div class="row gy-4 mt-1">
				<div class="col-lg-12">
					<div class="info-item d-flex flex-column justify-content-center align-items-center"
						data-aos="fade-up" data-aos-delay="100">
						<i class="bi bi-record-circle-fill"></i>
						<h3>에겐/테토 테스트 전체 비율</h3>
						
							<figure class="highcharts-figure" style="width: 100%;">
						    <div id="tetoEgenTotalRatio"></div>
						    <!-- 
						    <p class="highcharts-description">
						        설명 글 
						    </p>
						     -->
						</figure>
						
						<script type="text/javascript">
						Highcharts.chart('tetoEgenTotalRatio', {
						    chart: {
						        type: 'pie',
						        custom: {},
						        events: {
						            render() {
						                const chart = this,
						                    series = chart.series[0];

						                let customLabel = chart.options.chart.custom.label;

						                if (!customLabel) {
						                    customLabel = chart.options.chart.custom.label =
						                        chart.renderer.label(
						                            '<strong><%= formattedParticipant %></strong>'
						                        )
						                            .css({
						                                color: '#000',
						                                textAnchor: 'middle'
						                            })
						                            .add();
						                }
						                
						                const x = series.center[0] + chart.plotLeft,
						                    y = series.center[1] + chart.plotTop -
						                    (customLabel.attr('height') / 2);

						                customLabel.attr({
						                    x,
						                    y
						                });
						                // Set font size based on chart diameter
						                customLabel.css({
						                    fontSize: `20px`,
						                    color: `#b3b3b3`
						                });
						            }
						        }
						    },
						    accessibility: {
						        point: {
						            valueSuffix: '%'
						        }
						    },
						    title: {
						        text: null
						    },
						    subtitle: {
						        text: '에겐 테토 비율을 한눈에 보여드릴게요.'
						    },
						    tooltip: {
						        pointFormat: '{series.name}: <b>{point.percentage:.0f}%</b> '
						        + '<br> 명수: <b>{point.cnt}명</b>'
						    },
						    legend: {
						        enabled: false
						    },
						    plotOptions: {
						        series: {
						            allowPointSelect: true,
						            cursor: 'pointer',
						            borderRadius: 8,
						            dataLabels: [{
						                enabled: true,
						                distance: 20,
						                format: '{point.name}'
						            }, {
						                enabled: true,
						                distance: -15,
						                format: '{point.percentage:.0f}%',
						                style: {
						                    fontSize: '0.9em'
						                }
						            }],
						            showInLegend: true
						        }
						    },
						    series: [{
						        name: '비율',
						        colorByPoint: true,
						        innerSize: '75%',
						        data: [{
						            name: '테토남',
						            y: <%= tetoMCntPercent %>,
						            cnt: <%= tetoMCnt %>,
						            color: '#3876f2'
						        }, {
						            name: '에겐남',
						            y: <%= egenMCntPercent %>,
						            cnt: <%= egenMCnt %>,
						            color: '#95b9ff'
						        }, {
						            name: '테토녀',
						            y: <%= tetoWCntPercent %>,
						            cnt: <%= tetoWCnt %>,
						            color: '#de66e9'
						        }, {
						            name: '에겐녀',
						            y: <%= egenWCntPercent %>,
						            cnt: <%= egenWCnt %>,
						            color: '#f79bff'
						        }]
						    }]
						});

						</script>
						
						
					</div>
				</div>
				<!-- End Info Item -->
			</div>
			
			<div class="row gy-4 mt-1">
				<div class="col-lg-12">
					<div
						class="info-item d-flex flex-column justify-content-center align-items-center"
						data-aos="fade-up" data-aos-delay="200">
						<i class="bi bi-gender-ambiguous"></i>
						<h3>에겐/테토 테스트 남녀 비율</h3>

						<div class="mt-2 progress" style="width: 90%; height: 25px;">
							<div class="progress-bar bg-teto" role="progressbar"
								style="width: <%=mCntPercent%>%"
								aria-valuenow="<%=mCntPercent%>" aria-valuemin="0"
								aria-valuemax="200">
								남자(<%= mCnt %>명) <%=String.format("%.1f", mCntPercent)%>%
							</div>
							<div class="progress-bar bg-egen" role="progressbar"
								style="width: <%=wCntPercent%>%"
								aria-valuenow="<%=wCntPercent%>" aria-valuemin="0"
								aria-valuemax="100">
								여자(<%= wCnt %>명) <%=String.format("%.1f", wCntPercent)%>%
							</div>
						</div>

					</div>
				</div>
			</div>
				
				
			
				
				<div class="row gy-4 mt-1">
					<div class="col-lg-12 col-md-12">
						<div class="info-item d-flex flex-column justify-content-center align-items-center"
								data-aos="fade-up" data-aos-delay="100">
							<i class="bi bi-bar-chart-line"></i>
							<h3>에겐/테토 세부 영역 비율</h3>
	
							<figure class="highcharts-figure" style="width: 100%;">
							    <div id="container"></div>
							</figure>
						</div>
					</div>
	
					
				</div>
				
				<script type="text/javascript">
				Highcharts.chart('container', {

				    chart: {
				        type: 'column'
				    },

				    title: {
				        text: null
				    },

				    xAxis: [{
				        categories: ['외적 스타일 및 자기관리', '사회성 및 인간관계', '내면 성향 및 감정 처리 방식', '야망 및 인생 태도'],
				        labels: {
				            rotation: 0
				        }
				    }, {
				        linkedTo: 0,
				        opposite: true, // 윗쪽으로 붙임
				        categories: ['남　여', '남　여', '남　여', '남　여'],
				        labels: {
				            style: {
				                color: 'gray',
				                fontSize: '10px'
				            }
				        },
				        tickLength: 0,
				        lineWidth: 0
				    }],


				    yAxis: {
				        allowDecimals: false,
				        min: 0,
				        title: {
				            text: null
				        }
				    },

				    tooltip: {
				        format: '<b>{key}</b><br/>{series.name}<br/>{y}명 / {point.stackTotal}명'
				    },

				    plotOptions: {
				        column: {
				            stacking: 'normal'
				        }
				    },

				    series: [{
				        name: '테토형(남)',
				        gender: '남성',
				        data: [<%= styleTetoMCnt %>, <%= socialTetoMCnt %>, <%= innerTetoMCnt %>, <%= ambitionTetoMCnt %>],
				        stack: 'tetoSection',
				        color: '#3876f2'
				    }, {
				        name: '믹스형(남)',
				        gender: '남성',
				        data: [<%= styleMixMCnt %>, <%= socialMixMCnt %>, <%= innerMixMCnt %>, <%= ambitionMixMCnt %>],
				        stack: 'tetoSection',
				        color: 'rgb(20 185 109)'
				    }, {
				        name: '에겐형(남)',
				        gender: '남성',
				        data: [<%= styleEgenMCnt %>, <%= socialEgenMCnt %>, <%= innerEgenMCnt %>, <%= ambitionEgenMCnt %>],
				        stack: 'tetoSection',
				        color: '#de66e9'
				    }, {
				        name: '테토형(여)',
				        gender: '여성',
				        data: [<%= styleTetoWCnt %>, <%= socialTetoWCnt %>, <%= innerTetoWCnt %>, <%= ambitionTetoWCnt %>],
				        stack: 'egenSection',
				        color: '#3876f2'
				    }, {
				        name: '믹스형(여)',
				        gender: '여성',
				        data: [<%= styleMixWCnt %>, <%= socialMixWCnt %>, <%= innerMixWCnt %>, <%= ambitionMixWCnt %>],
				        stack: 'egenSection',
				        color: 'rgb(20 185 109)'
				    }, {
				        name: '에겐형(여)',
				        gender: '여성',
				        data: [<%= styleEgenWCnt %>, <%= socialEgenWCnt %>, <%= innerEgenWCnt %>, <%= ambitionEgenWCnt %>],
				        stack: 'egenSection',
				        color: '#de66e9'
				    }]
				});
				</script>
				
				<div class="row gy-4 mt-1">
					<div class="col-lg-4 col-md-6">
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
	
					<div class="col-lg-4 col-md-6">
						<div
							class="info-item d-flex flex-column justify-content-center align-items-center"
							data-aos="fade-up" data-aos-delay="200">
							<i class="bi bi-graph-up-arrow"></i>
							<h3>금일 테스트 진행자 수</h3>
							<div class="pricing">
								<p>
									<div class="participant-count"><%=todayCount%></div>명이 더 참여했어요!
								</p>
							</div>
						</div>
					</div>
					<!-- End Info Item -->
					
					<div class="col-lg-4 col-md-6">
					  <a href="/selectGenderPage" style="text-decoration: none; color: inherit;">
					    <div class="info-item d-flex flex-column justify-content-center align-items-center"
					      data-aos="fade-up" data-aos-delay="300">
					      <i class="bi bi-ui-checks"></i>
					      <h3>에겐/테토 테스트 시작!</h3>
					      <span>여기를 눌러 테스트를 해보세요!</span>
					    </div>
					  </a>
					</div>
					<!-- End Info Item -->
				</div>

			</div>
		</section>
		<!-- /Contact Section -->
		
	    <!-- 테토/에겐 유형 설명 -->
 		<%@ include file="../tetoEganType/tetoEganType.jsp" %>

	    <!-- Start advertisement -->
		<div class="container text-center my-3" data-aos="fade-up" data-aos-delay="100">
			<ins class="kakao_ad_area" style="display:none;"
			data-ad-unit = "DAN-WUTaNVNzSYeOCebJ"
			data-ad-width = "250"
			data-ad-height = "250"></ins>
			<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
		</div>
		
	</main>

	<!-- layout: 헤더 영역 -->
	<%@ include file="../layout/footer.jsp"%>

</body>

</html>