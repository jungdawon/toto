<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/game/subMenu1.jsp" %>     

<br />
<br />
<br />
<c:if test="${gamebar ne null}" >
		<jsp:include page="${gamebar}"/>
</c:if>
<c:if test="${gamebar3 ne null}" >
		<jsp:include page="${gamebar3}"/>
</c:if>
<br />
<br />
<br />


<table align="center">
<tr>
<td><br /><br />
1.구매방법 <br /> <br />
<img src="/toto/game/txt_soccer04.gif" /><br /><br />
2.구매투표지 기입하기<br /> <br />
<img src="/toto/game/soccerResult_gude0101.gif" /><br /> <br />
3.일정/투표현황 확실히 참고하기<br /><br />
<img src="/toto/game/soccerResult_gude0201.gif" /><br /> <br />
4.대상게임 정보 확인      <br /><br />
<img src="/toto/game/soccerResult_gude0300.gif" /><br /> 
</td>
</tr>
</table>
일정/투표현황 확실히 참고하기
