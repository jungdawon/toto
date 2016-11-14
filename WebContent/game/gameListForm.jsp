<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if> --%>
<br />
<br />
<br />
<html>
<style>
#gameListForm
</style>
<head>
<title>경기일정확인</title>
</head>
<body>
<div id="gameListForm">
<form name="checkstat" method="post" action="/toto/game/gameListMonth.to">
	<input type="hidden" name="league" value="${selc.league}" />
	<table width="800" align="center" border="0">
	<tr height="30">
	<c:if test="${selc.league == 'K리그' }">
	<td rowspan="2"><h3>축구</h3></td>
	</c:if>
	<c:if test="${selc.league == 'KBO' }">
	<td  rowspan="2"><h3>야구</h3></td>
	</c:if>
	<c:if test="${selc.league == 'KBL' }">
	<td rowspan="2"><h3>농구</h3></td>
	</c:if>
	<td></td>
	</tr>
	<tr height="30">
	<td></td><td><img border="0" src="/toto/game/image/tit_txtBase.gif"/></td>
	</tr>
	</table>
	<br>
	기간선택
	<select name="yy" onchange="">
		<c:if test="${selc.yy != null}">
		<option value="${selc.yy}">${selc.yy}년</option>
		</c:if>
		<option value="2015">2015년</option>
		<option value="2014">2014년</option>
	</select>&nbsp;&nbsp;
	<select name="mm" onchange="">
		<c:if test="${selc.mm != null}">
		<option value="${selc.mm}">${selc.mm}월</option>
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
	</select>&nbsp;&nbsp;
	팀선택
	<select name="team">
		<c:if test="${selc.team != null}">
		<option value="${selc.team}">${selc.team}</option>
		</c:if>
		<option value="전북">전북</option>	
		<option value="수원">수원</option>		
		<option value="전남">전남</option>
		<option value="서울">서울</option>
		<option value="포항">포항</option>
		<option value="성남">성남</option>
		<option value="인천">인천</option>
		<option value="제주">제주</option>
		<option value="광주">광주</option>
		<option value="울산">울산</option>
		<option value="부산">부산</option>
		<option value="대전">대전</option>
		<option value="전체">전체</option>
	</select>
	<input type="submit" value="확 인" onclick="/toto/game/gameListForm.to">
</form>
</div>
</body>
</html>