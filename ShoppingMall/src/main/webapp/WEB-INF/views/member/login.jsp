<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/axicon/axicon.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style type="text/css">

/* Full-width inputs */
#member_userid, #member_password {
  width: 100%; 
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

/* Add a hover effect for buttons */
button:hover {
  opacity: 0.8;
}



/* Add padding to containers */
.container {
  padding: 16px;
}

/* The "Forgot password" text */
span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
    display: block;
    float: none;
  }
  .cancelbtn {
    width: 100%;
  }
}
</style>
<script type="text/javascript">
	$(function(){
		if($("#member_userid").val().trim().length>0){
			$("#member_password").focus();
		}else{
			$("#member_userid").focus();
		}
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<form action="${pageContext.request.contextPath }/UKshop/loginOk" method="post">
	  <div class="container" style="width: 500px; height: auto;">
	    <label for="uname"><b>ID</b></label>
	    <input type="text" id="member_userid" name="member_userid" value="${member_userid }" placeholder="Enter UserID" required>
	    <label for="psw"><b>Password</b></label>
	    <input type="password" id="member_password" name="member_password"  placeholder="Enter Password" required>
	    <button type="submit">Login</button>
	    <label>
	      <input type="checkbox" id="remember" name="remember" ${empty member_userid ? "''": "checked='checked'" }> 아이디 저장
	    </label>
	    <span class="psw">Forgot <a href="#">password?</a></span>
	  </div>
	</form>	
	
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/aos.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
	
</body>
</html>