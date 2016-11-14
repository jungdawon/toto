<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>게임확인</title>
</head>
<body>
<center>
<div id="listForm">
	<jsp:include page="/buygame/listForm.to" flush="false"/>
</div>
</center>
<table align="center" border="1">
	<tr>
		<td align="center">종목</td>
		<td align="center">게임명</td>
		<td align="center">회차시작일시</td>
		<td align="center">회차마감일시</td>
		<td align="center">결과발표일</td>
	</tr>
	<c:forEach items="${buygame}" var="selbuy">
	<tr>
		<td align="center">${selbuy.game }</td>
		<td align="center">${selbuy.type }${selbuy.round }회차</td>
		<td align="center"><fmt:formatDate value="${selbuy.start_date}" pattern="yyyy년MM월dd일 HH:mm"/></td>
		<td align="center"><fmt:formatDate value="${selbuy.end_date}" pattern="yyyy년MM월dd일 HH:mm"/></td>
		<td align="center"><fmt:formatDate value="${selbuy.result_date}" pattern="yyyy년MM월dd일 HH:mm"/></td>
		<td>
			<input type="button" value="수정" onclick="location.href='/toto/buygame/modifyForm.to?num=${selbuy.num}'">
			<input type="button" value="삭제" onclick="location.href='/toto/buygame/deletePro.to?num=${selbuy.num}'">
		</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>