<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />
<c:if test="${userCheck==1 }">
	<c:redirect url="/top/main.to?local=Notice"/>
</c:if>
<c:if test="${userCheck==0}">
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
</c:if>
<c:if test="${userCheck==-1}">
	<script>
	  alert("아이디가 맞지 않습니다..");
	  history.go(-1);
	</script>
</c:if>	