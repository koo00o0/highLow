<%@page import="com.project.harubang.info.InfoDTO"%>
<%@page import="java.awt.SystemColor"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.project.harubang.info.InfoResultVO" %>
<%
	ArrayList<InfoResultVO> Infolist = (ArrayList<InfoResultVO>)request.getAttribute("infoList");
	ArrayList<InfoDTO> Infolist1 = (ArrayList<InfoDTO>)request.getAttribute("infoList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하루방</title>
	<link href="${path}/resources/css/Swiper_3.3.1_css_swiper.min.css" rel="stylesheet"/>
	<link href="${path}/resources/css/schedule.css" rel="stylesheet"/>
	<link href="${path}/resources/css/grid-swiper.css" rel="stylesheet"/>
	
</head>
<body>
	<!-- 공통 Top 구조 include  -->	
	<jsp:include page="/WEB-INF/views/include/top.jsp"/>
	<!-- Banner Type  -->
	<div class="bannerWrap">
        <img src="${path}/resources/images/default/banner_jeju01.png" alt="제주이미지" class="bn">
        <div class="titleWrap">
            <h4>Make A Day In Jeju</h4>
            <h2>나의여행</h2>
            <div class="button"><input type="button" value="일정 만들기" onClick="location.href='/schedule/makeSchedule'"></div>
        </div>
    </div>
    
    <!-- Search & menu Wrap -->
    <div class="searchWrap">
        <h2>하루방에서 나의 일정을 만들어보세요.</h2>
        <p>검색하거나 목록에서 직접 선택해주세요.</p>
        <div class="searchBar">
            <input class="serchInput" type="text"><br>
            <input type="button" class="button-add">
        </div>
        
        <nav class="menuWrap">
            <ul class="clearfix">
                <li class="active">나의 일정</li>                
                <li>찜목록</li>                
                <li>나의 기록</li>                
            </ul>
        </nav>
    </div>
        <!-- 나의 일정 목록 보여주기  -->
    <div class="swiperWrap">
        <div class="swiper-container">
            <div class="swiper-wrapper">
 
            </div>
        </div>
    </div>
    

	<script src="${path}/resources/js/jquery.min.js"></script>
	<script src="${path}/resources/js/Swiper_3.3.1_js_swiper.min.js"></script>
    <%-- <script src="${path}/resources/js/modal.js"></script> --%>
    <script src="${path}/resources/js/gird_swiper_schedule.js"></script>
     <script src="${path}/resources/js/schedule.js"></script>
	
	<script>
        $(".menuWrap li").click(function(){
     		
            let i =  $(this).index()
            $(".menuWrap li").removeClass("active")
            $(".menuWrap li").eq(i).addClass("active")
        })
        
/*      	$(function(){
     		heartList();
	    });
		
		function heartList() {
			
			$.ajax({
	    		dataType : "JSON",
	    		url : "/heartList",
	    		type : "POST",
	    		data : {
	    		},success : function(result) {
	    	 	   for(var i=0;i<result.length;i++){
	    	 		   var obj = result[i];
	    	 		   var wish = obj['wish']
	    	 		   var classid = obj['checkId']
	    	 		  	if(wish=="SUCCESS"){
	    	 		  		$('#'+classid).attr("src", "/resources/images/icon/heartR.png");
	    	 		  	}
	    	 	   }
				}
				}
	    	})
		}
		 */
		$(function(){
			myScheduleList();
		});
		
		
		function myScheduleList() {
			$.ajax({
				dataType : "JSON",
				url : "/schedule/myScheduleList",
				type : "POST",
				success : function (myresult) {
					var innerHtml = "";
					for (var i = 0 ; i < myresult.length; i++){ 
						var obj = myresult[i];
						var detail = JSON.parse(obj['detailSchedule']);
						var dateKey = Object.keys(detail);
						/* 일정 설명 */
						if((dateKey.length-1) == 0){
							var dayCount = "당일치기";
						}else{
							var dayCount = (dateKey.length-1) + "박 " +dateKey.length + "일";
						}
						
						/* 이미지 명 받기 */
						var imgname = detail[dateKey[0]][0]['imgFile'];
						innerHtml += '<div id="'+ obj['scheduleNumber'] +'" class="swiper-slide" data-filter="schedule" onclick="lookMyScehdule(\'' + obj['id'] + '\', this.id)">';
						innerHtml += '<img class="mainImg" src="'+imgname+'" alt="">';
						innerHtml += '<div class="tWrap">';
						innerHtml += '<h4>'+ obj['scheduleName'] +'</h4>';
						innerHtml += '<p>'+ dayCount+'</p>';
						innerHtml += '</div>';
						innerHtml += '</div>';	
						$(".swiper-wrapper").html(innerHtml);
					}
					var swiper = new Swiper(".swiper-container", {
					    slidesPerView: 4,
					    slidesPerGroup : 4,
					    slidesPerColumn: 3,
					    grid: {
					        rows: 3,
					    },
					    spaceBetween: 30,
					    pagination: {
					        el: ".swiper-pagination",
					        clickable: true,
					    },
					});
					
				}
			})
		}
		
    </script>
	<!-- 공통 Footer 구조 include  -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>