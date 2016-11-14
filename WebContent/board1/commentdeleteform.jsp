<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form method="post"  action="/toto/board1/commentdeletepro.to">
	<table align="center">
			<input type="hidden" name="keynum" value="${keynum}"/>
			<input type="hidden" name="num" value="${num}"/>
			<input type="hidden" name="pageNum" value="${pageNum}"/>
			<input type="hidden" name="local" value="${local}"/>
			
			비밀번호:<input type="password" name="pw" size="5"/>
			<input type="submit" value="삭제" />
	</table>
</form>