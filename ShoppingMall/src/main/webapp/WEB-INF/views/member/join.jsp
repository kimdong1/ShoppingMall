<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<!-- MATERIAL DESIGN ICONIC FONT -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/joinfonts/material-design-iconic-font/css/material-design-iconic-font.css">
	<!-- STYLE CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/joincss/style.css?ver=32">
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/comm.js"></script>
	
	<script type="text/javascript">
		
		function formCheck(){
			var data = $("#userid").val();
			if(!validateEmail(data)){
				alert('이메일 형식이 올바르지 않습니다.');
				$("#userid").val("");
				$("#userid").focus();
				return false;
			}
			
			var data = $("#password").val();
			if(!validatePassword(data)){
				alert('비밀번호 형식이 올바르지 않습니다.\n특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호여야 합니다.');
				$("#password").val("");
				$("#password2").val("");
				$("#password").focus();
				return false;
			}
			
			var data = $("#password2").val();
			if(!validatePassword(data)){
				alert('비밀번호 형식이 올바르지 않습니다.\n특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호여야 합니다.');
				$("#password2").val("");
				$("#password2").focus();
				return false;
			}
			
			var password = $("#password").val();
			var password2 = $("#password2").val();
			if(password != password2){
				alert('비밀번호를 확인해주세요.');
				$("#password").val("");
				$("#password2").val("");
				$("#password").focus();
				return false;
			} 
			
			var data = $("#name").val();
			if(!validateName(data)){
				alert('이름이 올바르지않습니다.');
				$("#name").val("");
				$("#name").focus();
				return false;
			}
			
			var data = $("#phone").val();
			if(!validatePhone(data)){
				alert('전화번호 형식이 올바르지않습니다.');
				$("#phone").val("");
				$("#phone").focus();
				return false;
			}
			var data = $("#zipcode").val();
			if(!data){
				alert('우편번호를 입력하세요');
				$("#zipcode").focus();
				return false;
			}
			var data = $("#addr1").val();
			if(!data){
				alert('주소를 입력하세요');
				$("#addr1").focus();
				return false;
			}
			var data = $("#addr2").val().trim();
			if(!data){
				alert('상세주소를 입력하세요');
				$("#addr2").focus();
				return false;
			}
			alert('회원가입을 축하드립니다.');
			return true;
		}
		
		function idCheck(){
			var id = $("#userid").val();
			if(id.trim().length>5){
				$.ajax("${pageContext.request.contextPath}/idCheck", {
					type: "GET",
				    dataType: "json",
				    data: {"member_userid":id},
				    success: function(data){
				    	if(data==1){
				    		$("#idCheck").css("color", 'red').html("사용할수 없는 아이디 입니다.");
				    	}else{
				    		$("#idCheck").css("color", 'blue').html("사용가능한 아이디 입니다.");
				    	}
				    },
			    	error: function (){
			    		alert('error');
				    }
			  	});
			}
		}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode;
	                document.getElementById("addr1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addr2").focus();
	            }
	        }).open();
	    }
	</script>
</head>
<body>
<button type="button" class="backBtn" onclick="history.back()"> 돌아가기</button>
	<div class="wrapper">
   		 <form action="${pageContext.request.contextPath }/UKshop/joinOk" id="wizard" method="post" onsubmit="return formCheck();">
        		<!-- SECTION 1 -->
                <h2></h2>
                <section>
                    <div class="inner">
						<div class="image-holder">
							<img src="${pageContext.request.contextPath }/resources/joinimages/form-wizard-1.jpg" alt="">
						</div>
						<div class="form-content" >
							<div class="form-header">
								<h3>Registration</h3>
							</div>
							<p>Please fill with your details</p>
							<div class="form-row">
								<div class="form-holder w-100">
									<input type="text" id="userid" name="member_userid" placeholder="Your Email" class="form-control" onkeyup="idCheck()">
									<span id="idCheck"></span>
								</div>
							</div>
							<div class="form-row">
								<div class="form-holder">
									<input type="password" placeholder="Password" class="form-control" id="password" name="member_password">
								</div>
								<div class="form-holder">
									<input type="password" placeholder="Confirm Password" class="form-control" id="password2">
								</div>
							</div>
							<div class="form-row">
								<div class="form-holder">
									<input type="text" placeholder="Name" class="form-control" id="name" name="member_name">
								</div>
								<div class="form-holder">
									<input type="text" placeholder="Phone Number" class="form-control" id="phone" name="member_phone">
								</div>
							</div>
						</div>
					</div>
                </section>

				<!-- SECTION 2 -->
                <h2></h2>
                <section>
                    <div class="inner">
						<div class="image-holder">
							<img src="${pageContext.request.contextPath }/resources/joinimages/form-wizard-2.jpg" alt="">
						</div>
						<div class="form-content">
							<div class="form-header">
								<h3>Registration</h3>
							</div>
							<p>Please fill with additional info</p>
							<div class="form-row">
								<div class="form-holder">
									<input type="text" id="zipcode" onclick="sample6_execDaumPostcode()" name="member_zipcode" placeholder="우편번호" class="form-control" readonly="readonly">
								</div>
								<div class="form-holder">
									<input type="text" id="addr1" onclick="sample6_execDaumPostcode()" name="member_addr1" placeholder="주소" class="form-control" readonly="readonly">
								</div>
							</div>
							<div class="form-row">
								<div class="form-holder w-100">
									<input type="text" id="addr2" name="member_addr2" placeholder="상세주소" class="form-control">
								</div>
							</div>
						</div>
					</div>
                </section>
            </form>
		</div>
		
		<!-- JQUERY -->
		<script src="${pageContext.request.contextPath }/resources/joinjs/jquery-3.3.1.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

		<!-- JQUERY STEP -->
		<script src="${pageContext.request.contextPath }/resources/joinjs/jquery.steps.js"></script>
		<script src="${pageContext.request.contextPath }/resources/joinjs/main.js"></script>
		<!-- Template created and distributed by Colorlib -->
</body>
</html>