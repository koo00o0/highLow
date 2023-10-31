<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<% 	
	String name =(String)request.getSession().getAttribute("id"); 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Insert title here</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Patrick+Hand&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lisu+Bosa:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="../../../resources/ckeditor/contents.css">
	<meta charset="UTF-8" />
    <style>
    
	   body, html {
		  margin: 0;
		  padding: 0;
		}

		/* Common styles for buttons */
		a[href="goBlog"], a.main {
		  font-family: 'Dongle', sans-serif;
		  display: inline-block;
		  padding: 10px 20px;
		  font-size: 18px;
		  background-color: skyblue;
		  color: #fff;
		  text-decoration: none;
		  border-radius: 5px;
		}
		
		/* Blog creation button */
		a[href="goBlog"] {
		  float: right;
		}
		
		/* Main screen button */
		a.main {
		  position: absolute;
		  bottom: 30px;
		  right: 30px;
		}
		
		/* Flex container for items */
		.flex_column {
		  display: flex;
		  flex-direction: column;
		  width: 1020px;
		  margin: 0 auto;
		}
		
		/* 메인화면 버튼 기본 스타일 */
		a.main {
		text-align:center;
		justify-content:center;
		position:absoulte;
		width:80px;
		margin:0 auto;
         font-family: 'Dongle', sans-serif;
		  display: inline-block;
		  padding: 10px 20px;
		  font-size: 18px; /* 폰트 크기 (원하는 크기로 조정해주세요) */
		  background-color: skyblue; /* 버튼 배경색 (여기서는 파란색을 사용했습니다) */
		  color: #fff; /* 버튼 텍스트 색상 (여기서는 흰색을 사용했습니다) */
		  text-decoration: none;
		  border-radius: 5px; /* 버튼 테두리를 둥글게 만듭니다 */
		  position: absolute; /* 버튼을 절대 위치로 설정합니다 */
		  bottom: -100%; /* 버튼을 부모 요소의 아래쪽에 배치합니다 */
		  right: 50%; /* 버튼을 부모 요소의 오른쪽에 배치합니다 */
		  margin: 0 auto;
		  
		}
		

        .lineBox{
            display: flex;
            margin-bottom: 50px;
            gap: 20px;
            width: 100%;
            height: 350px;
        }
        .itemBox{
        	cursor:pointer;
            display: flex;
            width:250px;
            height:350px;
            flex-direction: column;
            border-radius:20px;
            overflow: hidden;
            -webkit-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
            -moz-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
            -ms-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
            -o-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
        }
        .itemBox img{
            width:100%;
            height:350px;
            opacity: 0.9;
        }
        .topSide{
            position: relative;
        }
        .bottomSide{
            position: absolute;
            width:100%;
            display: flex;
            flex-direction: column;
            justify-content:space-between;
            bottom:0;
            left:0;
            padding:0.75rem 0.75rem 0.5rem 1rem;
            color:white;
        }
        .bottomSide .title{
            font-weight:bold;
            font-size:35px;
            padding-top:5px;
            padding-right:15px;
            font-family: 'Dongle', sans-serif;
            font-family: 'Jua', sans-serif;
            font-family: 'Nanum Pen Script', cursive;
        }
        .bottomSide .id{
            padding-top:7px;
            font-size:25px;
            font-family: 'Dongle', sans-serif;
            margin-bottom:-15px;
        }
        .bottomSide .date{
            padding-bottom:8px;
            font-size:20px;
            font-family: 'Dongle', sans-serif;
        }
        .bottomSide img{
            width:55px;
            height:55px;
            position: absolute;
            right:5px;
            bottom:0px;
            display:inline-block;
            padding:1rem 2rem;
        }
        .heart img{
            position: absolute;
            top:13px;
            right:13px;
            width:40px;
            height:40px;
        }
         .blog{
            margin:0 auto;
            width:800px;
            height:100%;
            background: #f9f8f3;
            margin-bottom:400px;
        } 
        .blog .centerBox{
            display: flex;
            justify-content:space-between;
            font-size:20px;
            padding-bottom:10px;
            margin:0 20px;
            border-bottom:1px solid #ddd;
        }
        .blog .titleBox{
            font-size:40px;
            padding:20px;
            margin-bottom:10px;
            align-items: center;
            display: flex;
            font-family: 'Gamja Flower', cursive;
        }
        .blog .idBox{
            font-size:17px;
            left:0;
            padding-right:10px;
            padding-bottom:10px;
            display: flex;
            align-items: center;
            font-family: 'Patrick Hand', cursive;
        }
        .blog .dateBox{
            font-size:13px;
            right:0;
            display: flex;
            padding-left:5px;
            color:#878484;
            align-items: center;
            padding-bottom:5px;
            font-family: 'Lisu Bosa', serif;
        }
        .blog .bcontent{
            padding:20px;
            padding-top:40px;
            font-family: 'Poor Story', cursive;
        }
        .topBox .logo{
            width:120px;
            padding-left:20px;
            padding-top: 30px;
            margin-bottom:-15px;
        }
        .user{
            width:23px;
            height:23px;
            padding-right:10px;
            padding-left:3px;
            display: flex;
            align-items: center;
        }
        .slide{
            color:#878484;
            font-size:17px;
        }
        .subcenterBox{
        	display:flex;
        }
        .menu ::before{
		    font-family: 'Material Icons';
		    font-size: 1.5em;
		    float: left;
		    clear: left;
		}
		.menu label::before{ content: '\e5d2'; }
		.menu li:nth-child(1) a::before{ content: '\e745'; }
		.menu li:nth-child(2) a::before{ content: '\e872'; }
		#expand-menu { /* 체크박스 폼 요소 감춤 */
		    display: none;
		}
		#expand-menu:checked ~ ul { /* 체크박스 체크되었으면 메뉴 목록 표시 - 반응형 표시용 */
		    display: block;
		    height: auto;
		}
		.menu {
		    display: block;
		    width: 30px;
		    color: #fff;
		    border-radius: 5px;
		    padding: 5px;
		    box-sizing: border-box;
		    overflow: hidden; /* 반응형 애니메이션용 */
		    transition: all 0.5s ease; /* 반응형 애니메이션 */
		    float:right;
        	margin-right:10px;
        	font-size:10px;
        	margin-top: -35px;
    		margin-right: 20px;
        	padding-top:10px;
		}
		.menu ul {
		    list-style: none;
		    margin: 0;
		    padding: 0;
		}
		.menu a, .menu > label {
		    display: block;
		    height: 20px;
		    padding: 4px;
		    cursor: pointer;
		    color: #000;
		    text-decoration: none;
		    padding-top:3px;
		}
		.menu:hover {
		    color: #fff;
		    width:70px;
		}
		.menu ul li:hover {
		    background-color: #e1e1e1;
		    color: #fff;
		    border-radius: 12px;
		}
		.menu div {
		    position: absolute; /* 절대 위치로 텍스트 고정 */
		    line-height: 1.5;
		    font-size: 1em;
		    font-family: 'Noto Sans KR';
		    padding: 0 0 0 20px; /* 패딩 20p로 축소 */
		}
		@media screen and (max-width:1023px) {
		    .menu { /* 1단계 */
		        width: 30px;
		    }
		}
		.menu #expand-menu:not(:checked) ~ ul { /* 데스크탑 화면에서도 메뉴를 접었더 펼칠 수 있음 */
		    display: none;
		}
		
		.lineBox {
		  display: flex;
		  margin-bottom: 50px;
		  gap: 20px;
		  width: 100%;
		  height: 350px;
		}
    </style>
    <script>
    
    	function getInfoPage(param){
    		$.ajax({
    			dataType : "text",
    			type : "POST",
    			url : "/infoPage",
    			data : {
    				"seq" : param
    			},success : function(result) {
    				$('#realBox').css({
    					'display' : 'none'
    				})
    				$('.toptitle').css({
    					'display' : 'none'
    				})
    				$('.blog').css({
    					'display' : 'block'
    				})
    				var obj = result.split("^")				
    				$('.idBox').text(obj[0])
    				//obj[0] : 아이디
    				$('.titleBox').text(obj[1])
    				//obj[1] : 제목
    				$('.dateBox').text(obj[2])
    				$('#resultSeq').val(param)
    				$('#rSeq').val(param)    				

    				//obj[2] : 작성한날짜
    				document.getElementById("realBori").innerHTML = obj[3];
    				//obj[3] : 컨텐트내용
    			}
    		})
    	}
    	
    	function deleteB(){
    		$("#deleteBtn").submit();
    	}
    	
    	function editB(){
    		$("#editBtn").submit();    		
    	}
    	
    </script>
</head>
<body>

<h1 class='toptitle'>블로그 보기</h1>
		
	   <a class="" href="goBlog">블로그 작성</a>

       <div class="flex_column" id='realBox'>
        <div class="lineBox">
            <!--4개 반복-->
           <c:forEach begin="0" end="3" step="1" var="vo" items="${list}">
                <div class="itemBox" onclick="getInfoPage('${vo.getSeq()}')">
                    <div class="topSide">
                        <img src="${vo.getBimgpath()}" alt="">
                        <div class="heart">
                            <img src="${path}/resources/images/icon/heart.png">
                        </div>
                        <div class="bottomSide">
                            <div class="title">${vo.getTitle()}</div>
                            <div class="id">${vo.getId()}</div>
                            <div class="date">${vo.getWritedate()}</div>
                            <img src="${path}/resources/images/icon/arrow.png">
                        </div>
                    </div>
                </div>
           </c:forEach>
            <!--4개 반복-->
        </div>
        <div class="lineBox">
            <!--4개 반복-->
           <c:forEach begin="4" end="7" step="1" var="vo" items="${list}">
                <div class="itemBox" onclick="getInfoPage('${vo.getSeq()}')">
                    <div class="topSide">
                        <img src="${vo.getBimgpath()}" alt="">
                        <div class="heart">
                            <img src="${path}/resources/images/icon/heart.png">
                        </div>
                        <div class="bottomSide">
                            <div class="title">${vo.getTitle()}</div>
                            <div class="id">${vo.getId()}</div>
                            <div class="date">${vo.getWritedate()}</div>
                            <img src="${path}/resources/images/icon/arrow.png">
                        </div>
                    </div>
                </div>
           </c:forEach>
            <!--4개 반복-->
        </div>
        <div class="lineBox">
            <!--4개 반복-->
           <c:forEach begin="8" end="11" step="1" var="vo" items="${list}">
                <div class="itemBox" onclick="getInfoPage('${vo.getSeq()}')">
                    <div class="topSide">
                        <img src="${vo.getBimgpath()}" alt="">
                        <div class="heart">
                            <img src="${path}/resources/images/icon/heart.png">
                        </div>
                        <div class="bottomSide">
                            <div class="title">${vo.getTitle()}</div>
                            <div class="id">${vo.getId()}</div>
                            <div class="date">${vo.getWritedate()}</div>
                            <img src="${path}/resources/images/icon/arrow.png">
                        </div>
                    </div>
                </div>
           </c:forEach>
            <!--4개 반복-->
           <div class="parent-container">  <a class="main" href="/">메인 ^^</a></div>
        </div>
      </div>
      <div class='blog' style="display:none">
        <div class="topBox">
            <img class="logo" src="${path}/resources/images/noticeimg/logo.png">
            <div class="titleBox">나는 가만히 있는 게 내 일인데</div>
            <div class="centerBox">
	            <div class="subcenterBox">
	                <img class="user" src="${path}/resources/images/icon/profile-user.png">
	                <div class="idBox">bori</div>
	                <div class="slide">></div>
	                <div class="dateBox">2023.07.31</div>
                </div>
            </div>
                <div class="menu">
	                <label for="expand-menu"></label>
	                <input type="checkbox" id="expand-menu" name="expand-menu">
	                <ul>
		                <li><a href="#" class="item" onclick="editB()">수정</a></li>
		           		<li><a href="#" class="item" onclick="deleteB()">삭제</a></li>                    
	                </ul>
	                <form action="/editBlog" method="POST" id="editBtn">
	                	<input type="hidden" value="" name="seq" id='rSeq'>
	                </form>
	                <form action="/deleteBlog" method="POST" id="deleteBtn">
		                <input type="hidden" value="" name="seq" id='resultSeq'>	             
		            </form>	
	            </div>
        </div>
        <div class="bcontent" id='realBori'>
            제주도에 놀러왔다!!
        </div>
      </div>
</body>
</html>

        