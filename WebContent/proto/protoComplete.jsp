<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />
<html>
<head>
<title>구매 완료</title>
<script type="text/javascript">
function another(){
	location.href='/toto/buygame/buyableGame.to';
}
function chk(){
	location.href='/toto/buygame/buyableGame.to';
}
function chk2(){
	location.href='/toto/agspay/AGS_pay.to';
}
</script>
</head>
<body>
<!-- 결제 실패시 -->
<c:if test="${chkSum == 0}">
<script>
	alert("해당 회차 구매금액이 10만원을 초과하였습니다.");
</script>
<table align="center" border="0">
	<tr>
		<td align="center" colspan="2"><h1>구매 금액 초과</h1></td>
	<tr>
	<tr>
	<td>배팅 금액 :</td><td align="right"><b>${bet}</b>원&nbsp;</td>
	</tr>
	<tr>
	<td>이전 구매 금액 :</td><td align="right"><b>${sum}</b>원&nbsp;</td>
	</tr>
	<tr>
	<td>구매 가능 금액 :</td><td align="right"><b>${100000 - sum}</b>원&nbsp;</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
		<input type="button" value="돌아가기" onclick="chk();">&nbsp;
		<input type="button" value="충전하기">
		</td>
	</tr>
</table>
</c:if>
<c:if test="${chk == 0 }">
<script>
	alert("예치금이 부족합니다.");
</script>
<table align="center" border="0">
	<tr>
		<td align="center" colspan="2"><h1>구매가 취소되었습니다.</h1></td>
	<tr>
	<td>배팅 금액 :</td><td align="right"><b>${bet}</b>원&nbsp;</td>
	</tr>
	<tr>
	<td>부족한 금액 :</td><td align="right"><b>${lack}</b>원&nbsp;</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
		<input type="button" value="돌아가기" onclick="chk();">&nbsp;
		<input type="button" value="충전하기" onclick="chk2();">
		</td>
	</tr>
</table>
</c:if>
<!-- 결제 성공시 -->
<c:if test="${chk == 1 }">
<script>
	alert("구매가 완료되었습니다.");
</script>
<table align="center" border="0">
	<tr>
		<td align="center" colspan="2"><h1>구매 완료</h1></td>
	<tr>
	<td>배팅 금액 :</td><td align="right"><b>${bet}</b>원&nbsp;</td>
	</tr>
	<tr>
	<td>잔여 예치금 :</td><td align="right"><b>${change}</b>원&nbsp;</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
		<input type="button" value="다른경기보기" onclick="another();">&nbsp;
		<input type="button" value="구매내역확인" onclick="location.href='/toto/purchase/listPurchase.to';">
		</td>
	</tr>
</table>
</c:if>
</body>
</html>