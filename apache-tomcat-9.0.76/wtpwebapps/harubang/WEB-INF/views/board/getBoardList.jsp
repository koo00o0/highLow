<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.project.harubang.board.BoardServiceImpl"%>
<%@ page import="com.project.harubang.board.BoardService"%>
<%@ page import="com.project.harubang.board.BoardVO"%>
<%@ page import="com.project.harubang.board.BoardMapper"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%
	List<BoardVO> boardList = (List)request.getAttribute("boardList");
%>
<!DOCTYPE html>
<html>
<head>
<title>::게시판 목록::</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
	<link href="${path}/resources/css/Swiper_3.3.1_css_swiper.min.css" rel="stylesheet"/>
	<link href="${path}/resources/css/getBoardList.css" rel="stylesheet"/>
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
            <h4>board</h4>
            <h2>게시판</h2>
        </div>
    </div>
    
	<!-- 게시판 시작  -->
    <div class="container">
        <h2 class = "h2">게시판 목록</h2>
	
		<div class = "menuWrap">
			<ul>
				<li>전체</li>&nbsp&nbsp
				<li>자유 게시판</li>&nbsp&nbsp
				<li>QnA 게시판</li>
			</ul>
		</div>
		
	<!-- 검색 부분 -->
      <form action="getBoardListGo" method="post">
         <table border="0" cellpadding="0" cellspacing="0" width="700">
            <tr>
               <td align="right"><select name="searchCondition">
                     <option value="TITLE">제목
                     <option value="CONTENT">내용
               </select> <input name="searchKeyword" type="text"> <input type="submit"
                  value="Search" /></td>
            </tr>
         </table>
      </form>
      
      <!-- 글 리스트 부분 -->
		<table class="tableBL" border="0.5" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">번호</th>
				<th bgcolor="orange" width="200">제목</th>
				<th bgcolor="orange" width="150">작성자</th>
				<th bgcolor="orange" width="150">등록일</th>
				<th bgcolor="orange" width="100">조회수</th>
			</tr>
	  		<% 
				for (BoardVO board : boardList) {
			%>
			<tr id="category" data-filter="<%=board.getBcategory()%>">
				<td><%=board.getSeq()%></td>
				<td align="left"><a href="/getBoardGo?seq=<%=board.getSeq()%>">
						<%=board.getTitle()%></a></td>
				<td><%=board.getId()%></td>
				<td><fmt:formatDate value="<%=board.getWritedate()%>" pattern="yyyy-MM-dd"/></td>
				<td><%=board.getCnt()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<br>
		<a href="/insertBoard" class="button1">새글 등록</a>
    </div>
    
    <!-- 공통 Footer 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    
    <!-- Script 부분 -->
    <script>
	$(".menuWrap ul li").on("click", function(){
		var filter = $(this).html().toLowerCase();
		if(filter == "자유 게시판"){
			filter = "자유";
		} else if(filter == "QnA 게시판"){
			filter = "QnA";
		}
		
		if(filter == "자유"){
		          $("[data-filter='QnA']").removeClass("category").hide();
		       	  $("[data-filter='자유']").addClass("category").attr("style", null).show();
		          $("[data-filter='동행']").addClass("category").attr("style", null).show();
		          $("[data-filter='긴급']").addClass("category").attr("style", null).show();
		    } else if (filter == "전체"){
		       	  $("[data-filter='자유']").addClass("category").attr("style", null).show();
		          $("[data-filter='동행']").addClass("category").attr("style", null).show();
		          $("[data-filter='긴급']").addClass("category").attr("style", null).show();
			      $("[data-filter='QnA']").addClass("category").attr("style", null).show();
		    } else{
		         $(".category").not("[data-filter='"+filter+"']").removeClass("category").hide();
		         $("[data-filter='QnA']").addClass("category").attr("style", null).show();
		    }
		
	})
	</script>
</body>
</html>
