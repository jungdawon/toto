<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/admin/resultMenu.jsp" %>
<br />
<br />
<br />
<style type="text/css">
	#vresult_1 {
		position: relative;
		left: 7%;
		
	}

</style>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>

<div id="text" >

<form method="post" action="/toto/proto/protoAAInto.to" name="protoAAPro">
<table align="center" border="0" id="vresult_1">
<tr><td><h2>��� �Է�</h2></td></tr>
<tr>
	<td>
	<table align="center" border="1">
		<tr align="center">	
			<td width="30">��ȣ</td>
			<td width="70">����ȣ</td>
			<td width="60">��ȸ��</td>
			<td width="190">Ȩ�� vs ������</td>
			<td>Ȩ ����</td>
			<td>���� ����</td>
		</tr>
		<c:forEach items="${pro}" var="pro" varStatus="v">
		<tr align="center" onmouseover='this.style.backgroundColor="#FAED7D";' onmouseout='this.style.backgroundColor="white";'>	
			<td>${v.count }</td>
			<td>${pro.num}</td>
			<td>${pro.league}</td>
			<td>${pro.home} vs ${pro.away}</td>
			<td><input type="text" name="homept${v.count }" value="0" size="1" maxlength="2" onkeyPress="if((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;"></td>
			<td><input type="text" name="awaypt${v.count }" value="0" size="1" maxlength="2" onkeyPress="if((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;"></td>
		</tr>
		<input type="hidden" name="num${v.count }" value="${pro.num }">
		</c:forEach>
	</table>
	</td>
</tr>
<tr><td colspan="6" align="right"><input type="submit" value="�� ��">&nbsp;&nbsp;</td></tr>
</table>
<input type="hidden" name="turn" value="${turn }">
<input type="hidden" name="type" value="${type }">
</form>
</div>