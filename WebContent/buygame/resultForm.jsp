<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>적중결과</title>
</head>
<body>
<h2>적중결과</h2>
<form name="list" method="post" action="/toto/buygame/resultGame.to">
<table border="1">
<tr>
	<td>
	<input type="submit" name="game" value="전체">
	<input type="submit" name="game" value="프로토">
	<input type="submit" name="game" value="토토">
	 </td>
</table>
<hr color="blue">	 
</form>	
</body>
</html>