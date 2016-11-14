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
<title>�������Ӻ���</title>
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
		<td align="center">����</td>
		<td align="center">����</td>
		<td align="center">���Ӹ�</td>
		<td align="center">��ǥ��</td>
		<td align="center">���Ȯ��</td>
	</tr>
	<c:forEach items="${resultgame}" var="resultbuy">
	<tr>
		<td align="center">${resultbuy.game }</td>
		<c:if test="${resultbuy.league != null  }">
		<td align="center">${resultbuy.league }</td>
		</c:if>
		<c:if test="${resultbuy.league == null  }">
		<td align="center">��ü</td>
		</c:if>
		<td align="center">${resultbuy.type }${resultbuy.round }ȸ��</td>
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