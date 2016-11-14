<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style>
#gameListForm
</style>
<head>
<title>게임일정확인</title>
</head>
<body>
<div id="buygameListForm">
<form name="checkstat" method="post" action="/toto/buygame/gameListMonth.to">
	<select name="game" onchange="">
		<c:if test="${selg.game != null}">
		<option value="${selg.game}">${selg.game}</option>
		</c:if>
		<option value="프로토">프로토</option>
		<option value="토토">토토</option>	
		<option value="전체">전체</option>
	</select>&nbsp;&nbsp;
	기간선택
	<select name="yy" onchange="">
		<c:if test="${selg.yy != null}">
		<option value="${selg.yy}">${selg.yy}년</option>
		</c:if>
		<option value="2015">2015년</option>
		<option value="2014">2014년</option>
	</select>&nbsp;&nbsp;
	<select name="mm" onchange="">
		<c:if test="${selg.mm != null}">
			<c:if test="${selg.mm == '전체'}">
			<option value="전체">전체</option>
			</c:if>
			<c:if test="${selg.mm != '전체'}">
			<option value="${selg.mm}">${selg.mm}월</option>
			</c:if>
		</c:if>
		<option value="01">01월</option>
		<option value="02">02월</option>
		<option value="03">03월</option>
		<option value="04">04월</option>
		<option value="05">05월</option>
		<option value="06">06월</option>
		<option value="07">07월</option>
		<option value="08">08월</option>
		<option value="09">09월</option>
		<option value="10">10월</option>
		<option value="11">11월</option>
		<option value="12">12월</option>
		<option value="전체">전체</option>
	</select>&nbsp;&nbsp;
	<input type="submit" value="확 인" >
</form>
</div>
</body>
</html>