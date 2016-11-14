<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>게임확인</title>
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
			<option value="프로토">프로토</option>
			<option value="토토">토토</option>
		</select>
	
	 </td>
				<td><input type="submit" value="확 인"></td>
			</tr>
</table>
</form>	
</body>
</html>