<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if> --%>
<br />
<br />
<br />
<html>
<style>
#gameListForm
</style>
<head>
<title>�������Ȯ��</title>
</head>
<body>
<div id="gameListForm">
<form name="checkstat" method="post" action="/toto/game/gameListMonth.to">
	<input type="hidden" name="league" value="${selc.league}" />
	<table width="800" align="center" border="0">
	<tr height="30">
	<c:if test="${selc.league == 'K����' }">
	<td rowspan="2"><h3>�౸</h3></td>
	</c:if>
	<c:if test="${selc.league == 'KBO' }">
	<td  rowspan="2"><h3>�߱�</h3></td>
	</c:if>
	<c:if test="${selc.league == 'KBL' }">
	<td rowspan="2"><h3>��</h3></td>
	</c:if>
	<td></td>
	</tr>
	<tr height="30">
	<td></td><td><img border="0" src="/toto/game/image/tit_txtBase.gif"/></td>
	</tr>
	</table>
	<br>
	�Ⱓ����
	<select name="yy" onchange="">
		<c:if test="${selc.yy != null}">
		<option value="${selc.yy}">${selc.yy}��</option>
		</c:if>
		<option value="2015">2015��</option>
		<option value="2014">2014��</option>
	</select>&nbsp;&nbsp;
	<select name="mm" onchange="">
		<c:if test="${selc.mm != null}">
		<option value="${selc.mm}">${selc.mm}��</option>
		</c:if>
		<option value="01">01��</option>
		<option value="02">02��</option>
		<option value="03">03��</option>
		<option value="04">04��</option>
		<option value="05">05��</option>
		<option value="06">06��</option>
		<option value="07">07��</option>
		<option value="08">08��</option>
		<option value="09">09��</option>
		<option value="10">10��</option>
		<option value="11">11��</option>
		<option value="12">12��</option>
	</select>&nbsp;&nbsp;
	������
	<select name="team">
		<c:if test="${selc.team != null}">
		<option value="${selc.team}">${selc.team}</option>
		</c:if>
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
		<option value="��ü">��ü</option>
	</select>
	<input type="submit" value="Ȯ ��" onclick="/toto/game/gameListForm.to">
</form>
</div>
</body>
</html>