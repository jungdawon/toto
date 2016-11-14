<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="subMenu.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if> --%>
<br />
<br />


<script type="text/javascript">
function GameList(type,round,league){
	var url="/toto/buygame/targetGame.to?type="+type+"&round="+round+"&league="+league;
	 window.open(url, "GameList", 
     "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=350, height=430");
	
}

</script>
<style type="text/css">
#text	{
		position: absolute;
		top: 150px;
		left: 150px;
		width: 1150px;
	}
	#tet1 {
		position: relative;
		left: 44%;
		
	}
</style>

<div id="text">
<h2 id="tet1">게임일정</h2>
</br>
<center>
<div id="buygameListForm">
	<jsp:include page="/buygame/gameListForm.to" flush="false"/>
</div>
</center>
<table align="center" border="1">
	<tr>
		<td align="center">종목</td>
		<td align="center">리그</td>
		<td align="center">게임명</td>
		<td align="center">발매일정</td>
		<td colspan="2" align="center">상태</td>
	</tr>
	</br>
	</br>
	<c:if test="${empty monG}">
	<tr><td colspan="9" align="center">검색된 경기가 없습니다.</td></tr>
	</c:if>
	<c:if test="${not empty monG}">
	<c:forEach items="${monG}" var="monG">
	<tr>
		<td align="center">${monG.game }</td>
		<c:if test="${monG.league != null  }">
		<td align="center">${monG.league }</td>
		</c:if>
		<c:if test="${monG.league == null  }">
		<td align="center">전체</td>
		</c:if>
		<td align="center">${monG.type } ${monG.round }회차 &nbsp;
		<img border="0" src="/toto/images/gameview.gif" onclick="GameList('${monG.type}','${monG.round}','${monG.league}')"/></td>
		<td align="center"><fmt:formatDate value="${monG.start_date}" pattern="yy-MM-dd HH:mm"/> ~
		<fmt:formatDate value="${monG.end_date}" pattern="yy-MM-dd HH:mm"/>
		</td>
		<c:if test="${monG.flag != '발매중'}">
		<td colspan="2" align="center">${monG.flag }</td>
		</c:if>
		<c:if test="${monG.flag == '발매중'}">
		<td width="80" align="center">${monG.flag }</td>
		<td width="90" align="center"><a href="/toto/proto/gameBuy.to?type=${monG.type }&round=${monG.round}&league=${monG.league}"><img border="0" src="/toto/images/buygame.gif"/></a></td>
		</c:if>
	</tr>
	</c:forEach>
	</c:if>
</table>
</div>