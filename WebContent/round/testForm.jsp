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
<title>���� �½�Ʈ</title>
</head>
<body>
<form method="post" action="/toto/proto/gameBuy.to">
	<select name="round">
		<option value="">���Ӽ���</option>
		<option value="�ºν�">������ �ºν�</option>
		<option value="�¹���">���� �¹���</option>
	</select>
	
	<input type="text" name="turn" size="3">ȸ��
	<input type="submit" value="Ȯ��">
</form>
</body>
</html>