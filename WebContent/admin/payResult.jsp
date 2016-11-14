<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/admin/priceMenu.jsp" %> 
<br />
<br />
<br />

<!-- 승무패(gamebuy) -->
<c:forEach var="totoList" items="${totoList}">
	<!-- 작년 -->
	<c:if test="${fn:substring(totoList.productnum,0,4) eq fn:substring(str,0,4)-1}">
		<c:set var="YesterYear" value="${YesterYear + totoList.price }" />
	</c:if>
	<!-- 이번년 -->
	<c:if test="${fn:substring(totoList.productnum,0,4) eq fn:substring(str,0,4)}">
		<c:set var="ToYear" value="${ToYear + totoList.price }" />
	</c:if>
	<!-- 오늘 날짜 매출 합산 -->
	<c:if test="${fn:substring(totoList.productnum,0,8) eq fn:substring(str,0,8)}">
		<c:set var="ToDay" value="${ToDay + totoList.price }" />
	</c:if>
	<!-- 어제 날짜 매출 합산 -->
	<c:if test="${fn:substring(totoList.productnum,0,8) eq fn:substring(str2,0,8)}">
		<c:set var="YesterDay" value="${YesterDay + totoList.price }" />
	</c:if>
	
	<!-- 지난주 판매금액 계산 (>= , ge) (<= , le )  -->
	<c:if test="${fn:substring(totoList.productnum,0,8) ge fn:substring(ju,0,8) && fn:substring(totoList.productnum,0,8) le fn:substring(ju_end,0,8)}" >
		<c:set var="yesterju" value="${yesterju + totoList.price}" />
	</c:if>
	
	<!-- 이번주 판매금액 계산 -->
	<c:if test="${fn:substring(totoList.productnum,0,8) ge fn:substring(ju1,0,8) && fn:substring(totoList.productnum,0,8) le fn:substring(ju_end1,0,8)}" >
		<c:set var="todayju" value="${todayju + totoList.price}" />
	</c:if>
	
	<!--  지난달 월 매출 -->
	<c:if test="${fn:substring(totoList.productnum,4,6) eq (fn:substring(str,4,6)-1) }" >
		<c:set var="yestermonth" value="${yestermonth + totoList.price}" />	<!-- (결제월수 < 현재월수) -->
	</c:if>
	<!--  이번달 월 매출 -->
	<c:if test="${fn:substring(totoList.productnum,4,6) eq fn:substring(str,4,6) }" >
		<c:set var="tomonth" value="${tomonth + totoList.price}" />	<!-- (결제월수 < 현재월수) -->
	</c:if>
</c:forEach>

<br />

<!-- 승부식(protobet) -->
<c:forEach var="protoList" items="${protoList}">

	<c:set var="ToYear" value="${ToYear + protoList.bet }" />
		<!-- 오늘 날짜 매출 합산 -->
	<c:if test="${fn:substring(protoList.productnum,0,8) eq fn:substring(str,0,8)}">
		<c:set var="ToDay" value="${ToDay + protoList.bet }" />
	</c:if>
	<!-- 어제 날짜 매출 합산 -->
	<c:if test="${fn:substring(protoList.productnum,0,8) eq fn:substring(str2,0,8)}">
		<c:set var="YesterDay" value="${YesterDay + protoList.bet }" />
	</c:if>
	
	<!-- 지난주 판매금액 계산 (>= , ge) (<= , le )  -->
	<c:if test="${fn:substring(protoList.productnum,0,8) ge fn:substring(ju,0,8) && fn:substring(protoList.productnum,0,8) le fn:substring(ju_end,0,8)}" >
		<c:set var="yesterju" value="${yesterju + protoList.bet}" />
	</c:if>
	
	<!-- 이번주 판매금액 계산 -->
	<c:if test="${fn:substring(protoList.productnum,0,8) ge fn:substring(ju1,0,8) && fn:substring(protoList.productnum,0,8) le fn:substring(ju_end1,0,8)}" >
		<c:set var="todayju" value="${todayju + protoList.bet}" />
	</c:if>
	
	<!--  지난달 월 매출 -->
	<c:if test="${fn:substring(protoList.productnum,4,6) eq (fn:substring(str,4,6)-1) }" >
		<c:set var="yestermonth" value="${yestermonth + protoList.bet}" />	<!-- (결제월수 < 현재월수) -->
	</c:if>
	<!--  이번달 월 매출 -->
	<c:if test="${fn:substring(protoList.productnum,4,6) eq fn:substring(str,4,6) }" >
		<c:set var="tomonth" value="${tomonth + protoList.bet}" />	<!-- (결제월수 < 현재월수) -->
	</c:if>
</c:forEach>

<style type="text/css">
#text	{

	position: absolute;
	top: 200px;
	left: 300px;
	width: 1150px;}
	#text2	{

	position: absolute;
	top: 450px;
	left: 300px;
	width: 1150px;}
	#text3	{

	position: absolute;
	top: 500px;
	left: 300px;
	width: 1150px;}
</style>
<div id="text">
<br />
<br />

<table border="0" align="left" width="500">
	<tr>
		<td>
			<font size="4">매출 관리</font>	&nbsp;&nbsp;
			<img src="/toto/admin/image/content.gif" />
		</td>
		<tr>
			<td><img src="/toto/admin/image/line.png" width="800"/></td>
		</tr>
	</tr>
</table>

<br />
<br />
<table border="1" align="left" width="500">
	<tr bgcolor="#FAF4C0" align="center"> 
		<td>요일</td>
		<td>금액</td>
		<td>요일</td>
		<td>금액</td>
	</tr>
	<tr align="center"> 
		<td bgcolor="#FAF4C0">어제</td>
		<td><font color="#FF8224" >
			
			<fmt:formatNumber value="${YesterDay}" type="number" />
		</font>원</td>
		<td bgcolor="#FAF4C0">오늘</td>
		<td>
			<c:if test="${ToDay eq null}"><font color="#FF8224" >0</font></c:if>
			<font color="#FF8224" ><fmt:formatNumber value="${ToDay}" type="number" /></font>원
		</td>
	</tr>
	<tr align="center"> 
		<td bgcolor="#FAF4C0">지난주</td>
		<td>
			<c:if test="${yesterju eq null}"><font color="#FF8224" >0</font></c:if>
			<font color="#FF8224" ><fmt:formatNumber value="${yesterju}" type="number" /></font>원
		</td>
		<td bgcolor="#FAF4C0">이번주</td>
		<td>
			<c:if test="${todayju eq null}"><font color="#FF8224" >0</font></c:if>
			<font color="#FF8224" ><fmt:formatNumber value="${todayju}" type="number" /></font>원
		</td>
	</tr>
	<tr align="center"> 
		<td bgcolor="#FAF4C0">지난달</td>
		<td>
			<c:if test="${yestermonth eq null}"><font color="#FF8224" >0</font></c:if>
			<font color="#FF8224" ><fmt:formatNumber value="${yestermonth}" type="number" /></font>원
		</td>
		<td bgcolor="#FAF4C0">이번달</td>
		<td><font color="#FF8224" ><fmt:formatNumber value="${tomonth}" type="number" /></font>원</td>
	</tr>
	<tr align="center"> 
		<td bgcolor="#FAF4C0">2014년</td>
		<td>
			<c:if test="${YesterYear eq null}"><font color="#FF8224" >0</font></c:if>
			<font color="#FF8224" ><fmt:formatNumber value="${YesterYear}" type="number" /></font>원
		</td>
		<td bgcolor="#FAF4C0">2015년</td>
		<td><font color="#FF8224" ><fmt:formatNumber value="${ToYear}" type="number" /></font>원</td>
	</tr>
</table>
</div>
<br />
<div id="text2" >
<table border="0" align="left" width="500">
	<tr align="center" >
		<td>
			<a href="/toto/admin/payResult.to?flag=1" >승무패</a> &nbsp;&nbsp;||&nbsp;&nbsp;
			<a href="/toto/admin/payResult.to?flag=2" >승부식</a>
		</td>
	</tr>
</table>
</div>
<div id="text3" >
<c:if test="${flag eq 1}" >
	<table border="1" align="left" width="500">
		<tr align="center" bgcolor="#FAF4C0">
			<td>리그</td>
			<td>회차</td>
			<td>총 구매 금액</td>
			<td>총 당첨 금액</td>
			<td>경기 마감 일시</td>
		</tr>
		
		<c:forEach var="result_protoList" items="${result_protoList}" >
			<tr align="center">
				<td>${result_protoList.league}</td>
				<td>${result_protoList.turn2}</td>
				<td>
					<font color="#FF8224" >
						<fmt:formatNumber value="${result_protoList.price}" type="number" />
					</font>원
				</td>
				<td>
					<font color="#FF8224" >
						<fmt:formatNumber value="${result_protoList.result_price}" type="number" />
					</font>원				
				</td>
				<td>
					<font color="#FF4848" >
						<fmt:formatDate value="${result_protoList.end_date}" pattern="yyyy.MM.dd HH:mm" />
					</font>
				</td>
			</tr>
		</c:forEach>
	</table>
</c:if>

<c:if test="${flag eq 2}" >
	<table border="1" align="left" width="500">
		<tr align="center" bgcolor="#FAF4C0">
			<td>리그</td>
			<td>회차</td>
			<td>총 구매 금액</td>
			<td>경기 마감 일시</td>
		</tr>
		
		<c:forEach var="result_totoList" items="${result_totoList}" >
			<tr align="center">
				<td>${result_totoList.type}</td>
				<td>${result_totoList.round}</td>
				<td>
					<font color="#FF8224" >
						<fmt:formatNumber value="${result_totoList.bet}" type="number" />
					</font>원
				</td>
				<td>
					<font color="#FF4848" >
						<fmt:formatDate value="${result_totoList.end_date}" pattern="yyyy.MM.dd HH:mm" />
					</font>
				</td>
			</tr>
		</c:forEach>
	</table>
</c:if>
</div>