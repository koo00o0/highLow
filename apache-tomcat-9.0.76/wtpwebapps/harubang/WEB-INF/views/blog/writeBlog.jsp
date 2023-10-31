<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<% 	
	String id =(String)request.getSession().getAttribute("id"); 
	String name =(String)request.getSession().getAttribute("name"); 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>하루방</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
	<link rel="stylesheet" href="../../../resources/ckeditor/contents.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<meta charset="UTF-8" />
	<script type="text/javascript" src="../../../resources/ckeditor/ckeditor.js"></script>
	    <style>
        .logo{
        	margin-top:20px;
            width:230px;
            height:100%;
        }
        .title{
            width:100%;
            height:100px;
        }
        .writer{
            position:absolute;
            top:170px;
            right:30px;
            width:300px;
            z-index: 9999;
            display : flex;
            gap : 10px;
            justify-content : flex-end;
        }
        .topClass{
        position: relative;
        }
        * {
		  margin: 0;
		  padding: 0;
		  box-sizing: border-box;
		}
		.topClass {
		  position: relative;
		  width: 100%;
		  margin-top: 45px;
		}
		input {
		  font-size: 15px;
		  color: #222222;
		  width: 100%;
		  border: none;
		  border-bottom: solid #aaaaaa 1px;
		  padding-bottom: 10px;
		  padding-left: 10px;
		  position: relative;
		  background: none;
		  z-index: 5;
		}
		input::placeholder { color: #aaaaaa; }
		input:focus { outline: none; }		
		span {
		  display: block;
		  position: absolute;
		  bottom: 0;
		  left: 0%;  /* right로만 바꿔주면 오 - 왼 */
		  background-color: #666;
		  width: 0;
		  height: 2px;
		  border-radius: 2px;
		  transition: 0.5s;
		}
		label {
		  position: absolute;
		  color: #aaa;
		  left: 10px;
		  font-size: 20px;
		  bottom: 8px;
		  transition: all .2s;
		}
		input:focus ~ label, input:valid ~ label {
		  font-size: 16px;
		  bottom: 40px;
		  color: #666;
		  font-weight: bold;
		}
		input:focus ~ span, input:valid ~ span {
		  width: 100%;
		}
		.insertBtn{
			position : absolute;
			top : 50px;
			right : 20px;
			z-index : 99999;
			width : 80px;
			color:#444;
			font-weight:bold;
			border : 2px solid #ddd;
			border-radius : 10px;
			cursor : pointer;
			transition : 0.4s;
			text-align : center;
			height : 40px;
			line-height : 40px;
			padding : 0!important;
		}
		.insertBtn:hover{
			background-color : #8bb6bc;
			color : white;
			font-weight : bold;
			border:none;
		}
		button {
    		margin: 20px;
        	right:30px;
        	position:absolute;
		}

		.w-btn {
		    border: none;
		    display: inline-block;
		    padding: 15px 30px;
		    border-radius: 15px;
		    font-family: "paybooc-Light", sans-serif;
	  	 	box-shadow: 0px -1px 5px 0px;
		    text-decoration: none;
		    font-weight: 600;
		    transition: 0.25s;
		    margin-top:55px;
		}
		
		.w-btn-outline {
		    position: relative;
		    padding: 15px 30px;
		    border-radius: 15px;
		    font-family: "paybooc-Light", sans-serif;
		    text-decoration: none;
		    font-weight: 600;
		    transition: 0.25s;
		}
		
		.w-btn-indigo {
		    background-color: aliceblue;
		    color: #1e6b7a;
		}
    </style>
	<script >
	
	const Toast = Swal.mixin({
	    toast: true,
	    position: 'center-center',
	    showConfirmButton: false,
	    timer: 1200,
	    timerProgressBar: true,
	    didOpen: (toast) => {
	        toast.addEventListener('mouseenter', Swal.stopTimer);
	        toast.addEventListener('mouseleave', Swal.resumeTimer);
	    },
	    didClose: () => {

	       setTimeout(() => {
	          $("#blogForm").submit();
	        }, 200);
	    }
	});

	function checkWrite(){
			if ($("#title").val()==""){
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return;
			}
			
			var a = CKEDITOR.instances.ckeditor.getData();
			$("#bcontent").val(a)
			   Toast.fire({
			       icon: 'success',
			       title: '블로그 작성 완료.',
			   });
	}
	
	
	$(function(){
		CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
	         width:'100%',
	         height:'400px',
	         uiColor: '#CCEAEE',
		      removeButtons: 'PasteFromWord',
	         filebrowserUploadUrl: "fileupload.do"
	    });
	})
	

	</script>
	

</head>
<body style='overflow-x:hidden'>
<img class="logo" src="${path}/resources/images/noticeimg/logo.png" alt="하루방">
<form action="/submitBlog" method="post" id="blogForm">
	<div class="topClass">
		<input id="title" name="title" type="text" required><label>제목</label><span></span>
	</div>
		<div class="writer">
			<div>Writer</div>
			<div><%=name%></div>
			<input type="hidden" value="<%=id%>" name="id">
		</div>
          <div class="mb-3">
          <textarea class="form-control blogContent" name="freeboard_content" id="ckeditor" rows="6"></textarea>
            <input type="hidden" value="" name="bcontent" id='bcontent'>
     	  </div>
		 <div style = "width:600px; text-align:right;">
    	<input type="button" id="ckeditor" class='insertBtn w-btn w-btn-indigo' name="ckeditor" value="발행" onclick="checkWrite()">
		</div>
</form>
   

</body>
</html>