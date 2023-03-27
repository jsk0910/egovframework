<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
a:hover{
	color:blue;
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
			<table class="table table-hover">
				<colgroup>
					<col width="20%" />
					<col width="50%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일자</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.ID}</td>
							<td><a href="detail.do?ID=${list.ID}">${list.title}</a></td>
							<td>${list.name}</td>
							<td>${list.date}</td>
						</tr>
					</c:forEach> 
				</tbody>
			</table>
		</div>
		<hr/>
		<div id="body-footer" class="container">
			<!-- pagination start -->
			<div id="pagination" class="justify-content-center" >
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<c:if test="${pagination.prev }">
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Previous" onClick="fn_prev('${pagination.page}', '${pagination.range }', '${pagination.rangeSize }', '${pagination.listSize }', '${search.searchType }', '${search.keyword }')">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
						<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="ID">
							<li class="page-item" <c:out value="${pagination.page == ID ? 'active' : '' }" />>
								<a class="page-link" href="#" onClick="fn_pagination('${pagination.page}', '${pagination.range }', '${pagination.rangeSize }', '${pagination.listSize }', '${search.searchType }', '${search.keyword }')">
									${ID }
								</a>
							</li>
						</c:forEach>
						<c:if test="${pagination.next }">
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Next" onClick="fn_next('${pagination.page}', '${pagination.range }', '${pagination.rangeSize }', '${pagination.listSize }', '${search.searchType }', '${search.keyword }')">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
			<!-- pagination end -->
			<!-- page list Count start -->
			<div class="form-group row justify-content-center">
				<div class="col col-sm-2">
					<p>게시판 목록 개수</p>
				</div>
				<div class="col col-sm-8">
					<select class="form-select form-select-sm">
						<option value="10" <c:if test="${pagination.getListSize() == 10 }"> selected="selected" </c:if>>10</option>
						<option value="15" <c:if test="${pagination.getListSize() == 15 }"> selected="selected" </c:if>>15</option>
						<option value="20" <c:if test="${pagination.getListSize() == 20 }"> selected="selected" </c:if>>20</option>
					</select>
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

	//paging
	function page(ID) {
		var startPage = ID;
		var listSize = $("#listSize option:selected").val();
		
		if(listSize == 10) {
			var url = "/list.do?startPage=" + startPage + "&listSize=" + listSize;
		} else if(listSize == 15) {
			var url = "/list.do?startPage=" + startPage + "&listSize=" + listSize;
		} else if(listSize == 20) {
			var url = "/list.do?startPage=" + startPage + "&listSize=" + listSize;
		}
		
		location.href = url;
	}
	
	function fn_prev(page, range, rangeSize, listSize, searchType, keyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var url="/list.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		
		location.href = url;
	}
	
	function fn_next(page, range, rangeSize, listSize, searchType, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		
		var url="/list.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		
		location.href = url;
	}
	
	function fn_pagination(page, range, rangeSize, listSize, searchType, keyword) {
		var url="/list.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		
		location.href = url;
	}
	
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