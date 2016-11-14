<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />
<table border="1" width="800" align="center">
	<c:forEach var="soccerMatchList_5" items="${soccerMatchList_5}" >
		<tr align="center">
			<td>${soccerMatchList_5.home}</td>
			<td>${soccerMatchList_5.away}</td>
			<td>${soccerMatchList_5.reg_date}</td>
			<td><a href="/toto/gamebuy/soccerMatchView.to?num=${soccerMatchList_5.num}">상세정보</a></td>
		</tr>
	</c:forEach>
</table>