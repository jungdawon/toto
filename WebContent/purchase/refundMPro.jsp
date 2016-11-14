<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${chk == 1 }">
<head>
<script>
alert("환불이 신청되었습니다.");
location.href='/toto/purchase/listPurchase.to';
</script>
</head>
</c:if>