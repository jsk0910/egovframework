<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<title>로그인</title>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- css -->
<link rel="stylesheet" href="../../css/OAuth/main.css"/>
</head>
<body>
<div id="wrap" class="container">
	<div id="header" class="container">
	</div>
	<div id="body" class="container">
		<div class="row" style="float: none; margin: 100 auto;">
			<div class="col-lg-6 w-150" style="float: none; margin: 0 auto;">
				<br/>
				<div id="body-login-box" class="card w-100 text-center">
					<div class="card-body">
						<br/>
						<h2 class="card-title" id="login-box-title">소셜로그인</h2>
						<hr style="border: 0.2px solid grey; margin-left:4%;" width="90%" />
						<p class="card-text">이용약관 동의 후 소셜로그인을 이용하실 수 있습니다.</p>
						<button class="btn btn-outline-dark btn-sm">이용약관 확인하기</button>
						<div class="row row-cols-3" style="float:none; margin: 100 auto;">
							<div class="col-sm-3" style="float: none; margin: 0 auto;">
								<div class="form-check" id="login-form-checkbox">
									<input class="form-check-input" type="checkbox" value="checked" id="checkbox1" >
									<label class="form-check-label" for="checkbox1">약관 동의</label>
								</div>
							</div>
						</div>
						
						<div class="under-line">
							<div class="under-title">플랫폼 선택</div>
						</div>
						
						<div id="social-btn">
							<a class="sns-box kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=6353802339beb4e42b4ad87318fad4dc&redirect_uri=http://localhost:8080/oauth/kakaoRe.do&response_type=code">
								<img>
								<div>카카오톡 로그인</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer" class="container"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>

</body>
<script type="text/javascript">
	function snsLogin(e) {
		var checker = $('#checkbox1').is(':checked');
		if(checker) {
			var REST_API_KEY = "6353802339beb4e42b4ad87318fad4dc";
			var REDIRECT_URI = "http://localhost:8080/oauth/kakaoRe";
			var url = "kauth.kakao.com/oauth/authorize?client_id=6353802339beb4e42b4ad87318fad4dc&redirect_uri=http://localhost:8080/oauth/kakaoRe&response_type=code";
			
			location.href = url;
		} else {
			alert('약관에 동의해주세요');
		}
	}
</script>
</html>