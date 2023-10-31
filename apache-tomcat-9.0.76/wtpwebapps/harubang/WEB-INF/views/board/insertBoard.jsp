<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project.harubang.board.BoardVO"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%
	BoardVO vo = new BoardVO();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>::새글 등록::</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
	<link href="${path}/resources/css/Swiper_3.3.1_css_swiper.min.css" rel="stylesheet"/>
	<link href="${path}/resources/css/insertBoard.css" rel="stylesheet"/>
	<link href="${path}/resources/css/board.css" rel="stylesheet"/>
	<meta charset = "UTF-8">
</head>
<body>

	<!-- 공통 Top 구조 include  -->	
	<jsp:include page="/WEB-INF/views/include/top.jsp"/>
	
	<!-- Banner Type  -->
	<div class="bannerWrap">
        <img src="${path}/resources/images/default/banner_jeju03.png" alt="제주이미지" class="bn">
        <div class="titleWrap">
            <h4>Write</h4>
            <h2>글 작성</h2>
        </div>
    </div>

	<center>
		<h1>글 등록</h1>
		<hr>
		<form action="insertBoard" method="post">
			<table class="intable" border="1" cellpadding="5" cellspacing="30">
				<tr>
					<td bgcolor="orange">작성자</td>
					<td align="left"><input type = "text" name = "id" value = ${id} readonly></td>
				</tr>
				<tr width="50">
					<td bgcolor="orange">카테고리</td>
					<td>
					<select name="bcategory"="category">
						<option value="자유"> 자유 </option>
						<option value="동행"> 동행 </option>
						<option value="긴급"> 긴급 </option>
						<option value="QnA"> QnA </option>
					</select>
					</td>
				</tr>
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input type="text" name="title" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left"><textarea name="bcontent" cols="40" rows="10"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="새글 등록 "></td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="/getBoardListGo">글 목록 가기</a>
	</center>
	
	    <!-- 공통 Footer 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>