<%@page import="java.awt.SystemColor"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.project.harubang.schedule.scheduleResultVO" %>
<%
	ArrayList<scheduleResultVO> schedulelist = (ArrayList<scheduleResultVO>)request.getAttribute("scheduleList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하루방</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/daterangepicker.css" />
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/makeschedule.css" />
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/my_schedule_modal.css" />
	<script type="text/javascript" src="${path}/resources/js/schedule_jquery.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/moment.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/daterangepicker.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 
</head>
<body>
	 <jsp:include page="/WEB-INF/views/include/subtop.jsp"/>
	 
	 <section class="sectionWrap">
        <div class="itemWrap">
            <div class="scheduleWrap">
                <h3>일정명</h3>
                <input class="schedulenameInput" type="text" placeholder="일정명을 입력하세요."/>
             <!--    <p>* 일정명이 중복됐습니다. 다시 입력해주세요.</p> -->
                <h3>날짜선택</h3>
                <input type="text" name="daterange" placeholder="2023.08.26-2023.09.26" readonly />
            </div>
            <div class="textWrap">상세 설정</div>
            <div class="selectWrap">
                <select class="form-select">
                    <option selected>Open this select date</option>
                </select>
            </div>
            <div class="menuWrap">
                <ul>
                    <li class="active">호텔</li>
                    <li>장소</li>
                </ul>
            </div>
            <div class="scrollWrapAdd">
            	<!-- 일정 추가 시 추가됨 -->
            </div>
        </div>
        <div class="mapWrap">
        </div>
        <div class="infoWrap">
            <div class="searchWrap">
                <input class="searchInput" type="text">
                <img src="${path}/resources/images/icon/search_org.png" alt="" onclick="searchKeyWord()">
            </div>
            
            <div class="menuWrap">
                <ul>
                    <li class="active">호텔</li>
                    <li>장소</li>
                    <li>찜목록</li>
                </ul>
            </div>

            <div class="scrollWrap">
            	<% for (int i = 0 ; i < schedulelist.size(); i++){ 
            			scheduleResultVO scheduleinfo = schedulelist.get(i);
						String newSrcFile = "/resources/images/info/" + scheduleinfo.getScheduleDTO().getSort() + "/" + scheduleinfo.getScheduleDTO().getImgfile();
						/* String newAddress = info.getInfoAddressDTO().getAddressName(); */
						String[] newAddress = scheduleinfo.getScheduleAddressDTO().getAddressName().split(" ");
						String newAddressName = newAddress[0] + " " + newAddress[1];
						String ItemID = scheduleinfo.getScheduleDTO().getItemId();
						String ItemName = scheduleinfo.getScheduleDTO().getItemName();
				%>
                <div id="<%=ItemID%>" class="scrollItem" data-filter="<%= scheduleinfo.getScheduleDTO().getSort() %>" onclick="showMap(this.id)">
                    <div class="imgItem">
                        <img src="<%=newSrcFile %>" alt="">
                    </div>
                    <div class="textItem">
                        <h4><%= ItemName %></h4>
                        <p><%=newAddressName %></p>
                    </div>
                    <div class="add">
                        <img src="${path}/resources/images/icon/plus.png" alt="" onclick="clickAddSchedule('<%=ItemID%>','<%= ItemName %>','<%= newSrcFile %>')">
                    </div>
                </div>
                <%} %>
            </div>
        </div>
    </section>
    
    <div id="modal" class="addScheduleWrap">
        <div class="addScheduleBox">
            <div class="imageWrap">
                <img src="" alt="">
            </div>
            <div class="textWrap">
                <div class="placeWrap">
                    <p>장소명</p>
                    <input type="text" class="place" readonly>
                    <input type="hidden" class="ItemId">
                </div>
                <div class="dateWrap">
                    <p>날짜</p>
                    <input type="text" class="date" readonly>
                </div>
                <div class="timeWrap">
                    <div class="startWrap">
                        <p>시작 시간</p>
                        <input type="time" class="startTime">
                    </div>
                    <div class="endWrap">
                        <p>종료 시간</p>
                        <input type="time" class="endTime">
                    </div>
                </div>
            </div>
            <div class="buttonWrap">
               <!--  <input type="button" value="확인" class="saveButton" onclick="addSchedultItem()">
                <input type="button" value="취소" class="cancelButton" onclick="cancelButton()"> -->
            </div>
        </div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69c2dceabcf2a41c9aab2dff8c9b5944"></script>
    <script type="text/javascript" src="${path}/resources/js/schedule_menu.js"></script>
    <script type="text/javascript" src="${path}/resources/js/my_schedule_modal.js"></script>
    <script type="text/javascript" src="${path}/resources/js/my_schedule_add.js"></script>
	<script>
	/* 지도 초기 화면 설정 */
    var mapContainer = document.getElementsByClassName('mapWrap')[0], // 지도를 표시할 div 
    	mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	/* 지도 */
	function showMap(id){
		
		var container = document.getElementsByClassName('mapWrap')[0];
		$.ajax({
	    	dataType: 'json',
	    	type:"POST",
	    	url:"/schedule/showMapValue",
	    	data: {
	    		"id" : id,
	    	},
	    	success : function(result){
	    		var latitude = result[0].scheduleAddressDTO.latitude;
	    		var longitude = result[0].scheduleAddressDTO.longitude;
	    		 	var options = {
    		        center: new kakao.maps.LatLng(latitude, longitude),
	    		        level: 3
	    		};
	    		 
	    		 var map = new kakao.maps.Map(container, options); 
	    		 
	    		 var markerPosition  = new kakao.maps.LatLng(latitude, longitude); 

	    			// 마커를 생성합니다
	    			var marker = new kakao.maps.Marker({
	    			    position: markerPosition
	    			});

	    			// 마커가 지도 위에 표시되도록 설정합니다
	    			marker.setMap(map);
	    	}
		});
	}
	
		
	/* 정보 검색 기능 */
	function searchKeyWord(){
		var keyword = $('.searchInput').val();
		console.log(keyword);
		$.ajax({
	    	dataType: 'json',
	    	type:"POST",
	    	url:"/schedule/searchKeyWord",
	    	data: {
	    		"keyword" : keyword,
	    	},
	    	success : function(searchResult){
	    		/* console.log(searchResult); */
	    		 $('.infoWrap .scrollWrap .scrollItem').css('display', 'none');
	    		 $('.infoWrap .menuWrap ul li').removeClass( 'active' );
	    		 
	    		 var imgname;
	    		 var addressName = [];
	    		 var newAddress;
	    		 var innerHtml = "";
	    		 var ItemID;
	    		 var ItemName;
	    		 for(var i = 0; i < searchResult.length; i++){
	    			 imgname = "${path}/resources/images/info/" + searchResult[i].scheduleDTO.sort + "/" + searchResult[i].scheduleDTO.imgfile;
	    			 addressName = searchResult[i].scheduleAddressDTO.addressName.split(" ");
	    			 newAddress = addressName[0] + " " + addressName[1];
	    			 ItemID = searchResult[i].scheduleDTO.itemId;
	    			 ItemName = searchResult[i].scheduleDTO.itemName;

	    			 innerHtml += '<div id="' + ItemID + '" class="scrollAllItem" data-filter="' + searchResult[i].scheduleDTO.sort + '" onclick="showMap(this.id)">';
	    		     innerHtml += '<div class="imgItem">';
	                 innerHtml += '<img src="'+ imgname + '"alt="">';
	                 innerHtml += '</div>';
	                 innerHtml += '<div class="textItem">';
	                 innerHtml += '<h4>' + ItemName + '</h4>';
	                 innerHtml += '<p>' + newAddress + '</p>';
	                 innerHtml += '</div>';
	                 innerHtml += '<div class="add">';
	                 innerHtml += '<img src="${path}/resources/images/icon/plus.png" alt="" onclick="clickAddSchedule(\'' + ItemID + '\',\'' + ItemName +'\',\''+ imgname +'\')">';
	                 innerHtml += '</div>';
	                 innerHtml += '</div>';
	                 $(".infoWrap .scrollWrap").html(innerHtml);
	   
	    		 }
	    	}
		});
		
	}

    $(".itemWrap .menuWrap ul li").on("click", function(){
        $(".itemWrap .menuWrap ul li").removeClass("active");
        $(this).addClass("active");
    });

    
    var date = [];
    $(function() {
        $('input[name="daterange"]').daterangepicker({
            opens: 'left'
        }, function(start, end, label) {
        	getDatesStartToLast(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'));
            console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
        });
    });
    
    function getDatesStartToLast(startDate, lastDate) {
    	var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
    	if(!(regex.test(startDate) && regex.test(lastDate))) return "Not Date Format";
    	var result = [];
    	var curDate = new Date(startDate);
    	while(curDate <= new Date(lastDate)) {
    		result.push(curDate.toISOString().split("T")[0]);
    		curDate.setDate(curDate.getDate() + 1);
    	}
    	changeSelectItem(result);
    	return result;
    }
    
    function changeSelectItem(dateArr){
    	$('.form-select').children('option:not(:first)').remove();
    	for(var count = 0; count < dateArr.length; count++){      
            var option = "<option>"+dateArr[count]+"</option>";
            $('.form-select').append(option);
        } 
    }
	</script>
</body>
</html>