<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="/toto/admin/payList.to" method="post">
	<table border="1" align="center">
		<tr align="center">
			<td>
				<select name="league">
					<option value="K����">K����</option>
					<option value="KBO">KBO</option>
					<option value="KBL">KBL</option>
				</select>
			</td>
		</tr>
	</table>
</form>


<table border="1" align="center">
	<tr align="center">
		<td>����</td>
		<td>���Ӹ�</td>
		<td>���</td>
		<td>ȸ��</td>
		<td>����</td>	
		<td>��� ����</td>
	</tr>
	<c:forEach var="endlist" items="${endlist}" >
		<tr>
			<td>${endlist.game}</td>
			<td>${endlist.type}</td>
			<td>${endlist.league}</td>
			<td>${endlist.round}</td>
			<td>${endlist.flag}</td>
			<td>�������</td>
		</tr>
	</c:forEach>
</table>