<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style type="text/css">
	.all{
		width: 1000px;
		height: 800px;
		
		position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);	
		
		display: flex;
        justify-content: space-evenly;
		flex-wrap: wrap;
		align-items: center;
	}
	h1{
		font-weight: 800;
		text-align: center;
		margin-bottom: 20px; 
		margin-top: 20px;
	}
	
	.search{
		width : 100%;
		height: 50px;
		margin-top: 10px;
	}
	.choose{
		height: 40px;
		margin-left: 110px;
		border: none;
		background-color: rgb(227, 233, 233);
		border-radius: 8px;
		padding-left:10px;
	}
	.searchBox{
		width:500px;
		height: 40px;
		padding-left: 15px;
		outline: none;
		border: none;
		background-color: rgb(227, 233, 233);
		border-radius: 8px;
	}
	.sBtn{
		height: 40px;
		margin-bottom: 5px;
	}
	
	
	.table{
		width : 80%;
	}
	
	a, .page-link{
		color: black;
		text-decoration: none;
	}
	
	.buttons{
		width: 100%;
		display: flex;
		justify-content: flex-end;
		margin-right: 110px;
		
	}
	.btn1{
		margin-right: 10px; 
	}

</style>
</head>
<body>
<div class="all">
<h1>Board List</h1>

<!-- 검색 구역 -->
<div class="search"> 
<form action="/brd/pageList" method="get">
	<c:set value="${ph.pgvo.type }" var="typed"></c:set>
	<!-- type의 값을 typed라는 변수에 넣어줌 -->
	<!-- 1 -->
	<select name="type" class="choose">
		<option ${typed == null? 'selected' : '' }>Choose</option>
		<option value="t" ${typed eq 't'? 'selected' : '' }>title</option>
		<option value="w" ${typed eq 'w'? 'selected' : '' }>writer</option>
		<option value="c" ${typed eq 'c'? 'selected' : '' }>content</option>
		<option value="tw" ${typed eq 'tw'? 'selected' : '' }>title+writer</option>
		<option value="tc" ${typed eq 'tc'? 'selected' : '' }>title+content</option>
		<option value="wc" ${typed eq 'wc'? 'selected' : '' }>writer+content</option>
		<option value="twc" ${typed eq 'twc'? 'selected' : '' }>title+writer+content</option>
	</select>
	<!-- 2 -->
	<input type="text" name="keyword" value="${ph.pgvo.keyword }" placeholder="Search" class="searchBox">
	<!-- 검색 후 페이징을 하기 위해서 보내는 값 -->
	<input type="hidden" name="pageNo" value="${ph.pgvo.pageNo }">
	<input type="hidden" name="qty" value="${ph.pgvo.qty }">
	<!-- 3 -->
	<button type="submit" class="btn btn-secondary sBtn">search</button>
</form>
</div>

<!-- 리스트 -->
<table class="table">
	<tr>
		<th>BNO</th>
		<th>TITLE</th>
		<th>WRITER</th>
		<th>REG_DATE</th>
		<th>READ</th>
	</tr>
	<!-- DB의 전체 리스트 반복 -->
	<c:forEach items="${list }" var="bvo">
		<tr>
			<td><a href="/brd/detail?bno=${bvo.bno }">${bvo.bno }</a></td>
			<td>
				<c:if test="${bvo.image_File ne '' && bvo.image_File ne null }">
					<img src="/_fileUpload/_th_${bvo.image_File }">	
				</c:if>
				<a href="/brd/detail?bno=${bvo.bno }">${bvo.title }</a>
			</td>
			<td>${bvo.writer }</td>
			<td>${bvo.regdate }</td>
			<td>${bvo.readcount }</td>
		</tr>
	</c:forEach>
</table>

<!-- 페이징 구역 -->
<nav aria-label="Page navigation example">
  <ul class="pagination">
	<!-- prev -->
  	<li class="page-item">
		<c:if test="${ph.prev }">
			<a href="/brd/pageList?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" class="page-link" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
			</a>
		</c:if>
	</li>
	
	<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
		<li class="page-item">
			<!-- 페이지 번호를 i라는 변수에 담아서 사용 -->
			<a href="/brd/pageList?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" class="page-link">${i }</a>
		</li>
	</c:forEach>

	<!-- next -->
	<li class="page-item">
		<c:if test="${ph.next }">
			<a href="/brd/pageList?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" class="page-link" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
			</a>
		</c:if>
	 </li>
  </ul>
</nav>

<div class="buttons">
<a href="/index.jsp"><button type="button" class="btn btn-secondary btn1">index</button></a>
<c:if test="${ses.id ne null }">
<a href="/brd/register"><button type="button" class="btn btn-dark">register</button></a> 
</c:if>
</div>

</div>
</body>
</html>