<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />
<table align="center">
	<tr >
		<td align="left" >
		<font size="4">
			<a href="/toto/gamebuy/soccerVictory.to?turn2=1">게임 구매</a>&nbsp;&nbsp;&nbsp;
			<a href="/toto/gamebuy/soccerVictoryVote.to">투표현황</a>&nbsp;&nbsp;&nbsp;
			<a href="#">aaa</a>&nbsp;&nbsp;&nbsp;			
		</font>
		</td>
	</tr>
</table>
<table border="1" align="center" width="700">
	<tr align="left">
		<td colspan="5">＊발매 일정</td>
	</tr>
	<tr>
		<td rowspan="5" colspan="1"><img src="/toto/gamebuy/soccer.jpg" width="100"/></td>
	</tr>
	<tr>
		<td>총 발매금액 :</td>
		<td>전체 투표수 :</td>
	</tr>
	<tr>
		<td>발매기간 :</td>
		<td>1등 적중 예상금 :</td>
	</tr>
	<tr>
		<td>환급(환불)기간 :</td>
		<td>적중결과 발표일 :</td>
	</tr>
	<tr>
		<td>전회차이월금 :</td>
		<td></td>
	</tr>
</table>
<br />
<c:set var="match_number" value="${1}" />

<table border="1" align="center" width="700">
	<tr align="left">
		<td colspan="5">＊투표 현황</td>
	</tr>
	<tr bgcolor="#DAD9FF" align="center">
		<td>경기</td>
		<td>경기일시</td>
		<td>홈팀</td>
		<td>투표</td>
		<td>원정팀</td>
	</tr>
	
<c:forEach var="victoryList" items="${victoryList}">
	<tr align="center">
		<td>${match_number}경기</td>
		<td>${victoryList.reg_date}</td>
		<td>${victoryList.home}</td>
		<td>
			<c:if test="${match_number eq 1}" >
				승<c:out value="[${fn:substring(vote.match_1,0,1)}]"/><br />
				무<c:out value="[${fn:substring(vote.match_1,2,3)}]"/><br />
				패<c:out value="[${fn:substring(vote.match_1,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 2}" >
				승<c:out value="[${fn:substring(vote.match_2,0,1)}]"/><br />
				무<c:out value="[${fn:substring(vote.match_2,2,3)}]"/><br />
				패<c:out value="[${fn:substring(vote.match_2,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 3}" >
				승<c:out value="[${fn:substring(vote.match_3,0,1)}]"/><br />
				무<c:out value="[${fn:substring(vote.match_3,2,3)}]"/><br />
				패<c:out value="[${fn:substring(vote.match_3,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 4}" >
				승<c:out value="[${fn:substring(vote.match_4,0,1)}]"/><br />
				무<c:out value="[${fn:substring(vote.match_4,2,3)}]"/><br />
				패<c:out value="[${fn:substring(vote.match_4,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 5}" >
				승<c:out value="[${fn:substring(vote.match_5,0,1)}]"/><br />
				무<c:out value="[${fn:substring(vote.match_5,2,3)}]"/><br />
				패<c:out value="[${fn:substring(vote.match_5,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 6}" >
				승<c:out value="[${fn:substring(vote.match_6,0,1)}]"/><br />
				무<c:out value="[${fn:substring(vote.match_6,2,3)}]"/><br />
				패<c:out value="[${fn:substring(vote.match_6,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 7}" >
				승<c:out value="[${fn:substring(vote.match_7,0,1)}]"/><br />
				무<c:out value="[${fn:substring(vote.match_7,2,3)}]"/><br />
				패<c:out value="[${fn:substring(vote.match_7,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 8}" >
				승<c:out value="[${fn:substring(vote.match_8,0,1)}]"/><br />
				무<c:out value="[${fn:substring(vote.match_8,2,3)}]"/><br />
				패<c:out value="[${fn:substring(vote.match_8,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 9}" >
				승<c:out value="[${fn:substring(vote.match_9,0,1)}]"/><br />
				무<c:out value="[${fn:substring(vote.match_9,2,3)}]"/><br />
				패<c:out value="[${fn:substring(vote.match_9,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 10}" >
				승<c:out value="[${fn:substring(vote.match_10,0,1)}]"/><br />
				무<c:out value="[${fn:substring(vote.match_10,2,3)}]"/><br />
				패<c:out value="[${fn:substring(vote.match_10,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 11}" >
				승<c:out value="[${fn:substring(vote.match_11,0,1)}]"/><br />
				무<c:out value="[${fn:substring(vote.match_11,2,3)}]"/><br />
				패<c:out value="[${fn:substring(vote.match_11,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 12}" >
				승<c:out value="[${fn:substring(vote.match_12,0,1)}]"/><br />
				무<c:out value="[${fn:substring(vote.match_12,2,3)}]"/><br />
				패<c:out value="[${fn:substring(vote.match_12,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 13}" >
				승<c:out value="[${fn:substring(vote.match_13,0,1)}]"/><br />
				무<c:out value="[${fn:substring(vote.match_13,2,3)}]"/><br />
				패<c:out value="[${fn:substring(vote.match_13,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 14}" >
				승<c:out value="[${fn:substring(vote.match_14,0,1)}]"/><br />
				무<c:out value="[${fn:substring(vote.match_14,2,3)}]"/><br />
				패<c:out value="[${fn:substring(vote.match_14,4,5)}]"/>
			</c:if>
		</td>
		<td>${victoryList.away}</td>
	</tr>
	<c:set var="match_number" value="${match_number + 1}" />
</c:forEach>
</table>
<br />
<br />
<table align="center" width="700" >
	<tr align="left">
		<td>
			해당경기는 중립경기장 및 제2구장, 타 지역 등 경기장소에 특이사항이 있는 경기입니다.<br /> 
			      구매 시 경기단체 홈페이지 등을 확인하시기 바랍니다 <br />
			- 경기별 투표현황을 선택하시면 구매투표지[복식]에 자동으로 표기됩니다. <br />
			- 투표현황은 00년 00월 00일 00시 00분 기준입니다.
		<td>
	</tr>
</table> 