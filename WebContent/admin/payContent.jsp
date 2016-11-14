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
		<td>방식</td>
		<td>리그</td>
		<td>회차</td>
		<td>경기일시</td>	
		<td>1등 인원수</td>
		<td>1등 금액</td>
		<td>2등 인원수</td>
		<td>2등 금액</td>
		<td>3등 인원수</td>
		<td>3등 금액</td>
		<td>4등 인원수</td>
		<td>4등 금액</td>
		<td>판매 금액</td>
		<td>지출 금액</td>
	</tr>
</table>