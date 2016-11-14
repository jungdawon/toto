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
<title>구매 태스트</title>
</head>
<body>
<form method="post" action="/toto/proto/gameBuy.to">
	<select name="round">
		<option value="">게임선택</option>
		<option value="승부식">프로토 승부식</option>
		<option value="승무패">토토 승무패</option>
	</select>
	
	<input type="text" name="turn" size="3">회차
	<input type="submit" value="확인">
</form>
</body>
</html>