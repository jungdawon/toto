<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����Է�</title>
</head>
<body>
<form method="post" action="/toto/buygame/modifyPro.to">

<table align="center" border="1">
<tr>
<td>����</td>
<td>
	<select name="game">
		<option value="${bgm.game }">${bgm.game }</option>
		<option value="������">������</option>
		<option value="����">����</option>
	</select>
</td>
</tr>
<tr>
<td>����</td>
<td>
	<select name="league">
		<option value="">����</option>
		<option value="��ü">��ü</option>
		<option value="K����">K����</option>
		<option value="KBO">KBO</option>
		<option value="KBL">KBL</option>
	</select>
</td>
</tr>
<tr>
<td>���Ӽ���</td>
<td>
	<select name="type">
		<option value="${bgm.type }">${bgm.type }</option>
		<option value="�ºν�">�ºν�</option>
		<option value="�¹���">�¹���</option>
	</select>
</td>
</tr>
<tr>
<td>ȸ��</td>
<td><input type="text" name="round" value="${bgm.round}"></td>
</tr>
<tr>
<td>����</td>
<td>
	<select name="flag">
		<option value="${bgm.flag }">${bgm.flag }</option>
		<option value="�߸ſ���">�߸ſ���</option>
		<option value="�߸���">�߸���</option>
		<option value="�߸Ÿ���">�߸Ÿ���</option>
		<option value="������">������</option>
		<option value="�����ǥ">�����ǥ</option>
	</select>
</td>
</tr>
<tr>
<td>ȸ�� �����Ͻ�</td>
<td><input type="text" name="dat" value="<fmt:formatDate value="${bgm.start_date }" pattern="yyyyMMdd"/>"/>ex)20150505</td>
</tr>
<tr>
<td>�ð�</td>
<td>
	<select name="hh">
	<option value="<fmt:formatDate value="${bgm.start_date }" pattern="HH"/>">
		<fmt:formatDate value="${bgm.start_date }" pattern="HH"/></option>
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
	<option value="<fmt:formatDate value="${bgm.start_date}" pattern="mm"/>"><fmt:formatDate value="${bgm.start_date}" pattern="mm"/></option>
		<option value="00">00</option>
		<option value="15">15</option>
		<option value="30">30</option>
	</select>��
</td>
</tr>
<tr>
<td>ȸ�� �����Ͻ�</td>
<td><input type="text" name="dat2" value="<fmt:formatDate value="${bgm.end_date }" pattern="yyyyMMdd"/>"></td>
</tr>
<tr>
<td>�ð�</td>
<td>
	<select name="hh2">
	<option value="<fmt:formatDate value="${bgm.end_date }" pattern="HH"/>">
		<fmt:formatDate value="${bgm.end_date }" pattern="HH"/>
		</option>
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
	<select name="min2">
	<option value="<fmt:formatDate value="${bgm.end_date }" pattern="mm"/>"><fmt:formatDate value="${bgm.end_date }" pattern="mm"/></option>
		<option value="00">00</option>
		<option value="15">15</option>
		<option value="30">30</option>
	</select>��
</td>
</tr>

<tr>
<td>��� ��ǥ��</td>
<td><input type="text" name="dat3" value="<fmt:formatDate value="${bgm.result_date}" pattern="yyyyMMdd"/>"></td>
</tr>
<tr>
<td>�ð�</td>
<td>
	<select name="hh3">
		<option value="<fmt:formatDate value="${bgm.result_date }" pattern="HH"/>">
		<fmt:formatDate value="${bgm.result_date }" pattern="HH"/>
		</option>
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
	<select name="min3">
	<option value="<fmt:formatDate value="${bgm.result_date }" pattern="mm"/>"><fmt:formatDate value="${bgm.result_date }" pattern="mm"/></option>
		<option value="00">00</option>
		<option value="15">15</option>
		<option value="30">30</option>
	</select>��
</td>
</tr>



<tr>
<td align="center" colspan="10">
<input type="hidden" name="num" value="${bgm.num}">
<input type="submit" value="Ȯ ��">&nbsp;&nbsp;
<input type="button" value="�� ��" onclick="history.go(-1);">&nbsp;&nbsp;
<input type="button" value="�� ��" onclick="location.href='/toto/buygame/deletePro.to?num=${bgm.num}'">
</td>
</tr>
</table>

</form>

</body>
</html>