<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>    
<br />
<br />
<br />    
<form name="victory2" action="/toto/gamebuy/VictoryResultPro.to" method="post">
<table border="1" align="left" width="50%">
	<tr align="center" style="background:black; color:#F6F6F6;">
		<td width="200" style="border-top: 1px solid white;border-left: 1px solid white; background:white; color:#F6F6F6;"></td>
		<td width="100">경기</td>
		<td width="200" style="border: 1px solid black;">홈팀 vs 원정팀</td>
		<td width="50" style="border-top: 1px solid white; background:white; color:#F6F6F6;"></td>
		<td width="200" style="border: 1px solid black; background:black; color:#F6F6F6;">경기 결과 등록</td>
		<td width="50" style="border-top: 1px solid white; background:white; color:#F6F6F6;"></td>
	</tr>
	<c:set var="number" value="${1}" />
	<c:set var="i" value="${1}" />
	<c:forEach var="victoryList" items="${victoryList}" >
		<tr align="center">
			<td style="border-top: 1px solid white;border-bottom: 1px solid white;border-left: 1px solid white;"></td>
			<td>${number}경기</td>
			<td>${victoryList.home} vs ${victoryList.away}</td>
			<td style="border-top: 1px solid white;border-bottom: 1px solid white;"></td>
			<td>
				<input type="checkbox" id="match_${i}" name="match_${i}" value="승" />승
				<input type="checkbox" id="match_${i}" name="match_${i}" value="무" />무
				<input type="checkbox" id="match_${i}" name="match_${i}" value="패" />패
			</td>
			<td style="border-top: 1px solid white;border-bottom: 1px solid white;border-right: 1px solid white;"></td>
			<c:set var="number" value="${number + 1}" />
			<c:set var="i" value="${i + 1}" />
			<c:set var="turn2" value="${victoryList.turn2}" />
		</tr>
	</c:forEach>
	<input type="hidden" value="${turn2}" name="turn2" />
	
</table>
<input type="submit" value="결과 등록" />
</form>