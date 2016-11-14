<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:out value="${league}" /> 
<c:if test="${league eq 'K¸®±×' }">
	<c:redirect url="/game/gameListMonth.to?league=K%B8%AE%B1%D7&team=%C0%FC%C3%BC"></c:redirect>
</c:if>

<c:if test="${league eq 'KBO' }">
	<c:redirect url="/game/gameListMonth.to?league=KBO&team=%C0%FC%C3%BC"></c:redirect>
</c:if>

<c:if test="${league eq 'KBL' }">
	<c:redirect url="/game/gameListMonth.to?league=KBL&team=%C0%FC%C3%BC"></c:redirect>
</c:if>