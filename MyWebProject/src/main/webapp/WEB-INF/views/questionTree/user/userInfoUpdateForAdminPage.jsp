<%@page import="com.example.MyWebProject.broker.QTUserBroker"%>
<%@page import="com.example.MyWebProject.broker.QuestionsMasterBroker"%>
<%@page import="com.example.MyWebProject.broker.QuestionsBroker"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="../../layout/meta.jsp" />
<link href="css/testResult-page.css" rel="stylesheet">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

$(document).ready(function () {
		
  // 테스트 질문지 조회 관련
  $("#questionSelect").on("change", function () {
    const selectedValue = $(this).val();
    console.log("selectedValue: " + selectedValue);
    
    // 질문지 기본정보 가져오기 (MasterTable)
    $.ajax({
      url: "/getQuestionsMaster",
      type: "POST",
      contentType: "application/json",
      data: JSON.stringify({ questionNo: selectedValue }),
      success: function (data) {
        const $tbody = $("#question-master-table-body");
        $tbody.empty(); // 기존 내용 초기화

        console.log(data);

        if (!data || data === null) {
          $tbody.append(`<tr id="no-data-row"><td colspan="5" class="text-center">조회된 내용이 없습니다.</td></tr>`);
          return;
        }
        
        $tbody.append(`
          <tr>
            <td class="align-middle text-center">\${data.questionNo}</td>
            <td class="align-middle"><input style="width: 100%;" value="\${data.questionName}" /></td>
            <td class="align-middle text-center">\${data.userId}</td>
            <td class="align-middle text-center">\${data.createdDate}</td>
            <td class="align-middle text-center">\${data.updatedDate}</td>
          </tr>
        `);

        // 혹시 다 비어있었는지 확인 후 메시지 표시
        if ($tbody.children().length === 0) {
          $tbody.append(`<tr id="no-data-row"><td colspan="5" class="text-center">조회된 내용이 없습니다.</td></tr>`);
        }
      },
      error: function () {
        alert("질문지 상세 정보를 불러오는 데 실패했습니다.");
      }
    });
  
	// 질문지 상세정보 가져오기	
    $.ajax({
      url: "/getQuestions",
      type: "POST",
      contentType: "application/json",
      data: JSON.stringify({ questionNo: selectedValue }),
      success: function (data) {
        const questionFields = 24;

        const $tbody = $("#question-table-body");
        $tbody.empty(); // 기존 내용 초기화

        if (!data || Object.keys(data).length === 0) {
          $tbody.append(`<tr id="no-data-row"><td colspan="3" class="text-center">조회된 내용이 없습니다.</td></tr>`);
          return;
        }

        for (let i = 1; i <= questionFields; i++) {
          const question = data[`question\${i}`] || '';
          const questionType = data[`question\${i}Type`] || '';

          if (!question && !questionType) continue;

          $tbody.append(`
            <tr>
              <td class="align-middle text-center">question\${i}</td>
              <td class="align-middle"><input style="width: 100%;" value="\${question}" /></td>
              <td class="align-middle"><input style="width: 100%;" value="\${questionType}" /></td>
            </tr>
          `);
        }

        // 혹시 다 비어있었는지 확인 후 메시지 표시
        if ($tbody.children().length === 0) {
          $tbody.append(`<tr id="no-data-row"><td colspan="3" class="text-center">조회된 내용이 없습니다.</td></tr>`);
        }
      },
      error: function () {
        alert("질문지 상세 정보를 불러오는 데 실패했습니다.");
      }
    });

  });
  
  $(".questions-update-btn").on("click", function () {
	  // ====== 1. 질문지 기본정보 추출 ======
	  const questionNo = $("#question-master-table-body tr:first td:nth-child(1)").text().trim();
	  const questionName = $("#question-master-table-body tr:first td:nth-child(2) input").val().trim();
	  
	  const masterData = {
	    questionNo: questionNo,
	    questionName: questionName
	  };

	  // ====== 2. 질문지 상세정보 추출 ======
	  const detailData = {
	    questionNo: questionNo
	  };

	  $("#question-table-body tr").each(function (index) {
	  	const $row = $(this);

	  	const questionText = $row.find("td:nth-child(2) input").val().trim();
	  	const questionType = $row.find("td:nth-child(3) input").val().trim();

	  	// 질문 번호는 index + 1 로 설정
	  	detailData[`question\${index + 1}`] = questionText;
	  	detailData[`question\${index + 1}Type`] = questionType;
	  });

	  // ====== 3. 기본정보 업데이트 요청 ======
	  $.ajax({
	    url: "/updateQuestionsMaster",
	    type: "POST",
	    contentType: "application/json",
	    data: JSON.stringify(masterData),
	    success: function () {
	      console.log("기본 정보 업데이트 성공");
	    },
	    error: function () {
	      alert("기본 정보 업데이트에 실패했습니다.");
	    }
	  });

	  // ====== 4. 상세정보 업데이트 요청 ======
	  $.ajax({
	    url: "/updateQuestions",
	    type: "POST",
	    contentType: "application/json",
	    data: JSON.stringify(detailData),
	    success: function () {
	      alert("질문지가 성공적으로 수정되었습니다.");
	    },
	    error: function () {
	      alert("상세 정보 업데이트에 실패했습니다.");
	    }
	  });
	});

  
});

</script>
</head>

<body class="starter-page-page">

	<!-- layout: 헤더 영역 -->
	<%@ include file="../../layout/header.jsp"%>
	
	<%
	List<QTUserBroker> userList = (List<QTUserBroker>) request.getAttribute("userList");
	System.out.println("userList: " + userList);
	System.out.println("userList.size(): " + userList.size());
	%>
		
	<main class="main">
	
		<!-- Contact Section -->
		<section id="contact" class="contact section">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<h2>Questions Editor</h2>
				<p>
					<strong><%= userName %> 관리자</strong>님 안녕하세요. <br><br> 
					해당 페이지는 <strong>최상위 관리자만 접속 가능</strong>합니다. <br><br>
					<strong>질문지에 대한 정보를 엑세스</strong>하며, <strong>편집 및 수정</strong>합니다. <br>
					가능한 PC를 이용하여 접속하여 주십시오.
				</p>
			</div>
			<!-- End Section Title -->

			<div class="container" data-aos="fade-up" data-aos-delay="100">

				<div class="info-item d-flex flex-column align-items-center"
					data-aos="fade-up" data-aos-delay="500">
					
					<div class="d-flex flex-column justify-content-center align-items-center" style="height: 100px;">
						<i class="bi bi-table"></i>
						<h3 class="mt-2">사용자 정보 통합 편집</h3>
					</div>							
					
					<div style="width: 95%;">
						<div id="questionForm">
							<h3>| 검색 필터</h3>
							<select id="questionSelect" class="form-select mb-3" aria-label="Default select">
								<option selected disabled>조회할 권한을 선택해주세요.</option>

							</select>
						</div>
						<div id="questionUpdateForm">
							<h3>| 사용자 리스트</h3>
							<table class="table table-hover" id="goList100">
							  	<colgroup>
							    	<col style="width: 5%;">
							    	<col style="width: 10%;">
							    	<col style="width: 15%;">
							   		<col style="width: 15%;">
							    	<col style="width: 15%;">
							    	<col style="width: 20%;">
							    	<col style="width: 20%;">
							  	</colgroup>
								<thead class="table-light text-center">
									<tr>
										<th class="align-middle">No.</th>
										<th class="align-middle">사용자 아이디</th>
										<th class="align-middle">사용자 이름</th>
										<th class="align-middle">사용자 상태</th>
										<th class="align-middle">사용자 권한</th>
										<th class="align-middle">사용자 생성일</th>
										<th class="align-middle">사용자 수정일</th>
									</tr>
								</thead>
								<tbody id="question-master-table-body">
								<%
								int userCnt = 1;
								for (QTUserBroker broker : userList) {
								%>
									<tr>
										<td class="align-middle text-center"><%= userCnt++ %></td>
										<td class="align-middle text-center"><input class="form-control" type="text" value="<%= broker.getUserId() %>"></td>
										<td class="align-middle text-center"><input class="form-control" type="text" value="<%= broker.getUserName() %>"></td>
										<td class="align-middle text-center"><input class="form-control" type="text" value="<%= broker.getUserStatus() %>"></td>
										<!-- 
										<td class="align-middle text-center"><input type="text" value="<%= broker.getUserRole() %>"></td>
										  -->
										<td class="align-middle text-center">							
											<select id="questionSelect" class="form-select" aria-label="Default select">
												<option selected>siteAdmin</option>
												<option>productAdmin</option>
												<option>user</option>
											</select></td>
										<td class="align-middle text-center"><%= broker.getUpdatedDate() %></td>
										<td class="align-middle text-center"><%= broker.getCreatedDate() %></td>
									</tr>
								<%
								}
								%>
								</tbody>
							</table>
							<h3>| 권한 정보 설명</h3>
							
							<table class="table table-hover" id="goList100">
							  	<colgroup>
							    	<col style="width: 10%;">
							   		<col style="width: 80%;">
							    	<col style="width: 10%;">
							  	</colgroup>
								<thead class="table-light text-center">
									<tr>
										<th class="align-middle">식별값</th>
										<th class="align-middle">질문 내용</th>
										<th class="align-middle">질문 유형</th>
									</tr>
								</thead>
								<tbody id="question-table-body">
									<tr id="no-data-row">
										<td colspan="3" class="text-center">조회된 내용이 없습니다.</td>
									</tr>
								</tbody>
							</table>
							<div class="text-center mt-3">
								<button class="btn btn-primary questions-update-btn">질문지 수정</button>						
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- /Contact Section -->
	</main>

	<!-- layout: 헤더 영역 -->
	<%@ include file="../../layout/footer.jsp"%>

</body>

</html>