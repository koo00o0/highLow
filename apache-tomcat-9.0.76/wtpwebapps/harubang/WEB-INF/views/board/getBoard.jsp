<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.List"%>
<%@ page import="com.project.harubang.board.BoardMapper"%>
<%@ page import="com.project.harubang.board.BoardVO"%>
<%@ page import="com.project.harubang.reply.ReplyVO"%>
<%@ page import="com.project.harubang.reply.ReplyMapper" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	BoardVO board = (BoardVO)request.getAttribute("board");
	String userId = (String)request.getSession().getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
  <title>글 상세</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
	<link href="${path}/resources/css/Swiper_3.3.1_css_swiper.min.css" rel="stylesheet"/>
	<link href="${path}/resources/css/getBoard.css" rel="stylesheet"/>
	<link href="${path}/resources/css/board.css" rel="stylesheet"/>
	<meta charset="UTF-8">
</head>
<body>

	<!-- 공통 Top 구조 include  -->	
	<jsp:include page="/WEB-INF/views/include/top.jsp"/>
	
	<!-- Banner Type  -->
	<div class="bannerWrap">
        <img src="${path}/resources/images/default/banner_jeju03.png" alt="제주이미지" class="bn">
        <div class="titleWrap">
            <h4>see board</h4>
            <h2>글 상세보기</h2>
        </div>
    </div>
    
    <!-- 글 상세  -->
	<center>
		<h1>글 상세</h1>
		<hr>
		<form action="/updateBoard" method="post">
			<input name="seq" type="hidden" value="<%=board.getSeq()%>" />
			<table class="table" border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="#9EAE72" width="70">제목</td>
					<td align="left"><input class="title" name="title" type="text" value=<%=board.getTitle()%> readonly></td>
				</tr>
				<tr>
					<td bgcolor="#9EAE72">아이디</td>
					<td align="left"><%=board.getId()%></td>
				</tr>
				<tr>
					<td bgcolor="#9EAE72">작성일</td>
					<td align="left"><fmt:formatDate value="<%=board.getWritedate()%>" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<td bgcolor="#9EAE72">카테고리</td>
					<td align="left"><%=board.getBcategory()%></td>
				</tr>
				<tr>
					<td bgcolor="#9EAE72">내용</td>
					<td align="left"><textarea class="textarea" name="bcontent" cols="40" rows="10">
						<%=board.getBcontent()%></textarea></td>
				</tr>
				<tr>
					<td bgcolor="#9EAE72">조회수</td>
					<td align="left"><%=board.getCnt()%></td>
				</tr>
				<tr>
					<% if(userId.equals(board.getId())) { %>
					<td colspan="2" align="right" padding="5px">
					<input type="submit" value="글 수정" /></td>
					<% }else{ %>
					<td colspan="2" align="left">
					<input class="idget" type="text" value="<%=userId%> 님 안녕하세요" readonly /></td>
					<% } %>
				</tr>
			</table>
		</form>
		
	<!-- 네비게이션 -->
	<hr>
		<div class = "navi">
		    <a href="/insertBoard" class="button">글 등록</a>&nbsp;&nbsp;&nbsp;
		    <% if(userId.equals(board.getId())) { %>
		    <a href="/deleteBoard?seq=<%=board.getSeq()%>" class="button">글 삭제</a>&nbsp;&nbsp;&nbsp;
		    <a href="/getBoardListGo" class="button">글 목록</a>
		    <% }else{ %>
		    	<a href="/getBoardListGo" class="button">글 목록</a>
		    <% } %>
		</div>
	<hr>
		
		<!-- 댓글 리스트 나오는 div -->
		<div class = "replyDiv">
	      <c:forEach items="${reply}" var="reply">
	        <div class="reply">
	          <p class="reply-info">${reply.id} / <fmt:formatDate value="${reply.writedate}" pattern="yyyy-MM-dd" /></p>
	          <p class="reply-content">${reply.ccontent}</p>
	          <p>
	          <a href = "/replyDelete?seq=${board.seq}&cseq=${reply.cseq}">삭제</a>
	          </p>
	        </div>
	      </c:forEach>
    	</div>
    	
    <!-- 댓글작성 -->
    <div class="reply-form">
      <form action="/replyWrite" method="post">
        <p class="pid">
          <label>댓글 작성자</label>
          <input class = "replyId" type="text" name="id" value = <%=userId%> readonly>
        </p>
        <p>
          <textarea class = "replyText" rows="5" cols="50" name="ccontent" placeholder="한번 작성한 글은 수정할 수 없습니다, 신중히 작성해 주세요."></textarea>
        </p>
          <input type="hidden" name="seq"  value="<%=board.getSeq()%>" onclick="zz()">
          <button class="btn" type="submit" >댓글 작성</button>
        </p>
      </form>
    </div>
  </center>
  
  <!-- 공통 Footer 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<script>

function zz() {
	alert("댓글작성완료");
	location.href="/getBoardListGo";
}

</script>
</body>
</html>