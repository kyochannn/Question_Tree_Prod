<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String userName = "Guest";
    
	// 로그인 한 사용자 정보 가져오기
    userName = (String) session.getAttribute("userName");
    if ("Guest".equals(userName)) {
        // 로그인 안 했으면 로그인 페이지로 리다이렉트
        response.sendRedirect("/");
        return;
    }
%>
    
<header id="header" class="header d-flex align-items-center sticky-top">
  <div class="container-fluid container-xl position-relative d-flex align-items-center">

    <a href="/" class="logo d-flex align-items-center me-auto">
      <img src="img/logo.webp" alt="">
      <h1 class="sitename">Question tree</h1>
    </a>

    <nav id="navmenu" class="navmenu">
      <ul>
        <li><a href="/" class="active">Home</a></li>
        <li><a href="/selectGenderPage">Start test</a></li>
        <li><a href="/releaseNotesPage">Release note</a></li>
        <%
        	if (userName == null) {
        %>
        <li><a href="/loginPage">Login</a></li>
        <%
        	} else {
        %>
        <li><a href="/viewAdminPage">Admin console</a></li>
        <li><a href="/processLogout">Logout</a></li>
        <%
        	}
        %>
      </ul>
      <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
    </nav>
  </div>
</header>