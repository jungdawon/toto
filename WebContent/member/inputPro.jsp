<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>

<script type="text/javascript">
	alert("ȸ������ �Ǿ����ϴ�.");
	location.href='/toto/top/main.to?local=Notice';
</script>


<%-- <c:redirect url="/top/main.to?local=Notice"></c:redirect> --%>