<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<c:if test="${chk == -1 }">
<script>
alert("�Է��Ͻ� ȸ���� �����մϴ�.");
history.go(-1);
</script>
</c:if>
<c:if test="${chk == 0 }">
<script>
alert("�Է��� �Ϸ�Ǿ����ϴ�.");
location.href="/toto/buygame/inputForm.to";
</script>
</c:if>
</head>