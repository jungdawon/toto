<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="subMenu.jsp" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if> --%>
<br />
<br />
<html>
<head>
<title>마감게임보기</title>
</head>
<body>
<center>
<div id="resultForm">
	<jsp:include page="/buygame/resultForm.to" flush="false"/>
</div>
</center>
<form  method="post" action="/toto/buygame/resultGameWin.to">
<table align="center" border="1">
	<tr>
		<td align="center">종목</td>
		<td align="center">리그</td>
		<td align="center">게임명</td>
		<td align="center">발표일</td>
		<td align="center">결과확인</td>
	</tr>
	<c:forEach items="${resultgame}" var="resultbuy">
	<tr>
		<td align="center">${resultbuy.game }</td>
		<c:if test="${resultbuy.league != null  }">
		<td align="center">${resultbuy.league }</td>
		</c:if>
		<c:if test="${resultbuy.league == null  }">
		<td align="center">전체</td>
		</c:if>
		<td align="center">${resultbuy.type }${resultbuy.round }회차</td>
		<td align="center"><fmt:formatDate value="${resultbuy.result_date}" pattern="yy-MM-dd"/>
		</td>
		<c:if test="${resultbuy.league == null  }">
		<td align="center">
		<a href="/toto/buygame/resultGameWin.to?type=${resultbuy.type }&round=${resultbuy.round}"/>
		<img border="0" src="/toto/images/resultwin.gif"/>	
		</td>
		</c:if>
		<c:if test="${resultbuy.league != null  }">
		<td align="center">
		<a href="/toto/buygame/resultGameWin.to?type=${resultbuy.type }&round=${resultbuy.round}&league=${resultbuy.league}"/>
		<img border="0" src="/toto/images/resultwin.gif"/>	
		</td>
		</c:if>
	</tr>
	</c:forEach>
</table>
</form>
</body>
</html>