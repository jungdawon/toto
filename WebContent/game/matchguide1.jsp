<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/game/subMenu1.jsp" %>         
<%-- <br />
<br />
<br /> 
<c:if test="${gamebar ne null}" >
		<jsp:include page="${gamebar}"/>
</c:if>
<c:if test="${gamebar2 ne null}" >
		<jsp:include page="${gamebar2}"/>
</c:if>
<br />
<br />
<br /> --%>
<style type="text/css">
#proto1 {
		position: relative;
		left: 25%;
		
	}
</style>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>
<div id="text">

<table id="proto1">
<tr>
<td><br /><br />
<font size="5" color="#0054FF">1.구매방법</font>
<br /> <br />
<img src="/toto/game/image/1.gif" /><br /><br />
</td>
</tr>

<tr><td>
<font size="5" color="#0054FF">2.구매 기입하기</font><br /> <br />
<img src="/toto/game/image/2.gif" /><br /> <br />
</td></tr>

<tr><td>
<font size="5" color="#0054FF">3.구매 완료</font><br /><br />
<img src="/toto/game/image/3.png" /><br /><br /><br /> 
<img src="/toto/game/image/4.png" /><br />             
</td></tr>
</table>
</div>

