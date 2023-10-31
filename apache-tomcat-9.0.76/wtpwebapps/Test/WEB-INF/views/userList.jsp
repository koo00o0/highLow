<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.test.myapp.user.UserDTO" %>
<% ArrayList<UserDTO> list = (ArrayList<UserDTO>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<% 
	for (int i = 0 ; i < list.size(); i++){  
		UserDTO dto = list.get(i);
	%>
		<div> ${list.dto.userid}</div>  //이렇게하면안됨
		<div> <%= dto.getUserpw() %></div> //이렇게해야함
		<hr />
	<%} %>
</body>
</html>