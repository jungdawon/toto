<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>����Ȯ��</title>
</head>
<body>
<center>
<div id="listForm">
	<jsp:include page="/buygame/listForm.to" flush="false"/>
</div>
</center>
<table align="center" border="1">
	<tr>
		<td align="center">����</td>
		<td align="center">���Ӹ�</td>
		<td align="center">ȸ�������Ͻ�</td>
		<td align="center">ȸ�������Ͻ�</td>
		<td align="center">�����ǥ��</td>
	</tr>
	<c:forEach items="${buygame}" var="selbuy">
	<tr>
		<td align="center">${selbuy.game }</td>
		<td align="center">${selbuy.type }${selbuy.round }ȸ��</td>
		<td align="center"><fmt:formatDate value="${selbuy.start_date}" pattern="yyyy��MM��dd�� HH:mm"/></td>
		<td align="center"><fmt:formatDate value="${selbuy.end_date}" pattern="yyyy��MM��dd�� HH:mm"/></td>
		<td align="center"><fmt:formatDate value="${selbuy.result_date}" pattern="yyyy��MM��dd�� HH:mm"/></td>
		<td>
			<input type="button" value="����" onclick="location.href='/toto/buygame/modifyForm.to?num=${selbuy.num}'">
			<input type="button" value="����" onclick="location.href='/toto/buygame/deletePro.to?num=${selbuy.num}'">
		</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>