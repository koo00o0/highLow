<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% 	
	String id=(String)request.getSession().getAttribute("id"); 
%>
<title>하루방</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
	<link href="${path}/resources/css/reset.css" rel="stylesheet"/>
	<link href="${path}/resources/css/subtop.css" rel="stylesheet"/>
</head>
<body>
	<div class="top">
        <div class="logoWrap">
            <h1><a href="#"><img class="logo" src="/resources/images/logo/logo.png" alt="logo"></a></h1>
        </div>

        <div class="buttonWrap">
            <div class="userIdWrap"><%=id %> ▼</div>
            <input class="saveInput" type="button" value="저장" onclick="saveAllSchedule('<%=id %>')">
            <input class="cancleInput" type="button" value="닫기" onclick="location.href='/schedule/schedule'">
        </div>
    </div>
</body>
</html>