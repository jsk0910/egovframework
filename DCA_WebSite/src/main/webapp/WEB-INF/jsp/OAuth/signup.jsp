<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<title>회원가입</title>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- css -->
<link rel="stylesheet" href="../../css/OAuth/signup.css"/>
</head>
<body>
<div id="wrap" class="container">
	<div id="header" class="container"></div>
	<div id="body" class="container">
		<!-- 회원가입 카드 시작 -->
		<div class="row" style="float: none; margin: 100 auto;">
			<div class="col-lg-8 w-150" style="float: none; margin: 0 auto;">
				<div id="signup-body" class="card w-100 text-center">
					<div class="card-body">
						<h4 id="signup-title" class="card-title">회원가입</h4>
						<hr/>
						<c:forEach items="${list }" var="list">
							<!-- 회원가입 폼 -->
							<form id="signupForm" action="signupf.do" method="post" class="was-validated" novalidate>
								<!-- 아이디 -->
								<div class="row cols-2 justify-content-center" id="signupFormInput">
									<div class="col-md-7">
										<div class="input-group has-validation">
											<c:if test="${list.userid  ne null}">
												<input id="userid" name="userid" type="text" value="${list.userid }" class="form-control" placeholder="아이디를 입력하세요" required />
											</c:if>
											<c:if test="${list.userid  eq null}">
												<input id="userid" name="userid" type="text" value="" class="form-control" placeholder="아이디를 입력하세요" required />
											</c:if>
											<div class="invalid-feedback">알파벳 대소문자와 숫자 6자리 이상으로 만들어주세요</div>
										</div>
									</div>
									<!-- 중복 확인 버튼 -->
									<div class="col-md-3">
										<button class="btn btn-primary" id="btn_idcheck" type="button">중복 확인</button>
									</div>
								</div>
								<!-- 비밀번호 -->
								<div class="row cols-2 justify-content-center" id="signupFormInput">
									<div class="col-md-7">
										<div class="input-group has-validation">
											<input id="userpw" name="userpw" type="password" value="" class="form-control userpw" placeholder="비밀번호" required />
											<div class="invalid-feedback">8자리 이상 입력하세요</div>
										</div>
									</div>
									<div class="col-md-3"></div>
								</div>
								<!-- 비밀번호 재확인 -->
								<div class="row cols-2 justify-content-center" id="signupFormInput">
									<div class="col-md-7">
										<div class="input-group has-validation">
											<input id="userpwre" name="userpwre" type="password" value="" class="form-control userpw" placeholder="비밀번호 재확인" required />
										</div>
									</div>
									<div class="col-md-3">
										<div class="pw-check"></div>
									</div>
								</div>
								<!-- 인적사항 시작 -->
								<!-- 이름 -->
								<div class="row cols-2 justify-content-center" id="signupFormInput">
									<div class="col-md-7">
										<div class="input-group has-validation">
											<input id="username" name="username" type="text" value="${list.name }" class="form-control" placeholder="이름" required />
										</div>
									</div>
									<div class="col-md-3">
										<!-- <div class="pw-check"></div> -->
									</div>
								</div>
								<!-- 이메일(lock) -->
								<div class="row cols-2 justify-content-center" id="signupFormInput">
									<div class="col-md-7">
										<div class="input-group has-validation">
											<input id="useremail" name="useremail" type="text" value="${list.email }" class="form-control" placeholder="이메일" readonly />
										</div>
									</div>
									<div class="col-md-3">
										<!-- <div class="pw-check"></div> -->
									</div>
								</div>
								<!-- 전화번호 -->
								<div class="row cols-2 justify-content-center" id="signupFormInput">
									<div class="col-md-7">
										<div class="input-group has-validation">
											<input id="userphone" name="userphone" type="text" value="" class="form-control" placeholder="전화번호" required />
										</div>
									</div>
									<div class="col-md-3">
										<!-- <div class="pw-check"></div> -->
									</div>
								</div>
								<!-- 학번 -->
								<div class="row cols-2 justify-content-center" id="signupFormInput">
									<div class="col-md-7">
										<div class="input-group has-validation">
											<input id="usercodeNumber" name="usercodeNumber" type="text" value="" class="form-control" placeholder="학번" required />
										</div>
									</div>
									<div class="col-md-3">
										<!-- <div class="pw-check"></div> -->
									</div>
								</div>
								<!-- 인적사항 끝 -->
								<!-- 확인 버튼 -->
								<div>
									<button class="btn btn-primary" type="button" id="btn_submit">완료</button>
								</div>
							</form>
							<!-- 회원가입 폼 끝 -->
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!-- 회원가입 카드 끝 -->
	</div>
	<div id="footer" class="container"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>

</body>
<script type="text/javascript">
	var idCheck = false;
	var pwCheck = false; 
	// 아이디 중복 확인 함수
	$('#btn_idcheck').click(function(e) {
		var id = $('#userid').val();
		var regId = /^[a-zA-Z0-9]+$/;
		
		// 아이디 규칙 체크
		if(id == null || id == '') {
			alert('아이디를 입력해주세요');
			idCheck = false;
			return false;
		} else if(id.length < 8) {
			alert('아이디를 확인해주세요(8자리 이상이어야 합니다.)');
			idCheck = false;
			return false;
		} 
		if(id.search(/^[a-zA-Z0-9]+$/)) {
			alert('아이디를 확인해주세요(알파벳 대소문자와 숫자로만 구성되어야 합니다.)');
			idCheck = false;
			return false;
		}
		
		$.ajax({
			type: "post",
			url: "<c:url value='/oauth/signup/idcheck.do' />",
			data: {"userid" : id},
			async: false,
			success: function(data) {
				var cnt = parseInt(data);
				
				if(cnt > 0) {
					alert("사용 불가능한 아이디입니다.");
					idCheck = false;
				} else {
					alert("사용 가능한 아이디입니다.");
					idCheck = true;
				}
			}
		})
		
	});
	
	// 비밀번호 체크
	$('.userpw').focusout(function() {
		var pw1 = $("#userpw").val();
		var pw2 = $("#userpwre").val();
		
		if(pw1 != "" || pw2 != "") {
			if(pw1 == pw2) {
				$(".pw-check").html("일치");
				$(".pw-check").attr('color', 'green');
				pwCheck = true;
			} else {
				$(".pw-check").html("일치하지 않습니다.");
				pwCheck = false;
			}
		}
	});
	
	// 전송 버튼
	$("#btn_submit").click(function(e) {
		if(pwCheck == true && idCheck == true) {
			var userid = $("#userid").val();
			var userpw = $("#userpw").val();
			var username = $("#username").val();
			var useremail = $("#useremail").val();
			var userphone = $("#userphone").val();
			var usercodenumber = $("#usercodeNumber").val();
			
			console.log(useremail);
			if(username == null) {
				alert("이름을 입력해주세요");
				return false;
			}
			if(useremail == null) {
				alert("이메일을 입력해주세요");
				return false;
			}
			if(userphone == null) {
				alert("전화번호를 입력해주세요");
				return false;
			}
			if(usercodenumber == null) {
				alert("학번을 입력해주세요");
				return false;
			}
			
			if(userpw.search(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/)) {
				alert("비밀번호 형식이 틀렸습니다.");
				return false;
			}
			
			var data = [userid, userpw, username, useremail, userphone, usercodenumber];
			console.log(data);
			$("#signupForm").submit();
			
		}
		
		if(pwCheck == false) {
			alert("비밀번호를 확인해주세요");
		}
		if(idCheck == false) {
			alert("아이디 중복 확인이 필요합니다.");
		}
	});
</script>
</html>