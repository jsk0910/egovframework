<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>글 수정</title>

<style type="text/css">
a{
text-decoration:none;
}
a:link{
	color:black;
}
a:visited {
  color : black;
}
</style>
</head>
<body>
<div id="container" class="container">
	<div id="header">
		<h1><a href="/list.do">게시판 예제</a></h1>
		<hr/>
	</div>
	<div id="body" class="container-fluid">
		<div id="body-header" class="container text-center">
			<div class="row">
				<div class="col-sm-4">
					<button type="button" class="btn btn-outline-primary" onclick="location.href='/registerContext.do';">글 등록</button>
				</div>
				<div class="col-sm-8">
					<div class="row">
						<div class="col-sm-2">
							<select class="form-select" name="searchType" id="searchType">
								<option value="Title">제목</option>
								<option value="Content">본문</option>
								<option value="Name">작성자</option>
							</select>
						</div>
						<div class="col-sm-6">
							<input class="form-control" type="text" placeholder="검색" id="keyword" <%--value="${pagination.keyword}" --%>>
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-outline-primary" id="btn_search">검색 버튼</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br/>
		<div id="body-main" class="container text-center">
			<form id="update" action="update.do?ID=${result.ID }" method="post" encType="multiplart/form-data" class="was-validated" novalidate>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>제목</th>
							<td>
								<div class="input-group has-validation">
									<input id="title" type="text" placeholder="제목을 입력하세요" name="title" class="form-control" value="${result.title }" required/>
									<div class="invalid-feedback">입력해주세요</div>
									<div class="valid-feedback">done!</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input id="name" type="text" placeholder="이름(아이디)을 입력하세요" name="name" class="form-control" value="${result.name }" required/>
								<div class="invalid-feedback">입력해주세요</div>
								<div class="valid-feedback">done!</div>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea id="content" type="text" placeholder="내용을 입력하세요" name="content" class="form-control" style="height:200px;" required >${result.content }</textarea>
								<div class="invalid-feedback">입력해주세요</div>
								<div class="valid-feedback">done!</div>
							</td>
						</tr>
						<!-- 
						<tr>
							<th>파일 업로드</th>
							<td>
								<div class="input-group">
									<input id="fileName" type="file" class="form-control" name="fileName">
								</div>
						</tr> -->
						<tr>
							<td colspan="2">
							<button id="btn_register" type="button" class="btn btn_register btn-outline-success" data-bs-toggle="modal" data-bs-target="#submitModal">등록</button>
							<button id="btn_previous" type="button" class="btn btn_previous btn-outline-primary">이전</button>
							<div class="modal fade modal-centered" id="submitModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog modal-centered">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5">등록</h1>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<p>등록하시겠습니까?</p>
											<p>글은 수정, 삭제하실 수 있습니다.</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        									<button type="button" class="btn btn-primary" id="submitBtn" data-bs-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</body>

<script type="text/javascript">
	$("#btn_previous").click(function previous() {
		$(location).attr('href', 'list.do');
	});
	$('#submitBtn').click(function(e) {
		var title = $('#title').val();
		var name = $('#name').val();
		var content = $('#content').val();
		
		if(title == '') {
			alert("제목을 입력해주세요");
		}
		else if(name == '') {
			alert("이름을 입력해주세요");
		}
		else if(content == '') {
			alert("내용을 입력해주세요");
		} else {
			$('#update').submit();
			console.log('Done');
			alert('완료되었습니다!');
			//$(location).attr('href', 'list.do');
		}
	});
	
	// search
	$(document).on('click', '#btn_search', function(e) {
		e.preventDefault();
		
		var url="/list.do";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		//url = url + "&listSize=" + $('#listSize').val();
		
		location.href = url;
	})
	
</script>
</html>