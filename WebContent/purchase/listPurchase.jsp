<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
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
<c:if test="${idchk == 0 }">
	<script type="text/javascript">
	alert("�α����� �ʿ��մϴ�.");
	location.href="/toto/member/loginForm.to";
	</script>
</c:if>
<table width="800" align="center" border="0">
	<tr>
	<td colspan="7">
	<table align="left">
	<tr>
	<td colspan="2"><h2>����/���߳���</h2></td>
	</tr>
	<tr>
	<c:if test="${typeSelect == '�ºν�'}">
	<c:set var="sel" value="������"/>
	</c:if>
	<c:if test="${typeSelect == '�¹���'}">
	<c:set var="sel" value="����"/>
	</c:if>
	<c:if test="${typeSelect == '��ü'}">
	<c:set var="sel" value="��ü"/>
	</c:if>
	<c:if test="${when == 0 || when == 2}">
	<td colspan="2" style="font-size: 10pt;">- �ֱ� 1���� �̳� ȸ���Բ��� �����Ͻ� ���� �����Դϴ�. (${sel})</td>
	</c:if>
	<c:if test="${when == 1}">
	<td colspan="2" style="font-size: 10pt;">- ���� ���� ȸ���Բ��� �����Ͻ� ���� �����Դϴ�. (${sel})</td>
	</c:if>
	<c:if test="${when == 3}">
	<td colspan="2" style="font-size: 10pt;">- �ֱ� 15�� �̳� ȸ���Բ��� �����Ͻ� ���� �����Դϴ�. (${sel})</td>
	</c:if>
	<c:if test="${when == 4}">
	<td colspan="2" style="font-size: 10pt;">- �ֱ� 1���� �̳� ȸ���Բ��� �����Ͻ� ���� �����Դϴ�. (${sel})</td>
	</c:if>
	<c:if test="${when == 5}">
	<td colspan="2" style="font-size: 10pt;">- �ֱ� 3���� �̳� ȸ���Բ��� �����Ͻ� ���� �����Դϴ�. (${sel})</td>
	</c:if>
	</tr>
	<tr height="20"><td></td></tr>	
	<tr><td style="font-size: 10pt;">����ȸ����</td></tr>
	<tr height="5"><td></td></tr>
	<tr>
	<td>
	<c:if test="${when != 1 }">
	<a href="/toto/purchase/listPurchase.to?when=1&typeSelect=${typeSelect}">
	<img border="0" src="/toto/purchase/image/btn_today_off.gif"/></a>
	</c:if>
	<c:if test="${when == 1 }">
	<img border="0" src="/toto/purchase/image/btn_today_on.gif"/>
	</c:if>
	<c:if test="${when != 2}">
	<a href="/toto/purchase/listPurchase.to?when=2&typeSelect=${typeSelect}">
	<img border="0" src="/toto/purchase/image/btn_week_off.gif"/></a>
	</c:if>
	<c:if test="${when == 2}">
	<img border="0" src="/toto/purchase/image/btn_week_on.gif"/>
	</c:if>
	<c:if test="${when != 3 }">
	<a href="/toto/purchase/listPurchase.to?when=3&typeSelect=${typeSelect}">
	<img border="0" src="/toto/purchase/image/btn_fifteen_off.gif"/></a>
	</c:if>
	<c:if test="${when == 3 }">
	<img border="0" src="/toto/purchase/image/btn_fifteen_on.gif"/>
	</c:if>
	<c:if test="${when != 4 }">
	<a href="/toto/purchase/listPurchase.to?when=4&typeSelect=${typeSelect}">
	<img border="0" src="/toto/purchase/image/btn_month_off.gif"/></a>
	</c:if>
	<c:if test="${when == 4 }">
	<img border="0" src="/toto/purchase/image/btn_month_on.gif"/>
	</c:if>
	<c:if test="${when != 5 }">
	<a href="/toto/purchase/listPurchase.to?when=5&typeSelect=${typeSelect}">
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
		|<a href="/toto/purchase/listPurchase.to?when=${when}&typeSelect=��ü">��ü</a>
		|<a href="/toto/purchase/listPurchase.to?when=${when}&typeSelect=�ºν�">������</a>
		|<a href="/toto/purchase/listPurchase.to?when=${when}&typeSelect=�¹���">����</a>|</td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	<td colspan="7">
	<div style="height:315px; overflow:auto">
	<table align="center" border="1" width="800">
	<tr align="center">
		<td>��ȣ</td>
		<td>��������</td>
		<td>�߸�ȸ��</td>
		<td>�����Ͻ�</td>
		<td>��ǥ�� ������ȣ</td>
		<td>���űݾ�</td>
		<td>����</td>
		<td>���</td>
	</tr>
	<c:forEach items="${listPur}" var="listPur" varStatus="var">
	<tr onmouseover='this.style.backgroundColor="#FAED7D";' onmouseout='this.style.backgroundColor="white";'>
		<td align="center">${var.count }</td>
		<c:if test="${listPur.type == '�ºν�'}">
		<td align="center">������</td>
		</c:if>
		<c:if test="${listPur.type == '�¹���'}">
		<td align="center">����</td>
		</c:if>
		<td align="center">${listPur.round}ȸ��</td>	
		<td align="center">${listPur.reg_date}</td>
		<td align="center"><a href="/toto/purchase/listpurchasebill.to?type=${listPur.type}&productnum=${listPur.productnum}&round=${listPur.round}">${listPur.productnum}</a></td>
		<td align="right"><fmt:formatNumber value="${listPur.bet}" type="number" />��&nbsp;</td>
		
		<c:if test="${listPur.status == 0}">
		<td align="right">��ǥ��&nbsp;</td>
		</c:if>
		<c:if test="${listPur.status == 5}">
		<td align="right">���߽���&nbsp;</td>
		</c:if>
		<c:if test="${listPur.status == 4}">
		<td align="right">4�� (<fmt:formatNumber value="${listPur.price}" type="number" />��)&nbsp;</td>
		</c:if>
		<c:if test="${listPur.status == 3}">
		<td align="right">3�� (<fmt:formatNumber value="${listPur.price}" type="number" />��)&nbsp;</td>
		</c:if>
		<c:if test="${listPur.status == 2}">
		<td align="right">2�� (<fmt:formatNumber value="${listPur.price}" type="number" />��)&nbsp;</td>
		</c:if>
		<c:if test="${listPur.status == 1}">
		<td align="right">1�� (<fmt:formatNumber value="${listPur.price}" type="number" />}��)&nbsp;</td>
		</c:if>
		<c:if test="${listPur.status == 6}">
		<td align="right">���� (<fmt:formatNumber value="${listPur.price}" type="number" />��)&nbsp;</td>
		</c:if>
		<td align="center">
		<c:if test="${listPur.refund == 0 }">
		<c:if test="${listPur.status == 0}">
		<input type="button" value="ȯ �� �� û" onclick="location.href='/toto/purchase/refundMPro.to?productnum=${listPur.productnum}'">
		</c:if>
		</c:if>
		<c:if test="${listPur.refund == 1 }">
		ȯ�ҿ�û��
		</c:if>
		<c:if test="${listPur.refund == 2}">
		ȯ�ҿϷ�
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