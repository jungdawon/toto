<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>대상경기</title>
</head>
<body>
<c:if test="${chk==0 }"> <!-- 프로토 -->
<table border="1" align="center">
<tr>
	<td rowspan="2" align="center">번호</td>
	<td rowspan="2" align="center">경기일</td>
	<td rowspan="2" align="center">경기시간</td>
	<td rowspan="2" align="center">홈팀 VS 원정팀</td>
	<td colspan="3" align="center">배당률</td>
	<td colspan="2" align="center">프로토결과</td>
</tr>
<tr>
	<td align="center">승</td>
	<td align="center">무</td>
	<td align="center">패</td>
	<td align="center">경기결과</td>
	<td align="center">적중결과</td>
</tr>
<c:forEach items="${proto }" var="proto">
<TR>
	<td align="center">${proto.num }</td>
	<td align="center"><fmt:formatDate value="${proto.reg_date}" pattern="yy년MM월dd일 "/></td>
	<td align="center"><fmt:formatDate value="${proto.reg_date}" pattern="HH:mm"/></td>
	<td align="center">${proto.home } VS ${proto.away }</td>
	<td align="center">${proto.win_rate }</td>
	<td align="center">${proto.draw_rate }</td>
	<td align="center">${proto.lose_rate }</td>
	<td align="center">${proto.homept } VS ${proto.awaypt }</td>
	<td align="center">${proto.homesc}</td>
</TR>
</c:forEach>

</table>
</c:if>

<c:if test="${chk==1 }"> <!-- 토토 -->
<table border="1" align="center">
<tr>
	<td rowspan="2" align="center">번호</td>
	<td rowspan="2" align="center">경기일</td>
	<td rowspan="2" align="center">경기시간</td>
	<td align="center">대상경기</td>	
	<td colspan="2" align="center">경기결과</td>
	<td rowspan="2" align="center">토토결과</td>	
</tr>
<tr>
	<td align="center">홈팀 VS 원정팀</td>
	<td align="center">홈팀</td>
	<td align="center">원정팀</td>
</tr>
<c:forEach items="${toto }" var="toto">
<TR>
	<td align="center">${toto.num }</td>
	<td align="center"><fmt:formatDate value="${toto.reg_date}" pattern="yy년MM월dd일 "/></td>
	<td align="center"><fmt:formatDate value="${toto.reg_date}" pattern="HH:mm "/></td>
	<td align="center">${toto.home} VS ${toto.away }</td>
	<td align="center">${toto.homept}</td>
	<td align="center">${toto.awaypt}</td>
	<td align="center">${toto.homesc}</td>
	
</TR>
</c:forEach>
</table>
</c:if>
</br>
<table align="center">
<tr>
<td align="center">
<input type="button" value="목록가기" onclick="history.go(-1);">
</tr>
</table>
</body>
</html>