<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="/gamebuy/victoryMenu.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<br />
<br />
<br />

<script>
	function chk(){
		location.href='/toto/buygame/buyableGame.to';
	}function chk2(){
		location.href='/toto/agspay/AGS_pay.to';
	}
</script>
<style type="text/css">
	#vi14_1 {
		position: relative;
		left: 20%;
		
	}
	#vi14_2 {
		position: relative;
		left: 20%;
		
	}
	#vi14_3 {
		position: relative;
		left: 20%;
		
	}

</style>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>
<c:if test="${chk eq 0}" >
<div id="text" >

<table align="center" border="0">
	<tr align="center">
		<td><h1>구매 완료!!!</h1></td>
	</tr>
</table>

<table border="1" align="left" width="30%" id="vi14_1">
	<tr align="center" style="background:black; color:#F6F6F6;">
		<td width="100">경기</td>
		<td width="200" style="border: 1px solid black;">홈팀 <img border="0" src="/toto/game/image/vs.gif"/> 원정팀</td>
	</tr>
	<c:set var="number" value="${1}" />
	<c:set var="i" value="${1}" />
	<c:forEach var="victorylist" items="${victorylist}" >
		<tr align="center">
			<td>${number}경기</td>
			<td>${victorylist.home} <img border="0" src="/toto/game/image/vs.gif"/> ${victorylist.away}</td>
			<c:set var="number" value="${number + 1}" />
			<c:set var="i" value="${i + 1}" />
		</tr>
	</c:forEach>
	
</table>
<table border="1" align="left" width="10%" id="vi14_2">
	<tr align="center" style="background:black; color:#F6F6F6;">
		<td width="100">구매결과</td>
	</tr>
	<tr align="center">
		<td>
			<c:if test="${fn:substring(pricedto.match_1,0,1) eq 1}" >승&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_1,2,3) eq 1}" >무&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_1,4,5) eq 1}" >패&nbsp;</c:if>
		</td>
	</tr>
	<tr align="center">
		<td>
			<c:if test="${fn:substring(pricedto.match_2,0,1) eq 1}" >승&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_2,2,3) eq 1}" >무&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_2,4,5) eq 1}" >패&nbsp;</c:if>
		</td>
	</tr>
	<tr align="center">
		<td>
			<c:if test="${fn:substring(pricedto.match_3,0,1) eq 1}" >승&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_3,2,3) eq 1}" >무&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_3,4,5) eq 1}" >패&nbsp;</c:if>
		</td>
	</tr>
	<tr align="center">
		<td>
			<c:if test="${fn:substring(pricedto.match_4,0,1) eq 1}" >승&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_4,2,3) eq 1}" >무&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_4,4,5) eq 1}" >패&nbsp;</c:if>
		</td>
	</tr>
	<tr align="center">
		<td>
			<c:if test="${fn:substring(pricedto.match_5,0,1) eq 1}" >승&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_5,2,3) eq 1}" >무&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_5,4,5) eq 1}" >패&nbsp;</c:if>
		</td>
	</tr>
	<tr align="center">
		<td>
			<c:if test="${fn:substring(pricedto.match_6,0,1) eq 1}" >승&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_6,2,3) eq 1}" >무&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_6,4,5) eq 1}" >패&nbsp;</c:if>
		</td>
	</tr>
	<tr align="center">
		<td>
			<c:if test="${fn:substring(pricedto.match_7,0,1) eq 1}" >승&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_7,2,3) eq 1}" >무&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_7,4,5) eq 1}" >패&nbsp;</c:if>
		</td>
	</tr>
	<tr align="center">
		<td>
			<c:if test="${fn:substring(pricedto.match_8,0,1) eq 1}" >승&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_8,2,3) eq 1}" >무&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_8,4,5) eq 1}" >패&nbsp;</c:if>
		</td>
	</tr>
	<tr align="center">
		<td>
			<c:if test="${fn:substring(pricedto.match_9,0,1) eq 1}" >승&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_9,2,3) eq 1}" >무&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_9,4,5) eq 1}" >패&nbsp;</c:if>
		</td>
	</tr>
	<tr align="center">
		<td>
			<c:if test="${fn:substring(pricedto.match_10,0,1) eq 1}" >승&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_10,2,3) eq 1}" >무&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_10,4,5) eq 1}" >패&nbsp;</c:if>
		</td>
	</tr>
	<tr align="center">
		<td>
			<c:if test="${fn:substring(pricedto.match_11,0,1) eq 1}" >승&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_11,2,3) eq 1}" >무&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_11,4,5) eq 1}" >패&nbsp;</c:if>
		</td>
	</tr>
	<tr align="center">
		<td>
			<c:if test="${fn:substring(pricedto.match_12,0,1) eq 1}" >승&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_12,2,3) eq 1}" >무&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_12,4,5) eq 1}" >패&nbsp;</c:if>
		</td>
	</tr>
	<tr align="center">
		<td>
			<c:if test="${fn:substring(pricedto.match_13,0,1) eq 1}" >승&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_13,2,3) eq 1}" >무&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_13,4,5) eq 1}" >패&nbsp;</c:if>
		</td>
	</tr>
	<tr align="center">
		<td>
			<c:if test="${fn:substring(pricedto.match_14,0,1) eq 1}" >승&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_14,2,3) eq 1}" >무&nbsp;</c:if>
			<c:if test="${fn:substring(pricedto.match_14,4,5) eq 1}" >패&nbsp;</c:if>
		</td>
	</tr>
</table>
<table border="1" width="28%" id="vi14_3">
	<tr align="center" style="background:black; color:#F6F6F6;">
		<td width="100" style="border-top: 1px solid white;border-left: 1px solid white; background:white; color:#F6F6F6;"></td>
		<td width="400">구매 금액</td>
	</tr>
	<tr align="center">
		<td width="100" style="border-top: 1px solid white;border-left: 1px solid white; background:white; color:#F6F6F6;"></td>
		<td width="400">예치금 잔액 :<input type="text" id="cash" value="${my.cash}" disabled="disabled"/>원</td>
	</tr>
	<tr align="center">
		<td width="100" style="border-top: 1px solid white;border-left: 1px solid white; background:white; color:#F6F6F6;"></td>
		<td width="400">총구매 금액 :<input type="text" id="price" value="${pricedto.price}" readonly="readonly"/>원 </td>
	</tr>
	<tr align="center">
		<td width="100" style="border-top: 1px solid white;border-left: 1px solid white; background:white; color:#F6F6F6;"></td>
		<td width="400">
			<a href="/toto/buygame/buyableGame.to">다른경기보기</a>&nbsp;&nbsp;&nbsp;
			<a href="/toto/purchase/listPurchase.to">구매내역확인</a>
		</td>
	</tr>
	<tr align="center">
		<td width="100" style="border-top: 1px solid white;border-left: 1px solid white;border-bottom: 1px solid white; background:white; color:#F6F6F6;"></td>
		<td width="400">※구매가능 금액은 회차당 10만원입니다.</td>
	</tr>
</table>
</div>
</c:if>

<c:if test="${chk eq 1}">
	<div id="test">
		<table align="center" border="0">
			<tr>
				<td align="center" colspan="2"><h1>구매 금액 초과</h1></td>
			<tr>
			<tr>
				<td>배팅 금액 :</td><td align="right"><b>${price}</b>원&nbsp;</td>
			</tr>
			<tr>
				<td>이전 구매 금액 :</td><td align="right"><b>${result}</b>원&nbsp;</td>
			</tr>
			<tr>
				<td>구매 가능 금액 :</td><td align="right"><b>${100000 - result}</b>원&nbsp;</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="button" value="돌아가기" onclick="chk();">&nbsp;
					<input type="button" value="충전하기" onclick="chk2();">
				</td>
			</tr>
		</table>
	</div>
</c:if>