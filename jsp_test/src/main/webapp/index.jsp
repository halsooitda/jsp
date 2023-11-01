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
<!-- alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.27/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.27/dist/sweetalert2.min.css" rel="stylesheet">
<style type="text/css">
	@font-face {
	    font-family: 'OTWelcomeRA';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	@font-face {
    font-family: 'KIMM_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
	}
	@font-face {
    font-family: 'GangwonEduPowerExtraBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduPowerExtraBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	body{

	}
	
	.loginBox{
		position: absolute;
	    top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
            
        width:400px;   
        height:300px;
		border-radius: 5px;
        background-color: rgb(227, 233, 233);
            
        display: flex;
        justify-content: space-evenly;
		flex-wrap: wrap;
		align-items: center;
	}
	h1{
		font-weight: 700;
		margin-top: 15px;
	}
	.box{
		margin-left : 25px;
		padding-left: 10px;
		width : 300px;
		height: 40px;
		outline: none;
		border: none;
		border-radius: 5px;
	}
	.bt{
		width : 300px;
		height: 40px;
		border: none;
		border-radius: 5px;
		color: white;
	}
	.bt2{
		margin-bottom: 20px;
	}
/*----------------------------------------------------------  */
	.afterLogin{
		position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
        
        text-align:center;
        background-color: rgb(227, 233, 233);
        border-radius: 5px;
        width : 500px;
        height: 300px;
	}
	.text{
		margin-top: 50px;
	}
	.buttons1{
		margin-bottom: 10px;
	}
</style>
</head>
<body>

<!-- 로그인 -->
<!-- 로그아웃 상태일 때만 열어주기 -->
<c:if test="${ses.id eq null }">
<form action="/mem/login" method="post">
<div class="loginBox">
<h1>Index Page</h1>
<input type="text" name="id" placeholder="ID" class="box">  <br>
<input type="text" name="pwd" placeholder="PASSWORD" class="box"> <br>

<button type="submit"  class="btn btn-secondary bt bt1">로그인</button> 
<a href="/mem/join"><button type="button"  class="btn btn-secondary bt bt2">회원가입</button></a>

</div>
</form>
</c:if>


<!-- 로그인 되면 열어주기 -->
<c:if test="${ses.id ne null }">
<div class="afterLogin">
<div class="text">
	<b>${ses.id }</b>님 로그인하였습니다. <br> 
	계정 생성일 : ${ses.regdate } <br>
	마지막 접속 : ${ses.lastlogin } 
</div><br>
<div class="buttons1">
<a href="/brd/register"><button type="button" class="btn btn-secondary">게시판 글쓰기</button></a>
<a href="/brd/pageList"><button type="button" class="btn btn-secondary">게시판 목록</button></a>
<a href="/brd/myList"><button type="button" class="btn btn-secondary">내가 쓴 글 보기</button></a>
</div>
<div class="buttons2">
<a href="/mem/modify"><button type="button" class="btn btn-secondary">회원정보수정</button></a>
<c:if test="${ses.id eq 'kang' }">
<a href="/mem/list"><button type="button" class="btn btn-secondary">회원리스트보기</button></a>
</c:if>
<a href="/mem/logout"><button type="button" class="btn btn-dark">로그아웃</button></a>
</div>
</div>
</c:if>


<script type="text/javascript">
	const msg_login = `<c:out value="${msg_login}" />`;
	if(msg_login === '0'){
		/* alert("로그인 정보가 일치하지 않습니다."); */
		swal.fire('로그인 정보가 일치하지 않습니다.','', 'error');
	}
</script>



</body>
</html>