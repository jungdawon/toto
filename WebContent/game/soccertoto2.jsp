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
1.���Ź�� <br /> <br />
<img src="/toto/game/txt_soccer04.gif" /><br /><br />
2.������ǥ�� �����ϱ�<br /> <br />
<img src="/toto/game/soccerResult_gude0101.gif" /><br /> <br />
3.����/��ǥ��Ȳ Ȯ���� �����ϱ�<br /><br />
<img src="/toto/game/soccerResult_gude0201.gif" /><br /> <br />
4.������ ���� Ȯ��      <br /><br />
<img src="/toto/game/soccerResult_gude0300.gif" /><br /> 
</td>
</tr>
</table>
����/��ǥ��Ȳ Ȯ���� �����ϱ�
