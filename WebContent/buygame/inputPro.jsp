<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<c:if test="${chk == -1 }">
<script>
alert("입력하신 회차가 존재합니다.");
history.go(-1);
</script>
</c:if>
<c:if test="${chk == 0 }">
<script>
alert("입력이 완료되었습니다.");
location.href="/toto/buygame/inputForm.to";
</script>
</c:if>
</head>