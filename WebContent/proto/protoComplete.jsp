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
<title>���� �Ϸ�</title>
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
<!-- ���� ���н� -->
<c:if test="${chkSum == 0}">
<script>
	alert("�ش� ȸ�� ���űݾ��� 10������ �ʰ��Ͽ����ϴ�.");
</script>
<table align="center" border="0">
	<tr>
		<td align="center" colspan="2"><h1>���� �ݾ� �ʰ�</h1></td>
	<tr>
	<tr>
	<td>���� �ݾ� :</td><td align="right"><b>${bet}</b>��&nbsp;</td>
	</tr>
	<tr>
	<td>���� ���� �ݾ� :</td><td align="right"><b>${sum}</b>��&nbsp;</td>
	</tr>
	<tr>
	<td>���� ���� �ݾ� :</td><td align="right"><b>${100000 - sum}</b>��&nbsp;</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
		<input type="button" value="���ư���" onclick="chk();">&nbsp;
		<input type="button" value="�����ϱ�">
		</td>
	</tr>
</table>
</c:if>
<c:if test="${chk == 0 }">
<script>
	alert("��ġ���� �����մϴ�.");
</script>
<table align="center" border="0">
	<tr>
		<td align="center" colspan="2"><h1>���Ű� ��ҵǾ����ϴ�.</h1></td>
	<tr>
	<td>���� �ݾ� :</td><td align="right"><b>${bet}</b>��&nbsp;</td>
	</tr>
	<tr>
	<td>������ �ݾ� :</td><td align="right"><b>${lack}</b>��&nbsp;</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
		<input type="button" value="���ư���" onclick="chk();">&nbsp;
		<input type="button" value="�����ϱ�" onclick="chk2();">
		</td>
	</tr>
</table>
</c:if>
<!-- ���� ������ -->
<c:if test="${chk == 1 }">
<script>
	alert("���Ű� �Ϸ�Ǿ����ϴ�.");
</script>
<table align="center" border="0">
	<tr>
		<td align="center" colspan="2"><h1>���� �Ϸ�</h1></td>
	<tr>
	<td>���� �ݾ� :</td><td align="right"><b>${bet}</b>��&nbsp;</td>
	</tr>
	<tr>
	<td>�ܿ� ��ġ�� :</td><td align="right"><b>${change}</b>��&nbsp;</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
		<input type="button" value="�ٸ���⺸��" onclick="another();">&nbsp;
		<input type="button" value="���ų���Ȯ��" onclick="location.href='/toto/purchase/listPurchase.to';">
		</td>
	</tr>
</table>
</c:if>
</body>
</html>