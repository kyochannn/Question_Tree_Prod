<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두 번째 페이지</title>

    <!-- css 파일 연결 -->
    <link rel="stylesheet" href="/style.css">
</head>
<body>
	<h1>여기는 두 번째 페이지임~</h1>
	
	<%=	session.getAttribute("userId") %>
	<%=	session.getAttribute("userName") %>
			
	<br><br><br>

    <form action="/insert" method="post">
    	<input type="text" name="name" placeholder="이름 입력" required>
    	<input type="text" name="email" placeholder="이메일 입력" required>
    	<button type="submit">DB에 저장</button>
    </form>
	
	<br><br><br>
	
    <a href="/">
       <button>메인으로</button>
    </a>
</body>
</html>