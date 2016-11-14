<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/admin/priceMenu.jsp" %> 
<br />
<br />
<br />

<!-- �¹���(gamebuy) -->
<c:forEach var="totoList" items="${totoList}">
	<!-- �۳� -->
	<c:if test="${fn:substring(totoList.productnum,0,4) eq fn:substring(str,0,4)-1}">
		<c:set var="YesterYear" value="${YesterYear + totoList.price }" />
	</c:if>
	<!-- �̹��� -->
	<c:if test="${fn:substring(totoList.productnum,0,4) eq fn:substring(str,0,4)}">
		<c:set var="ToYear" value="${ToYear + totoList.price }" />
	</c:if>
	<!-- ���� ��¥ ���� �ջ� -->
	<c:if test="${fn:substring(totoList.productnum,0,8) eq fn:substring(str,0,8)}">
		<c:set var="ToDay" value="${ToDay + totoList.price }" />
	</c:if>
	<!-- ���� ��¥ ���� �ջ� -->
	<c:if test="${fn:substring(totoList.productnum,0,8) eq fn:substring(str2,0,8)}">
		<c:set var="YesterDay" value="${YesterDay + totoList.price }" />
	</c:if>
	
	<!-- ������ �Ǹűݾ� ��� (>= , ge) (<= , le )  -->
	<c:if test="${fn:substring(totoList.productnum,0,8) ge fn:substring(ju,0,8) && fn:substring(totoList.productnum,0,8) le fn:substring(ju_end,0,8)}" >
		<c:set var="yesterju" value="${yesterju + totoList.price}" />
	</c:if>
	
	<!-- �̹��� �Ǹűݾ� ��� -->
	<c:if test="${fn:substring(totoList.productnum,0,8) ge fn:substring(ju1,0,8) && fn:substring(totoList.productnum,0,8) le fn:substring(ju_end1,0,8)}" >
		<c:set var="todayju" value="${todayju + totoList.price}" />
	</c:if>
	
	<!--  ������ �� ���� -->
	<c:if test="${fn:substring(totoList.productnum,4,6) eq (fn:substring(str,4,6)-1) }" >
		<c:set var="yestermonth" value="${yestermonth + totoList.price}" />	<!-- (�������� < �������) -->
	</c:if>
	<!--  �̹��� �� ���� -->
	<c:if test="${fn:substring(totoList.productnum,4,6) eq fn:substring(str,4,6) }" >
		<c:set var="tomonth" value="${tomonth + totoList.price}" />	<!-- (�������� < �������) -->
	</c:if>
</c:forEach>

<br />

<!-- �ºν�(protobet) -->
<c:forEach var="protoList" items="${protoList}">

	<c:set var="ToYear" value="${ToYear + protoList.bet }" />
		<!-- ���� ��¥ ���� �ջ� -->
	<c:if test="${fn:substring(protoList.productnum,0,8) eq fn:substring(str,0,8)}">
		<c:set var="ToDay" value="${ToDay + protoList.bet }" />
	</c:if>
	<!-- ���� ��¥ ���� �ջ� -->
	<c:if test="${fn:substring(protoList.productnum,0,8) eq fn:substring(str2,0,8)}">
		<c:set var="YesterDay" value="${YesterDay + protoList.bet }" />
	</c:if>
	
	<!-- ������ �Ǹűݾ� ��� (>= , ge) (<= , le )  -->
	<c:if test="${fn:substring(protoList.productnum,0,8) ge fn:substring(ju,0,8) && fn:substring(protoList.productnum,0,8) le fn:substring(ju_end,0,8)}" >
		<c:set var="yesterju" value="${yesterju + protoList.bet}" />
	</c:if>
	
	<!-- �̹��� �Ǹűݾ� ��� -->
	<c:if test="${fn:substring(protoList.productnum,0,8) ge fn:substring(ju1,0,8) && fn:substring(protoList.productnum,0,8) le fn:substring(ju_end1,0,8)}" >
		<c:set var="todayju" value="${todayju + protoList.bet}" />
	</c:if>
	
	<!--  ������ �� ���� -->
	<c:if test="${fn:substring(protoList.productnum,4,6) eq (fn:substring(str,4,6)-1) }" >
		<c:set var="yestermonth" value="${yestermonth + protoList.bet}" />	<!-- (�������� < �������) -->
	</c:if>
	<!--  �̹��� �� ���� -->
	<c:if test="${fn:substring(protoList.productnum,4,6) eq fn:substring(str,4,6) }" >
		<c:set var="tomonth" value="${tomonth + protoList.bet}" />	<!-- (�������� < �������) -->
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
			<font size="4">���� ����</font>	&nbsp;&nbsp;
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
		<td>����</td>
		<td>�ݾ�</td>
		<td>����</td>
		<td>�ݾ�</td>
	</tr>
	<tr align="center"> 
		<td bgcolor="#FAF4C0">����</td>
		<td><font color="#FF8224" >
			
			<fmt:formatNumber value="${YesterDay}" type="number" />
		</font>��</td>
		<td bgcolor="#FAF4C0">����</td>
		<td>
			<c:if test="${ToDay eq null}"><font color="#FF8224" >0</font></c:if>
			<font color="#FF8224" ><fmt:formatNumber value="${ToDay}" type="number" /></font>��
		</td>
	</tr>
	<tr align="center"> 
		<td bgcolor="#FAF4C0">������</td>
		<td>
			<c:if test="${yesterju eq null}"><font color="#FF8224" >0</font></c:if>
			<font color="#FF8224" ><fmt:formatNumber value="${yesterju}" type="number" /></font>��
		</td>
		<td bgcolor="#FAF4C0">�̹���</td>
		<td>
			<c:if test="${todayju eq null}"><font color="#FF8224" >0</font></c:if>
			<font color="#FF8224" ><fmt:formatNumber value="${todayju}" type="number" /></font>��
		</td>
	</tr>
	<tr align="center"> 
		<td bgcolor="#FAF4C0">������</td>
		<td>
			<c:if test="${yestermonth eq null}"><font color="#FF8224" >0</font></c:if>
			<font color="#FF8224" ><fmt:formatNumber value="${yestermonth}" type="number" /></font>��
		</td>
		<td bgcolor="#FAF4C0">�̹���</td>
		<td><font color="#FF8224" ><fmt:formatNumber value="${tomonth}" type="number" /></font>��</td>
	</tr>
	<tr align="center"> 
		<td bgcolor="#FAF4C0">2014��</td>
		<td>
			<c:if test="${YesterYear eq null}"><font color="#FF8224" >0</font></c:if>
			<font color="#FF8224" ><fmt:formatNumber value="${YesterYear}" type="number" /></font>��
		</td>
		<td bgcolor="#FAF4C0">2015��</td>
		<td><font color="#FF8224" ><fmt:formatNumber value="${ToYear}" type="number" /></font>��</td>
	</tr>
</table>
</div>
<br />
<div id="text2" >
<table border="0" align="left" width="500">
	<tr align="center" >
		<td>
			<a href="/toto/admin/payResult.to?flag=1" >�¹���</a> &nbsp;&nbsp;||&nbsp;&nbsp;
			<a href="/toto/admin/payResult.to?flag=2" >�ºν�</a>
		</td>
	</tr>
</table>
</div>
<div id="text3" >
<c:if test="${flag eq 1}" >
	<table border="1" align="left" width="500">
		<tr align="center" bgcolor="#FAF4C0">
			<td>����</td>
			<td>ȸ��</td>
			<td>�� ���� �ݾ�</td>
			<td>�� ��÷ �ݾ�</td>
			<td>��� ���� �Ͻ�</td>
		</tr>
		
		<c:forEach var="result_protoList" items="${result_protoList}" >
			<tr align="center">
				<td>${result_protoList.league}</td>
				<td>${result_protoList.turn2}</td>
				<td>
					<font color="#FF8224" >
						<fmt:formatNumber value="${result_protoList.price}" type="number" />
					</font>��
				</td>
				<td>
					<font color="#FF8224" >
						<fmt:formatNumber value="${result_protoList.result_price}" type="number" />
					</font>��				
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
			<td>����</td>
			<td>ȸ��</td>
			<td>�� ���� �ݾ�</td>
			<td>��� ���� �Ͻ�</td>
		</tr>
		
		<c:forEach var="result_totoList" items="${result_totoList}" >
			<tr align="center">
				<td>${result_totoList.type}</td>
				<td>${result_totoList.round}</td>
				<td>
					<font color="#FF8224" >
						<fmt:formatNumber value="${result_totoList.bet}" type="number" />
					</font>��
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