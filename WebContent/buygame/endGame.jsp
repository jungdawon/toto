<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="subMenu.jsp" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if> --%>
<br />
<br />
<br />

<script type="text/javascript">
function EndbuyGame(type,round,league){
	var url="/toto/buygame/targetGame.to?type="+type+"&round="+round+"&league="+league;
	 window.open(url, "proto", 
     "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=450, height=400");
	
}
</script>

<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 150px;
	width: 1150px;}
</style>
<body>
<div id="text">

<center>
<div id="endForm">
	<jsp:include page="/buygame/endForm.to" flush="false"/>
</div>
</center>
<table align="center" border="0">
<tr>
<td>
	<div style="height:250px; overflow:auto">
<table align="center" border="1">
	<tr bgcolor="#E7E7E7">
		<td align="center">����</td>
		<td align="center">����</td>
		<td align="center">���Ӹ�</td>
		<td align="center">ȸ��</td>
		<td align="center">����⺸��</td>
		<td align="center">ȸ�������Ͻ�</td>
		<td align="center">����</td>
		<td align="center">���߰��</td>
	</tr>
	<c:forEach items="${endgame}" var="endbuy">
	<tr>
		<td align="center">${endbuy.game }</td>
		<c:if test="${endbuy.league != null  }">
		<td align="center">${endbuy.league }</td>
		</c:if>
		<c:if test="${endbuy.league == null  }">
		<td align="center">��ü</td>
		</c:if>
		<td align="center">${endbuy.type }</td>	
		<td align="center">${endbuy.round }ȸ��</td>
		<td align="center"><img border="0" src="/toto/images/gameview.gif" onclick="EndbuyGame('${endbuy.type}','${endbuy.round}','${endbuy.league}')"/></td>
		<td align="center"><fmt:formatDate value="${endbuy.end_date}" pattern="yy��MM��dd��  HH:mm"/></td>
		<td align="center">${endbuy.flag}</td>
		<td align="center">
		<c:if test="${endbuy.flag=='�߸Ÿ���'}">
		��ǥ��
		</c:if>
		<c:if test="${endbuy.flag=='�����ǥ'}">
		<a href="/toto/buygame/resultGameWin.to?type=${endbuy.type }&round=${endbuy.round}&league=${endbuy.league}">
		<img border="0" src="/toto/images/title/viewdetail01.gif"/></a>
		</c:if>
		</td>
	</tr>
	</c:forEach>
</table> 
</div>
</td>
</tr>
</table><br/><br/><br/><br/>
<table align="center">
<tr>
<td align="center">
<!-- <input type="button" value="���Ű��ɰ��Ӻ���" onclick="location.href='/toto/buygame/buyableGame.to'"> -->
<a href="/toto/buygame/buyableGame.to"><img border="0" src="/toto/images/title/buygamView.gif"/></a>
</td>
</tr>
</table>
</div>