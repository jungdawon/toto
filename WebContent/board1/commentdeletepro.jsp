<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check eq 0}" >

	<script>
			alert("��й�ȣ�� �ٸ��ϴ�.");
	        history.go(-1);
	</script>
</c:if>

<c:if test="${check eq 1}" >
	<script>
			alert("��������");
			self.close();
	</script>
	<c:redirect url="/board1/content.to?num=${num}&pageNum=${pageNum}&local=${local}"></c:redirect>
</c:if>

