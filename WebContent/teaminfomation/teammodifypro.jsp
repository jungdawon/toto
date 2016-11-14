<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${count==2}">
<c:redirect url="/teaminfomation/teaminformationbaseball.to?league=${league}"></c:redirect>
</c:if>
<c:if test="${count==1}">
<c:redirect url="/teaminfomation/teaminformationbasketball.to?league=${league}"></c:redirect>
</c:if>
<c:if test="${count==3}">
<c:redirect url="/teaminfomation/teaminformation.to?league=K%B8%AE%B1%D7"></c:redirect>
</c:if>

