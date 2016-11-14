<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����������</title>
</head>
<body>
<form method="post" action="/toto/game/modifyPro.to">
<input type="hidden" name="num" value="${gm.num}">


<table align="center" width="600" border="0">
	<tr align="left">
		<td>
			<font size="5"color="#FF7012">
				<c:out value="${gm.league}"/>
			</font>
			<font size="5">
				&nbsp;��� ���� ����</font>	&nbsp;&nbsp;
			</font>
			<img src="/toto/admin/image/content.gif" />
		</td>
	</tr>
	<tr>
		<td><img src="/toto/admin/image/line.png" width="730"/></td>
	</tr>
</table>
<br />

<table align="center" width="600" border="0">
	<tr align="center">
		<td>
			<font size="4">
				<c:out value="${gm.home}"/>
					<img src="/toto/game/image/vs.gif"/>
				<c:out value="${gm.away}"/>
			</font>
		</td>
	</tr>
</table>

<br />
<table align="center" border="1" width="600">
		<input type="hidden" name="team" value="��ü" />
		<input type="hidden" name="league" value="${gm.league}" />
		<input type="hidden" name="home" value="${gm.home}" />
		<input type="hidden" name="away" value="${gm.away}" />
	<tr align="center" bgcolor="#FAED7D">
		<td>����</td>
		<td>Ȩ</td>
		<td>�����</td>
	</tr>
	<tr align="center">
		<td>����</td>
		<td>
			<input type="text" size="4" name="homept" size="1" value="${gm.homept}">
		</td>
		<td>
			<input type="text" size="4" name="awaypt" size="1" value="${gm.awaypt}">
		</td>
	</tr>
<tr align="center">
<td>����</td>
<td>
	<select name="homesc">
		<option value="${gm.homesc}">${gm.homesc}</option>
		<option value="��">��</option>
		<option value="��">��</option>
		<option value="��">��</option>
	</select>
</td>
<td>
	<select name="awaysc">
		<option value="${gm.awaysc}">${gm.awaysc}</option>
		<option value="��">��</option>
		<option value="��">��</option>
		<option value="��">��</option>
	</select>
</td>
</tr>
<tr align="center">
<td>����</td>
<td colspan="2">�¹���&nbsp;
	<input type="text" size="5" name="win_rate" value="${gm.win_rate}">
&nbsp;&nbsp;
	������&nbsp;
	<input type="text" size="5" name="draw_rate" value="${gm.draw_rate}">
&nbsp;&nbsp;
	�й���&nbsp;
	<input type="text" size="5" name="lose_rate" value="${gm.lose_rate}">
</td>
</tr>
<tr align="center">
		<td>��� ��¥</td>
		<td colspan="2">
			<input type="text" size="8" name="dat" value="<fmt:formatDate value="${gm.reg_date}" pattern="yyyyMMdd"/>">ex)20150505
		</td>
</tr>
<tr align="center">
	<td>��� �ð�</td>
	<td colspan="2">
		<select name="hh" >
			<option value="<fmt:formatDate value="${gm.reg_date}" pattern="HH"/>"><fmt:formatDate value="${gm.reg_date}" pattern="HH"/></option>
			<option value="01">01</option>
			<option value="02">02</option>
			<option value="03">03</option>
			<option value="04">04</option>
			<option value="05">05</option>
			<option value="06">06</option>
			<option value="07">07</option>
			<option value="08">08</option>
			<option value="09">09</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
			<option value="22">22</option>
			<option value="23">23</option>
			<option value="24">24</option>
		</select>��&nbsp;
		<select name="min">
		<option value="<fmt:formatDate value="${gm.reg_date}" pattern="mm"/>"><fmt:formatDate value="${gm.reg_date}" pattern="mm"/></option>
			<option value="00">00</option>
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
			<option value="40">40</option>
			<option value="50">50</option>
		</select>��
	</td>
</tr>
<tr align="center">
	<td>��� ��Ȳ</td>
	<td colspan="2">
		<select name="flag">
			<option value="${gm.flag}">${gm.flag}</option>
			<option value="�����">�����</option>
			<option value="�������">�������</option>
		</select>
	</td>
</tr>
<tr>
	<td align="center" colspan="10">
		<input type="submit" value="Ȯ ��">&nbsp;&nbsp;
		<input type="button" value="�� ��" onclick="history.go(-1);">&nbsp;&nbsp;
	</td>
</tr>
</table>
</form>
</body>
</html>