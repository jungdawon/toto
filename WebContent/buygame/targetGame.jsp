<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if> --%>
<br />
<br />
<br />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap Core CSS -->
<link href="/toto/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/toto/css/landing-page.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/toto/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>대상경기</title>
<script type="text/javascript">
function clo(){ 
self.close();

}
</script>

</head>
<body>
<table align="center" border="0">
<tr>
<td>
	<div style="height:315px; overflow:auto">
<c:if test="${chk==0 }"> <!-- 프로토 -->
<table border="1" align="center">
<tr>
	<td align="center">경기번호</td>
	<td align="center">경기일</td>
	<td align="center">경기시간</td>
	<td align="center">홈팀 VS 원정팀</td>
</tr>
<c:forEach items="${proto }" var="proto">
<TR>
	<td align="center">${proto.num }</td>
	<td align="center"><fmt:formatDate value="${proto.reg_date}" pattern="yyyy.MM.dd "/></td>
	<td align="center"><fmt:formatDate value="${proto.reg_date}" pattern="HH:mm"/></td>
	<td align="center">${proto.home } VS ${proto.away }</td>
</TR>
</c:forEach>

</table>
</c:if>

<c:if test="${chk==1 }"> <!-- 토토 -->
<table border="1" align="center">
<tr>
	<td align="center">경기번호</td>
	<td align="center">경기일</td>
	<td align="center">경기시간</td>
	<td align="center">홈팀 VS 원정팀</td>
</tr>
<c:forEach items="${toto }" var="toto">
<TR>
	<td align="center">${toto.num }</td>
	<td align="center"><fmt:formatDate value="${toto.reg_date}" pattern="yyyy.MM.dd "/></td>
	<td align="center"><fmt:formatDate value="${toto.reg_date}" pattern="HH:mm "/></td>
	<td align="center">${toto.home} VS ${toto.away }</td>
</TR>
</c:forEach>
</table>
</c:if>
</br>
</div>
</td>
</tr>
</table>
<table align="center">
<tr>
<td align="center">
<input type="button" value="닫기" onclick="clo();">
</tr>
</table>
</body>
</html>