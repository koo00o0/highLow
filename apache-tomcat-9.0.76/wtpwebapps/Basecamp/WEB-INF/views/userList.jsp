<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.basecamp.app.user.UserDTO" %>
<%
	ArrayList<UserDTO> list = (ArrayList<UserDTO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<meta charset="UTF-8" />
	<table>
		<tr>
			<td>아이디<td>
			<td>비밀번호<td>
			<td>생성시간<td>
		</tr>
		<% for (int i = 0 ; i < list.size(); i++){ 
			UserDTO temp = list.get(i);
		%>
			<tr>
				<td><%= temp.getUserId() %></td>
				<td><%= temp.getUserPw() %></td>
				<td><%= temp.getCreateDateTime() %></td>
			</tr>
		<% } %>
	</table>	
	
</head>
<body>
	
</body>
</html>