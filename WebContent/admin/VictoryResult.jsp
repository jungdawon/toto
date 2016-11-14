<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/admin/resultMenu.jsp" %>
<br />
<br />
<br />
<br />
<br />
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>

<div id="text">
<center><h2>토토 결과등록</h2></center>
<table border="1" align="center" >
	<tr bgcolor="#E7E7E7" align="center">
		<td width=100>방식</td>
		<td width=100>리그</td>
		<td width=100>회차</td>
		<td width=150>상태</td>
		<td width=100>결과</td>
	</tr>
	<c:forEach var="VicResultList" items="${VicResultList}">
			<tr align="center">
				<td style="color:#00C6ED">${VicResultList.game}</td>
				<td style="color:#FF7012">${VicResultList.league}</td>
				<td>${VicResultList.round}</td>
				<td style="color:red">${VicResultList.flag}</td>
				<td><a href="/toto/admin/VictoryResultInput.to?type=${VicResultList.type}&round=${VicResultList.round}&league=${VicResultList.league}"><img border="0" src="/toto/admin/image/register.gif"/></a></td>
			</tr>
	</c:forEach>
</table>
</div>