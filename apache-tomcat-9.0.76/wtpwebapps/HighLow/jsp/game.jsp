<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
alert("123123");
function gameButton() {
	alert("111111111111");
	if($("#gameNum").val()==""){
		alert("���ڸ� �Է����ּ���");
		$("#gameNum").focus();
		return;
	}$.ajax({
		dataType : "text",
		type : "POST",
		url : "/game",
		data : {
			"game" : $("#gameNum").val(),
			"gameCount" : $("#gameCount").val(), 
			"cmd" : "nomalGame",
		},success : function(result) {
			result =result.split("^");
			
		}	
	})
	
}
</script>
<body>

<label>���� �Է� : <input type="text" name= "game" id="gameNum" placeholder="���ڸ� �Է����ּ���."></label><br>
<input type="button"  id="game" value="gogo" onclick="gameButton()">
<input type="hidden" id="gameCount" value="">

</body>
</html>