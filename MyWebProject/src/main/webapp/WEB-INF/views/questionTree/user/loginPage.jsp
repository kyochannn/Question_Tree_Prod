<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html lang="ko">

<!-- 절대경로 방안:  -->

<head>
  	<jsp:include page="../../layout/meta.jsp" />
  	<link href="css/question-page.css" rel="stylesheet">
  	<link href="css/login-page.css" rel="stylesheet">
  	<script src="js/loginScript.js"></script>
</head>

<body class="service-details-page">

  	<!-- layout: 헤더 영역 -->
	<main>
	    <div class="login-box">
			<div class="d-flex justify-content-center text-black mt-3" style="text-align: center;">
			  <h1 class="fs-2">
			    <a href="/" class="logo d-flex align-items-center me-auto text-black" style="text-decoration: none;">
			      <img style="width: 30px;" src="img/logo.webp" alt="">
			      <strong style="margin-left: 8px; color: #3e5055;">Question tree</strong>
			    </a>
			  </h1>
			</div>

			<form action="/processLogin" method="POST">
			  <div class="user-box mt-4">
			    <input type="text" name="userName" autofocus required>
			    <label>ID</label>
			  </div>
			  <div class="user-box">
			    <input type="password" name="password" required>
			    <label>Password</label>
			  </div>
		    <!-- 
			  <div class="row">
			    <div class="col">
			  	<p class="remember-id text-start"><input name="rememberId" type="checkbox">  로그인 상태 유지</p>
			    </div>
			    <div class="col">
			  	<p class="text-end" onclick="test()" style="cursor: pointer;">회원 가입</p>
			    </div>
			  </div>
		     -->
			  <input class="login-btn" type="submit" value="관리자 로그인" >
			  <input class="dist" type="hidden" value="${userName}" >
			  
			</form>
			<div class="container copyright text-center mt-4 mb-0" style="font-size: 12px;">
			    <p>© <span>Copyright</span><strong class="px-1 sitename">Question tree</strong><span>All Rights Reserved</span>
			     	<br> webmaster@kckoo.co.kr
			    </p>
		  	</div>
		</div>

	</main>
	<!-- layout: 헤더 영역 -->

</body>

</html>