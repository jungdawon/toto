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
		<td>���</td>
		<td>����</td>
		<td>ȸ��</td>
		<td>����Ͻ�</td>	
		<td>1�� �ο���</td>
		<td>1�� �ݾ�</td>
		<td>2�� �ο���</td>
		<td>2�� �ݾ�</td>
		<td>3�� �ο���</td>
		<td>3�� �ݾ�</td>
		<td>4�� �ο���</td>
		<td>4�� �ݾ�</td>
		<td>�Ǹ� �ݾ�</td>
		<td>���� �ݾ�</td>
	</tr>
</table>