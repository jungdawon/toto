<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/gamebuy/victoryMenu.jsp" %>
<br />
<br />
<br />
<style type="text/css">
	#vote_2 {
		position: relative;
		left: 7%;
		
	}
	#vote_3 {
		position: relative;
		left: 7%;
		
	}
	#vote_4 {
		position: relative;
		left: 7%;
		
	}

</style>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>
<div id="text">
	<table border="1" align="center" width="700" id="vote_2">
		<tr align="left">
			<td colspan="5">＊발매 일정</td>
		</tr>
		<tr>
			<td rowspan="5" colspan="1"><img src="/toto/gamebuy/soccer.jpg" width="100"/></td>
		</tr>
		<tr>
			<td>총 발매금액 : <fmt:formatNumber value="${vote.price}" type="number" />원</td>
			<td>전체 투표수 : <fmt:formatNumber value="${VoteCount}" type="number" /></td>
		</tr>
		<tr>
			<td>발매기간 :
				<fmt:formatDate value="${bgdto.start_date}" pattern="yyyy년 MM월 dd일"/> ~ 
				<fmt:formatDate value="${bgdto.end_date}" pattern="yyyy년 MM월 dd일"/>
			</td>
			<td>1등 적중 예상금 : <fmt:formatNumber value="${(vote.price / 2) * 0.5}" type="number" />원</td>
		</tr>
		<tr>
			<td>환급(환불)기간 :
				<fmt:formatDate value="${bgdto.result_date}" pattern="yyyy년 MM월 dd일"/> ~
				${fn:substring(result,0,4) + 1}년${fn:substring(result,4,6)}월${fn:substring(result,6,8)}일
				
			</td>
			<td>적중결과 발표일 :<fmt:formatDate value="${bgdto.result_date}" pattern="yyyy년 MM월 dd일"/></td>
		</tr>
	</table>
	<br />
	
	<table border="1" align="center" width="700" id="vote_3">
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
		
	<c:set var="match_number" value="${1}" />
	
	<c:forEach var="victoryList" items="${victoryList}">
		<tr align="center">
			<td>${match_number}경기</td>
			<td>
				<fmt:formatDate value="${victoryList.reg_date}" pattern="yyyy년MM월dd일 HH시mm분" />
			</td>
			<td>${victoryList.home}</td>
			<td>
				<c:set var="matchnum" value="${1}" />
				<c:if test="${match_number eq 1}" >
					<c:forTokens var="match" items="${vote.match_1}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp; :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp; :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 2}" >
					<c:forTokens var="match" items="${vote.match_2}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 3}" >
					<c:forTokens var="match" items="${vote.match_3}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 4}" >
					<c:forTokens var="match" items="${vote.match_4}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 5}" >
					<c:forTokens var="match" items="${vote.match_5}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 6}" >
					<c:forTokens var="match" items="${vote.match_6}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 7}" >
					<c:forTokens var="match" items="${vote.match_7}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 8}" >
					<c:forTokens var="match" items="${vote.match_8}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 9}" >
					<c:forTokens var="match" items="${vote.match_9}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 10}" >
					<c:forTokens var="match" items="${vote.match_10}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 11}" >
					<c:forTokens var="match" items="${vote.match_11}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 12}" >
					<c:forTokens var="match" items="${vote.match_12}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 13}" >
					<c:forTokens var="match" items="${vote.match_13}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 14}" >
					<c:forTokens var="match" items="${vote.match_14}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				
			</td>
			<td>${victoryList.away}</td>
		</tr>
		<c:set var="match_number" value="${match_number + 1}" />
	</c:forEach>
	</table>
	<br />
	<br />
	<table align="center" width="700" id="vote_4">
		<tr align="left">
			<td>
				해당경기는 중립경기장 및 제2구장, 타 지역 등 경기장소에 특이사항이 있는 경기입니다.<br /> 
				      구매 시 경기단체 홈페이지 등을 확인하시기 바랍니다 <br />
				- 경기별 투표현황을 선택하시면 구매투표지[복식]에 자동으로 표기됩니다. <br />
				- 투표현황은 00년 00월 00일 00시 00분 기준입니다.
			<td>
		</tr>
	</table>
</div>