<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	h1{
		width: 100%;
		text-align: center;
		font-weight: 800;
		margin : 30px;
	}
	.inputs{
		width: 100%;
		display: flex;
		justify-content: center;
		flex-wrap: wrap;
		align-items: center;
	}
	input{
		margin-bottom: 5px;
		width: 500px;
		outline: none;
		border: none;
		border-radius: 8px;
		height: 50px;
		padding-left: 10px;
	}
	.buttons{
		width: 100%;
		display: flex;
		justify-content: center;
	}
	.btn{
		width:130px;
		margin-bottom: 30px;
		margin-top: 20px;
	}
	.btn-dark{
		margin-right: 5px;
	}
</style>
</head>
<body>
<div class="all">
<h1>Member Join Page</h1>
<form action="/mem/register" method="post">
<div class="inputs">
<input type="text" name="id" placeholder="ID"> <br>
<input type="text" name="pwd" placeholder="PASSWORD"><br>
<input type="text" name="email" placeholder="E-MAIL"><br>
<input type="text" name="age" placeholder="AGE"><br>
</div>
<div class="buttons">
<button type="submit" class="btn btn-dark">join</button>
<a href="/index.jsp"><button type="button" class="btn btn-secondary">index</button></a>
</div>
</form>
</div>
</body>
</html>