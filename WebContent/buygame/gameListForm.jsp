<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style>
#gameListForm
</style>
<head>
<title>��������Ȯ��</title>
</head>
<body>
<div id="buygameListForm">
<form name="checkstat" method="post" action="/toto/buygame/gameListMonth.to">
	<select name="game" onchange="">
		<c:if test="${selg.game != null}">
		<option value="${selg.game}">${selg.game}</option>
		</c:if>
		<option value="������">������</option>
		<option value="����">����</option>	
		<option value="��ü">��ü</option>
	</select>&nbsp;&nbsp;
	�Ⱓ����
	<select name="yy" onchange="">
		<c:if test="${selg.yy != null}">
		<option value="${selg.yy}">${selg.yy}��</option>
		</c:if>
		<option value="2015">2015��</option>
		<option value="2014">2014��</option>
	</select>&nbsp;&nbsp;
	<select name="mm" onchange="">
		<c:if test="${selg.mm != null}">
			<c:if test="${selg.mm == '��ü'}">
			<option value="��ü">��ü</option>
			</c:if>
			<c:if test="${selg.mm != '��ü'}">
			<option value="${selg.mm}">${selg.mm}��</option>
			</c:if>
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
		<option value="��ü">��ü</option>
	</select>&nbsp;&nbsp;
	<input type="submit" value="Ȯ ��" >
</form>
</div>
</body>
</html>