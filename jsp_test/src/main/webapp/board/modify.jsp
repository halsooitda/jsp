<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style type="text/css">
	.all{
		width: 800px;
		
		position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);	
	
		display: flex;
        justify-content: center;
		flex-wrap: wrap;
		align-items: center;
		
		background-color: rgb(227, 233, 233);
		border-radius: 5px;
	}
	.table{
		width : 80%;
		margin-top: 50px;
	}
	input, textarea{
		outline: none;
		border: none;
	}
	.buttons{
		width: 100%;
		display: flex;
		justify-content: center;
		margin: 10px 0 30px 0;
	}
	.btn{
		width: 150px;
	}
	.btn-dark{
		margin-right: 5px;
	}
	
</style>
</head>
<body>
<div class="all">
<form action="/brd/edit" method="post" enctype="multipart/form-data">
<table class="table">
	<tr>
		<th>BNO</th>
		<td><input type="text" value="${bvo.bno }" name="bno" readonly="readonly"></td>
	</tr>
	<tr>
		<th>TITLE</th>
		<td><input type="text" value="${bvo.title }" name="title"></td>
	</tr>
	<tr>
		<th>WRITER</th>
		<td>${bvo.writer }</td>
	</tr>
	<tr>
		<th>CONTENT</th>
		<td><textarea rows="3" cols="30" name="content">${bvo.content }</textarea></td>
	</tr>
	<tr>
		<th>IMAGE</th>
		<td>
			<c:if test="${bvo.image_File ne '' && bvo.image_File ne null }">
					<img src="/_fileUpload/${bvo.image_File }">	
			</c:if>
			<input type="hidden" name="image_file" value="${bvo.image_File }">
			<input type="file" name="new_file">
		</td>
	</tr>
	<tr>
		<th>REG_DATE</th>
		<td>${bvo.regdate }</td>
	</tr>
	<!-- 수정했을 때만 수정날짜 표시 -->
	<tr>
		<th>MOD_DATE</th>
		<td>${bvo.moddate }</td>
	</tr>
	<tr>
		<th>READ</th>
		<td>${bvo.readcount }</td>
	</tr>
</table>
<div class="buttons">
<button type="submit" class="btn btn-dark">modify</button>
<a href="/brd/pageList"><button type="button" class="btn btn-secondary">list</button></a>
</div>
</form>
</div>
</body>
</html>