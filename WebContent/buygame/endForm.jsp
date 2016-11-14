<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>마감게임/적중결과</title>
</head>
<body>
<h2>마감게임/적중결과</h2>
<!-- <form name="list" method="post" action="/toto/buygame/endGame.to"> -->
<table border="1">
<tr>
	<!-- <td><input type="submit" name="game" value="전체"><img border="0" src="/toto/images/title/allbt.png"/></td> -->
	<!-- <td><input type="submit" name="game" value="프로토"><img border="0" src="/toto/images/title/probt.png"/></td> -->
	<!-- <td><input type="submit" name="game" value="토토"><img border="0" src="/toto/images/title/totobt.png"/></td> -->
	<td><a href="/toto/buygame/endGame.to?game=전체"><img border="0" src="/toto/images/title/allbt.png"/></a></td>
	<td><a href="/toto/buygame/endGame.to?game=프로토"><img border="0" src="/toto/images/title/probt.png"/></a></td>
	<td><a href="/toto/buygame/endGame.to?game=토토"><img border="0" src="/toto/images/title/totobt.png"/></a></td>
</tr>	
</table>
<br/>	 
<!-- </form>	 -->
</body>
</html>