<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ ã��</title>
</head>
<body>

<c:if test="${check == 1}">
	<table width="470" align="center" border="0">
		<tr height="30">
		<td align="center"><h3><b>�� ��</b></h3></td>
		</tr>
		<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
		<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
		<tr height="30"><td>ȸ������ ��й�ȣ�� <b>[${pw }]</b> �Դϴ�.</td></tr>
		<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
		<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
		<tr height="30"><td align="center"><br/><input style="background-color: '#C2E2E8'; width: '50pt';" type="button" value="Ȯ ��" onclick="self.close()"></td></tr>
	</table>
</c:if>
<c:if test="${check == 0}">
	<script>
		alert("ȸ�������� ���� �ʽ��ϴ�.");
		self.close();
	</script>
</c:if>


</body>


</html>