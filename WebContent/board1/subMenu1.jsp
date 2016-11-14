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
	<%-- 리스트 스타일없애기 --%>
	ul.nav1 {
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
</style>
</head>
<body>
	<ul class="nav1">
		<li class="group">
		<div class="title" align="center" ><B>커뮤니티</B></B></div>
		<ul class="sub1">
			<a href="/toto/board1/list.to?local=Notice"><li>공지사항</li></a>
			<a href="/toto/board1/list.to?local=free"><li>자유 게시판</li></a>
			<a href="/toto/board1/list.to?local=advice"><li>상담 게시판</li></a>
			<br />
			<a href="/toto/board1/mylist.to?local=free&gubun=indivi2"><li>자유 게시판 내 작성글</li></a>
			<a href="/toto/board1/mylist.to?local=advice&gubun=indivi"><li>상담 게시판 내 작성글</li></a>
		</ul>
		</li>
	</ul>



</body>
</html>