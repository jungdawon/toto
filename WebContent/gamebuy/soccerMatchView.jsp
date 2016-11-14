<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />

<c:set var="number" value="${0}" />


<table border="1" width="700" align="center">
	<tr align="center">
		<td>${dto.home} vs ${dto.away}</td>
		<td>0점</td>
		<td>1점</td>
		<td>2점</td>
		<td>3점</td>
		<td>4점</td>
		<td>5점</td>
	</tr>
	<c:set var="number2" value="${1}" />
	<tr align="center">
		<c:forEach var="matchList" items="${matchList}" >
				<c:if test="${number2 eq 1}" >
					<td align="center"><c:out value="${number}" />점</td>
				</c:if>
				<td align="center">
					${matchList.matchpoint}<br />
					투표수 : ${matchList.count}
				</td>
				<c:set var="number2" value="${number2 + 1}" />
					<c:if test="${number2 eq 7}" >
						<c:set var="number2" value="${1}" />
						<c:set var="number" value="${number + 1}" />
							<tr align="center">
							</tr>
					</c:if>
		</c:forEach>
	</tr>
</table>