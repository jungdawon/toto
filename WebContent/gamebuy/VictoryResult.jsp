<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />

<table border="1" align="center" >
	<tr bgcolor="#E7E7E7" align="center">
		<td >리그</td>
		<td>구분</td>
		<td>회차</td>
	</tr>
	<c:forEach var="VicResultList" items="${VicResultList}">
			<tr align="center">
				<td>${VicResultList.league}</td>
				<td>${VicResultList.round2}</td>
				<td><a href="/toto/gamebuy/VictoryResultInput.to?turn=${VicResultList.turn2}&round=${VicResultList.round2}">${VicResultList.turn2}회차</a></td>
			</tr>
	</c:forEach>
</table>