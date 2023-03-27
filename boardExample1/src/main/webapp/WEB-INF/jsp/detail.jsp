<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>게시판</title>

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
	<br/>
	<div id="body" class="container-fluid">
		<div id="body-header" class="container text-center">
			<div class="row">
				<div class="col-sm-4">
					<div class="row">
						<div class="col-sm-6">
							<button type="button" class="btn btn-outline-primary" onclick="location.href='/list.do';">목록</button>
						</div>
						<div class="col-sm-4">
							<button type="button" class="btn btn-outline-primary" onclick="location.href='/registerContext.do';">글 등록</button>
						</div>
					</div>
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
		<div id="body-main" class="container">
			<div id="context" class="card">
				<h4 class="card-title">${result.title}</h4>
				<h5 class="card-subtitle mb-2 text-muted">${result.date}</h5>
				<hr/>
				<p class="card-text">${result.content}</p>
				<!-- 
				<hr/>
				<c:if test="${result.fileName ne null }">
					<div id="download" class="row">
						<div class="col-sm-2">
							<p>다운로드</p>
						</div>
						<div class="col-sm-6">
							<a href="fileDownload.do?fileName=${result.fileName }">
								<input type="text" id="asd" value="${result.fileName }" name="fileName" class="form-control" readonly />
							</a>
						</div>
						<div class="col-sm-2">
							<button id="deleteFile" type="button" class="btn btn-outline-danger">파일 지우기</button>
						</div>
					</div>
				</c:if>
				 -->
			</div>
			<br/>
			<div id="context-footer">
				<div class="row justify-content-end">
					<div class="col-2">
						<button type="button" class="btn btn-outline-primary" id="btn_update" onclick="location.href='/updatePage.do?ID=${result.ID}'">수정</button>
					</div>
					<div class="col-2">
						<button type="button" class="btn btn-outline-danger" id="btn_delete">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
	$(document).on('click', '#btn_delete', function(e) {
		if(confirm("정말 삭제하시겠습니까?") == true) {
			$(location).attr('href', '/delete.do?ID=${result.ID}');
		} else {
			return ;
		}
	})
	
	// search
	$(document).on('click', '#btn_search', function(e) {
		e.preventDefault();
		
		var url="/list.do";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		//url = url + "&listSize=" + $('#listSize').val();
		
		location.href = url;
	})
	
	
	$('#deleteFile').click(function javascript_onclick() {
		$('#asd').val(null);
	})
</script>
</html>