<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/top/top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<style type="text/css">
	<%-- 바디안에 마진 20px띄우고 나머지 자동으로 설정 / 가로200px, 폰트사이즈 15px--%>
	body{		
		font-size:15px;
	}
	<%--라인들여쓰기 --%> 
	
	ul.nav1 {
		width:200px;
	}
	ul.nav2 {
		width:200px;
	}
	ul.nav3 {
		width:200px;
	}
	<%-- 리스트 스타일없애기 --%>
	ul.nav1 {
		list-style:none;
		margin:0;
		padding:0;
	}
	ul.nav2 {
		list-style:none;
		margin:0;
		padding:0;
	}
	ul.nav3 {
		list-style:none;
		margin:0;
		padding:0;
	}
	div.title{
		color: red;
		background:#3e3f3a;
		cursor:pointer;
	}
	
	ul.sub1 li:hover{
		background:black;
	}
	ul.nav1{
		position: absolute;
		top: 250px;
		left: 5px;
	}
	ul.nav2{
		position: absolute;
		top: 350px;
		left: 5px;
	}
	ul.nav3{
		position: absolute;
		top: 450px;
		left: 5px;
	}
</style>
</head>
<body>
	<ul class="nav1">
		<li class="group">
		<div class="title" align="center" ><B>축구</B></B></div>
		<ul class="sub1">
			<a href="/toto/game/gameListMonth.to?league=K리그&team=전체"><li>경기 일정</a>
			<a href="/toto/game/gameMatchPro.to?league=K리그&home=전북&away=수원&flag=경기종료"><li>맞대결 전적</li></a>
			<a href="/toto/teaminfomation/teaminformation.to?league=K리그"><li>팀정보</li></a>
		</ul>
		</li>
	</ul>
	<ul class="nav2">
		<li class="group">
		<div class="title" align="center" ><B>야구</B></B></div>
		<ul class="sub1">
			<a href="/toto/game/gameListMonth.to?league=KBO&team=전체"><li>경기 일정</a>
			<a href="/toto/game/gameMatchPro.to?league=KBO&home=한화&away=롯데&flag=경기종료"><li>맞대결 전적</li></a>
			<a href="/toto/teaminfomation/teaminformationbaseball.to?league=KBO"><li>팀정보</li></a>
		</ul>
		</li>
	</ul>
	<ul class="nav3">
		<li class="group">
		<div class="title" align="center" ><B>농구</B></B></div>
		<ul class="sub1">
			<a href="/toto/game/gameListMonth.to?league=KBL&team=전체"><li>경기 일정</a>
			<a href="/toto/game/gameMatchPro.to?league=KBL&home=울산모비스&away=고양오리온스&flag=경기종료"><li>맞대결 전적</li></a>
			<a href="/toto/teaminfomation/teaminformationbasketball.to?league=KBL"><li>팀정보</li></a>
		</ul>
		</li>
	</ul>
</body>
</html>