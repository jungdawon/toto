<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>����Ȯ��</title>
</head>
<body>
<form name="list" method="post" action="/toto/buygame/listGame.to">
<table border="1">
<tr>
	<td>
		<select name="game" onchange="">
			<c:if test="${selbuy.game!=null}">
			<option value="${selbuy.game }">${selbuy.game }</option>
			</c:if>
			<option value="������">������</option>
			<option value="����">����</option>
		</select>
	
	 </td>
				<td><input type="submit" value="Ȯ ��"></td>
			</tr>
</table>
</form>	
</body>
</html>