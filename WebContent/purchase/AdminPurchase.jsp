<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>
<script type="text/javascript">
</script>
<title>내 구매 내역</title>
</head>
<%--  --%>
<body>
<div id="text">

<table width="700" align="center" border="0">
	<tr width="700" align="center" >
		<td width="25"></td>
		<td colspan="7">
			<table align="left" border="0">
			<tr>
		<td colspan="2"><h2>배팅관리</h2></td>
	</tr>
	
	<tr>
	<c:if test="${typeSelect == '승부식'}">
		<c:set var="sel" value="프로토"/>
	</c:if>
	<c:if test="${typeSelect == '승무패'}">
		<c:set var="sel" value="토토"/>
	</c:if>
	<c:if test="${typeSelect == '전체'}">
		<c:set var="sel" value="전체"/>
	</c:if>
	<c:if test="${when == 0 || when == 2}">
		<td colspan="2" style="font-size: 10pt;">- 최근 1주일 동안 배팅한 게임 내역입니다. (${sel})</td>
	</c:if>
	<c:if test="${when == 1}">
		<td colspan="2" style="font-size: 10pt;">- 오늘 동안 배팅한 게임 내역입니다. (${sel})</td>
	</c:if>
	<c:if test="${when == 3}">
		<td colspan="2" style="font-size: 10pt;">- 최근 15일 이내 배팅한  게임 내역입니다. (${sel})</td>
	</c:if>
	<c:if test="${when == 4}">
		<td colspan="2" style="font-size: 10pt;">- 최근 1개월 이내 배팅한  게임 내역입니다. (${sel})</td>
	</c:if>
	<c:if test="${when == 5}">
		<td colspan="2" style="font-size: 10pt;">- 최근 3개월 이내 배팅한  게임 내역입니다. (${sel})</td>
	</c:if>
	</tr>
	
	<tr height="20"><td></td></tr>	
	<tr><td style="font-size: 10pt;">ㆍ조회일자</td></tr>
	<tr height="5"><td></td></tr>
	<tr>
	<td>
	<c:if test="${when != 1 }">
	<a href="/toto/purchase/AdminPurchase.to?when=1&typeSelect=${typeSelect}">
	<img border="0" src="/toto/purchase/image/btn_today_off.gif"/></a>
	</c:if>
	<c:if test="${when == 1 }">
	<img border="0" src="/toto/purchase/image/btn_today_on.gif"/>
	</c:if>
	<c:if test="${when != 2}">
	<a href="/toto/purchase/AdminPurchase.to?when=2&typeSelect=${typeSelect}">
	<img border="0" src="/toto/purchase/image/btn_week_off.gif"/></a>
	</c:if>
	<c:if test="${when == 2}">
	<img border="0" src="/toto/purchase/image/btn_week_on.gif"/>
	</c:if>
	<c:if test="${when != 3 }">
	<a href="/toto/purchase/AdminPurchase.to?when=3&typeSelect=${typeSelect}">
	<img border="0" src="/toto/purchase/image/btn_fifteen_off.gif"/></a>
	</c:if>
	<c:if test="${when == 3 }">
	<img border="0" src="/toto/purchase/image/btn_fifteen_on.gif"/>
	</c:if>
	<c:if test="${when != 4 }">
	<a href="/toto/purchase/AdminPurchase.to?when=4&typeSelect=${typeSelect}">
	<img border="0" src="/toto/purchase/image/btn_month_off.gif"/></a>
	</c:if>
	<c:if test="${when == 4 }">
	<img border="0" src="/toto/purchase/image/btn_month_on.gif"/>
	</c:if>
	<c:if test="${when != 5 }">
	<a href="/toto/purchase/AdminPurchase.to?when=5&typeSelect=${typeSelect}">
	<img border="0" src="/toto/purchase/image/btn_treMonth_off.gif"/></a>
	</c:if>
	<c:if test="${when == 5 }">
	<img border="0" src="/toto/purchase/image/btn_treMonth_on.gif"/>
	</c:if>
	</td>
	</tr>
	<tr height="20"><td></td></tr>
	<tr>
		<td colspan="2" style="font-size: 10pt;">
		|<a href="/toto/purchase/AdminPurchase.to?when=${when}&typeSelect=전체">전체</a>
		|<a href="/toto/purchase/AdminPurchase.to?when=${when}&typeSelect=승부식">프로토</a>
		|<a href="/toto/purchase/AdminPurchase.to?when=${when}&typeSelect=승무패">토토</a>|</td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	<td colspan="7">
	<div style="height:315px; overflow:auto; width:800px;">
	<table align="center" border="1">
	<tr align="center">
		<td>번호</td>
		<td>ID</td>
		<td>게임종류</td>
		<td>발매회차</td>
		<td>구매일시</td>
		<td>투표권 고유번호</td>
		<td>구매금액</td>
		<td>상태</td>
		<td colspan="2">비고</td>
	</tr>
	<c:forEach items="${listPur}" var="listPur" varStatus="var">
	<tr onmouseover='this.style.backgroundColor="#FAED7D";' onmouseout='this.style.backgroundColor="white";'>
		<td align="center">${var.count }</td>
		<td align="center">${listPur.id }</td>
		
		<c:if test="${listPur.type == '승부식'}">
			<td align="center">프로토</td>
		</c:if>
		
		<c:if test="${listPur.type == '승무패'}">
			<td align="center">토토</td>
		</c:if>
		
		<td align="center">${listPur.round}회차</td>	
		<td align="center">${listPur.reg_date}</td>
		<td align="center">${listPur.productnum}</td>
		<td align="right"><fmt:formatNumber value="${listPur.bet}" type="number" />원&nbsp;</td>
		
		<c:if test="${listPur.status == 0}">
			<td align="right">발표전&nbsp;</td>
		</c:if>
		
		<c:if test="${listPur.status == 5}">
			<td align="right">적중실패&nbsp;</td>
		</c:if>
		
		<c:if test="${listPur.status == 4}">
			<td align="right">4등 (<fmt:formatNumber value="${listPur.price}" type="number" />원)&nbsp;</td>
		</c:if>
		
		<c:if test="${listPur.status == 3}">
			<td align="right">3등 (<fmt:formatNumber value="${listPur.price}" type="number" />원)&nbsp;</td>
		</c:if>
		
		<c:if test="${listPur.status == 2}">
			<td align="right">2등 (<fmt:formatNumber value="${listPur.price}" type="number" />원)&nbsp;</td>
		</c:if>
		
		<c:if test="${listPur.status == 1}">
			<td align="right">1등 (<fmt:formatNumber value="${listPur.price}" type="number" />원)&nbsp;</td>
		</c:if>
		
		<c:if test="${listPur.status == 6}">
			<td align="right">적중 (<fmt:formatNumber value="${listPur.price}" type="number" />원)&nbsp;;</td>
		</c:if>
		
		<td align="center">
			<c:if test="${listPur.refund == 1}">
				<c:if test="${listPur.status == 0}">
					<input type="button" value="환 불" onclick="location.href='/toto/purchase/refundPro.to?bet=${listPur.bet}&id=${listPur.id }&productnum=${listPur.productnum}'">
				</c:if>
			</c:if>
			<c:if test="${listPur.refund == 2}">
				환불완료
			</c:if>
		</td>
	</tr>
	</c:forEach>
	</table>
	</div>
	</td>
	</tr>
</table>
</div>
</body>
</html>