<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/teaminfomation/teamMenu.jsp" %>
<br />
<br />
<br />
<html>
<head>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 230px;
	width: 1150px;}
  }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��������Է�</title>
</head>
<body>
<div id=text>
<br />
<br />
<br />
<br />
<table align="center" width="800" border="0">
	<tr align="left">
		<td>
			<font size="4">��� ����</font>	&nbsp;&nbsp;
			<img src="/toto/game/image/register.gif" />
		</td>
	</tr>
	<tr>
		<td><img src="/toto/admin/image/line.png" width="800"/></td>
	</tr>
</table>
<br />



<center>
	<div id="gInputForm">
		<jsp:include page="/game/gameInputForm.to" flush="false"/>
	</div>
</center>
<br />
<form method="post" action="/toto/game/gameInputPro.to">
<table align="center" border="1">
	<input type="hidden" name="league" value="${dto.league }">
	<c:if test="${dto.league == null }">
		<tr>
		<td colspan="2">�ظ��׸� �������ּ��� </td>
		</tr>
	</c:if>
	<c:if test="${dto.league == 'K����' }">
		<tr>
			<td bgcolor="#FAED7D" align="center">Ȩ��</td>
			<td>
				<select name="home">
					<option value="">����</option>
					<option value="����">����</option>	
					<option value="����">����</option>		
					<option value="����">����</option>
					<option value="����">����</option>
					<option value="����">����</option>
					<option value="����">����</option>
					<option value="��õ">��õ</option>
					<option value="����">����</option>
					<option value="����">����</option>
					<option value="���">���</option>
					<option value="�λ�">�λ�</option>
					<option value="����">����</option>
				</select>
			</td>
			<td bgcolor="#FAED7D" align="center">�������</td>
			<td>
				<select name="away">
					<option value="">����</option>
					<option value="����">����</option>	
					<option value="����">����</option>		
					<option value="����">����</option>
					<option value="����">����</option>
					<option value="����">����</option>
					<option value="����">����</option>
					<option value="��õ">��õ</option>
					<option value="����">����</option>
					<option value="����">����</option>
					<option value="���">���</option>
					<option value="�λ�">�λ�</option>
					<option value="����">����</option>
				</select>
			</td>
		</tr>
	</c:if>

<c:if test="${dto.league == 'KBO' }">
	<tr>
		<td bgcolor="#FAED7D" align="center">Ȩ��</td>
		<td>
			<select name="home">
				<option value="">����</option>
				<option value="�Ｚ">�Ｚ</option>	
				<option value="NC">NC</option>		
				<option value="�λ�">�λ�</option>
				<option value="�ؼ�">�ؼ�</option>
				<option value="��ȭ">��ȭ</option>
				<option value="KIA">KIA</option>
				<option value="SK">SK</option>
				<option value="�Ե�">�Ե�</option>
				<option value="LG">LG</option>
				<option value="KT">KT</option>
			</select>
		</td>
		<td bgcolor="#FAED7D" align="center">�������</td>
		<td>
			<select name="away">
				<option value="">����</option>
				<option value="�Ｚ">�Ｚ</option>	
				<option value="NC">NC</option>		
				<option value="�λ�">�λ�</option>
				<option value="�ؼ�">�ؼ�</option>
				<option value="��ȭ">��ȭ</option>
				<option value="KIA">KIA</option>
				<option value="SK">SK</option>
				<option value="�Ե�">�Ե�</option>
				<option value="LG">LG</option>
				<option value="KT">KT</option>
			</select>
		</td>
	</tr>
</c:if>

<c:if test="${dto.league == 'KBL' }">
	<tr>
		<td bgcolor="#FAED7D" align="center">Ȩ��</td>
		<td>
			<select name="home">
				<option value="">����</option>
				<option value="�����">�����</option>	
				<option value="����SK">����SK</option>		
				<option value="���ֵ���">���ֵ���</option>
				<option value="�λ�KT">�λ�KT</option>
				<option value="�Ⱦ�KGC">�Ⱦ�KGC</option>
				<option value="�������½�">�������½�</option>
				<option value="â��LG">â��LG</option>
				<option value="��õ���ڷ���">��õ���ڷ���</option>
				<option value="����Ｚ">����Ｚ</option>
				<option value="����KCC">����KCC</option>
			</select>
		</td>
		<td bgcolor="#FAED7D" align="center">�������</td>
		<td>
			<select name="away">
				<option value="">����</option>
				<option value="�����">�����</option>	
				<option value="����SK">����SK</option>		
				<option value="���ֵ���">���ֵ���</option>
				<option value="�λ�KT">�λ�KT</option>
				<option value="�Ⱦ�KGC">�Ⱦ�KGC</option>
				<option value="�������½�">�������½�</option>
				<option value="â��LG">â��LG</option>
				<option value="��õ���ڷ���">��õ���ڷ���</option>
				<option value="����Ｚ">����Ｚ</option>
				<option value="����KCC">����KCC</option>
			</select>
		</td>
	</tr>
</c:if>

<tr>
	<td bgcolor="#FAED7D" align="center">��⳯¥</td>
	<td colspan="3"><input type="text" name="dat" value="">ex)20150505</td>
</tr>

<tr>
	<td bgcolor="#FAED7D" align="center">���ð�</td>
	<td colspan="3">
		<select name="hh">
			<option value="">����</option>
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
		<option value="">����</option>
			<option value="00">00</option>
			<option value="15">10</option>
			<option value="30">20</option>
			<option value="15">30</option>
			<option value="30">40</option>
			<option value="30">50</option>
		</select>��
	</td>
</tr>

<tr>
	<td bgcolor="#FAED7D" align="center">����Ȳ</td>
	<td colspan="3">
		<select name="flag">
			<option value="">����</option>
			<option value="�����">�����</option>
			<option value="�������">�������</option>
		</select>
	</td>
</tr>

<tr>
	<td bgcolor="#FAED7D" align="center">����</td>
	<td >Ȩ ����&nbsp;
		<input type="text" name="homept" size="1">
	</td>
	<td colspan="2" >����� ����&nbsp;
		<input type="text" name="awaypt" size="1">
	</td>
</tr>

<tr>
	<td bgcolor="#FAED7D" align="center">����</td>
	<td>Ȩ&nbsp;
		<select name="homesc">
			<option value="">����</option>
			<option value="��">��</option>
			<option value="��">��</option>
			<option value="��">��</option>
		</select>
	</td>
	<td colspan="2">�����&nbsp;
		<select name="awaysc">
			<option value="">����</option>
			<option value="��">��</option>
			<option value="��">��</option>
			<option value="��">��</option>
		</select>
	</td>
</tr>

<tr>
	<td bgcolor="#FAED7D" align="center">����</td>
	<td colspan="3">
		&nbsp;&nbsp;�¹���&nbsp;
		<input type="text" name="win_rate" value="0.0">
	
		&nbsp;&nbsp;������&nbsp;
		<input type="text" name="draw_rate" value="0.0">
	
		&nbsp;&nbsp;�й���&nbsp;
		<input type="text" name="lose_rate" value="0.0">
	</td>
</tr>

<tr>
	<td align="center" colspan="10">
	<input type="submit" value="Ȯ ��">&nbsp;&nbsp;
	<input type="button" value="�� ��" onclick="history.go(-1);">
</tr>

</table>
</form>
</div>
</body>
</html>