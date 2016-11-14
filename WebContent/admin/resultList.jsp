<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="/toto/admin/payList.to" method="post">
	<table border="1" align="center">
		<tr align="center">
			<td>
				<select name="league">
					<option value="K리그">K리그</option>
					<option value="KBO">KBO</option>
					<option value="KBL">KBL</option>
				</select>
			</td>
		</tr>
	</table>
</form>


<table border="1" align="center">
	<tr align="center">
		<td>종목</td>
		<td>게임명</td>
		<td>경기</td>
		<td>회차</td>
		<td>상태</td>	
		<td>결과 보기</td>
	</tr>
	<c:forEach var="endlist" items="${endlist}" >
		<tr>
			<td>${endlist.game}</td>
			<td>${endlist.type}</td>
			<td>${endlist.league}</td>
			<td>${endlist.round}</td>
			<td>${endlist.flag}</td>
			<td>결과보기</td>
		</tr>
	</c:forEach>
</table>