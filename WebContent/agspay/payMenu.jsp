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
		top: 300px;
		left: 5px;
	}
</style>
</head>
<body>
	<ul class="nav1">
		<li class="group">
		<div class="title" align="center" ><B>예치금</B></B></div>
		<ul class="sub1">
			<a href="/toto/deposit/mydeposit.to?datebar=7"><li>예치금 입금내역</li></a>
			<a href="/toto/deposit/mywithdrawal.to?datebar=7"><li>예치금 출금내역</li></a>
			<a href="/toto/agspay/AGS_pay.to"><li>예치금 충전</li></a>
			<a href="/toto/member/payCancel.to"><li>예치금 출금</li></a>
		</ul>
		</li>
	</ul>



</body>
</html>