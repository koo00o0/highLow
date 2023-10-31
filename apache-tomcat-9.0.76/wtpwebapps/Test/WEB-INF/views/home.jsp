<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<form action ="/login" method="POST">
		ID : <input type="text" name="userId"> <br />
		PW : <input type="password" name="userpw"> <br />
		<input type="submit" value="로그인">
	</form>
	
	<a href="/joinPage"> 회원가입</a>
</body>
</html>
