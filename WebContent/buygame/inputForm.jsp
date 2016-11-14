<%@ page language="java" contentType="text/html; charset=EUC-KR"pageEncoding="EUC-KR"%>
<%@include file="/admin/resultMenu.jsp" %>
<br />
<br />
<br />    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>경기입력</title>
</head>
<body>	
<table align="center">
<tr><td bgcolor=""><h2>프로토입력</h2></td><td></td><td bgcolor=""><h2>토토입력</h2></td></tr>
<tr>
<td>
<form method="post" action="/toto/buygame/inputPro2.to" name="input1">
	<table>
	<tr>
	<br />
	<td><font color="red">회차</font></td><td><input type="text" size="7" name="round"></td>
	</tr>
	<tr>
	<td><font color="blue">시작 경기번호</font></td><td><input type="text" size="7" name="Gnum3"></td>
	</tr>
	<tr>
	<td align="right" colspan="2">
	<br /><br />
	<input type="IMAGE" src="/toto/buygame/image/register.gif" value="입 력">
	&nbsp;&nbsp;</td>
	</tr>
	</table>
</form>
</td>
<td width="80"></td>
<td>
<form method="post" action="/toto/buygame/inputPro.to" name="input2">
	<table>
	<tr>
	<br /><td>&nbsp;&nbsp;&nbsp;<font color="red">회차</font></td><td><input type="text" size="7" name="round"></td>
	</tr>
	<tr>
	<td>&nbsp;&nbsp;&nbsp;<font color="#FF7012">리그</font></td>
	<td>
	<select name="league">
		<option value="">선택</option>
		<option value="K리그">K리그</option>
		<option value="KBO">KBO</option>
		<option value="KBL">KBL</option>
	</select>
	</td>
	</tr>
	<tr>
	<td>&nbsp;&nbsp;&nbsp;<font color="blue">시작 경기번호</font></td><td><input type="text" size="7" name="Gnum3"></td>
	</tr>
	<tr>
	<td align="right" colspan="7">
	<br />
	<input type="IMAGE" src="/toto/buygame/image/register.gif" value="입 력">
	&nbsp;&nbsp;</td>
	</tr>
	</table>
</form>
</td>
</tr>
</table>

</body>
</html>