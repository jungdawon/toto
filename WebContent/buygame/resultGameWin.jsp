<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����</title>
</head>
<body>
<c:if test="${chk==0 }"> <!-- ������ -->
<table border="1" align="center">
<tr>
	<td rowspan="2" align="center">��ȣ</td>
	<td rowspan="2" align="center">�����</td>
	<td rowspan="2" align="center">���ð�</td>
	<td rowspan="2" align="center">Ȩ�� VS ������</td>
	<td colspan="3" align="center">����</td>
	<td colspan="2" align="center">��������</td>
</tr>
<tr>
	<td align="center">��</td>
	<td align="center">��</td>
	<td align="center">��</td>
	<td align="center">�����</td>
	<td align="center">���߰��</td>
</tr>
<c:forEach items="${proto }" var="proto">
<TR>
	<td align="center">${proto.num }</td>
	<td align="center"><fmt:formatDate value="${proto.reg_date}" pattern="yy��MM��dd�� "/></td>
	<td align="center"><fmt:formatDate value="${proto.reg_date}" pattern="HH:mm"/></td>
	<td align="center">${proto.home } VS ${proto.away }</td>
	<td align="center">${proto.win_rate }</td>
	<td align="center">${proto.draw_rate }</td>
	<td align="center">${proto.lose_rate }</td>
	<td align="center">${proto.homept } VS ${proto.awaypt }</td>
	<td align="center">${proto.homesc}</td>
</TR>
</c:forEach>

</table>
</c:if>

<c:if test="${chk==1 }"> <!-- ���� -->
<table border="1" align="center">
<tr>
	<td rowspan="2" align="center">��ȣ</td>
	<td rowspan="2" align="center">�����</td>
	<td rowspan="2" align="center">���ð�</td>
	<td align="center">�����</td>	
	<td colspan="2" align="center">�����</td>
	<td rowspan="2" align="center">������</td>	
</tr>
<tr>
	<td align="center">Ȩ�� VS ������</td>
	<td align="center">Ȩ��</td>
	<td align="center">������</td>
</tr>
<c:forEach items="${toto }" var="toto">
<TR>
	<td align="center">${toto.num }</td>
	<td align="center"><fmt:formatDate value="${toto.reg_date}" pattern="yy��MM��dd�� "/></td>
	<td align="center"><fmt:formatDate value="${toto.reg_date}" pattern="HH:mm "/></td>
	<td align="center">${toto.home} VS ${toto.away }</td>
	<td align="center">${toto.homept}</td>
	<td align="center">${toto.awaypt}</td>
	<td align="center">${toto.homesc}</td>
	
</TR>
</c:forEach>
</table>
</c:if>
</br>
<table align="center">
<tr>
<td align="center">
<input type="button" value="��ϰ���" onclick="history.go(-1);">
</tr>
</table>
</body>
</html>