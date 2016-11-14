<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<style type="text/css">
	<%-- 바디안에 마진 20px띄우고 나머지 자동으로 설정 / 가로200px, 폰트사이즈 15px--%>

	<%-- 리스트 스타일없애기 --%>
	ul.nav1 {
		list-style:none;
		margin:0;
		padding:0;
	}
	
	
	
	ul.sub1 li:hover{
		background:white;
	}
	ul.nav1{
		position: absolute;
		top: 250px;
		left: 5px;
	}
	
	#g1{
		position: absolute;
		top:100px;
		left : 20%;
		
	}
	
	
</style>
</head>
<body>
	<div class="nav1" id="g1" style="width: 1000px;">
		<div align="center">
	<form method="post" action="/toto/deposit/mydeposit.to">

	<select name="datebar">
		<c:if test="${datebar!=null}">
		<option value="${datebar}">${datebar}일</option>
		</c:if>
		<option value="7">7일</option>		
		<option value="15">15일</option>
		<option value="30">1 달</option>
		<option value="90">3 달</option>
	</select>

 		<input type="submit" value="확 인" >
 		
  </form>
		</div>
	</div>
<br />
<br />
</body>
</html>
