<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<form method="post" action="/toto/purchase/listPurchase.to">
<table align="left" border="1">
<tr>
<td>��ȸ����</td>
<td>
<input type="radio" name="when" value="1"/>����
<input type="radio" name="when" value="2"/>1��
<input type="radio" name="when" value="3"/>15��
<input type="radio" name="when" value="4"/>1����
<input type="radio" name="when" value="5"/>3����
</td><td>&nbsp;<input type="submit" value="�� ��">&nbsp;</td>
</tr>
</table>
<c:if test="${sessionScope.memId!=null}">
	<input type="hidden" name="id" value="${sessionScope.memId}">
</c:if>
</form>
</body>
</html>