<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<div id="gInputForm">
<form action="/toto/game/gameInput.to" method="post">
<table>
<tr>
<td>����</td>
<td>
	<select name="league">
		<option value="${dto.league }">${dto.league }</option>
		<option value="K����">K����</option>
		<option value="KBO">KBO</option>
		<option value="KBL">KBL</option>
	</select>
</td>
<td><input type="submit" value="Ȯ��"></td>
</tr>
</table>
</form>
</div>
</body>
</html>