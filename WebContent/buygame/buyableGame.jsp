<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="subMenu.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<br />
<br />
<br />
<html>
<head>
<title>구매가능 게임</title>
<script type="text/javascript">
function TagProto(type,round){
	var url="/toto/buygame/targetGame.to?type="+type+"&round="+round;
	 window.open(url, "proto", 
     "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=480, height=400");
	
}
function TagToto(type,round,league){
	var url="/toto/buygame/targetGame.to?type="+type+"&round="+round+"&league="+league;
	 window.open(url, "toto", 
     "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=350, height=430");
	
}

</script>
<style type="text/css">
	#p1 {
		position: relative;
		left: 44%;
		
	}
	
	#p2{
		position: relative;
		left: 25%;
	}
	
	#p3{
		position: relative;
		left: 25%;
	
	}
</style>

</head>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 150px;
	width: 1150px;}
</style>
<body>
<div id="text">


<h2 id="p1">구매가능 게임</h2>
<h1 class="h1" id="p2">
 <img src="/toto/images/proto.gif"/>
 </h1>
 
 


<table border="1" align="center">
<tr bgcolor="#E7E7E7">
<td align="center" width="90">종목</td>
<td align="center" width="60">게임명</td>
<td align="center" width="50">회차</td>
<td align="center" width="70">대상경기</td>
<td align="center" width="420">회차마감일시</td>
<td align="center" width="80">게임구매</td>
</tr>
<c:if test="${empty proto}">
<tr><td colspan="6" style="text-align: center;">구매가능 경기가 없습니다.</td></tr>
</c:if>
<c:if test="${not empty proto}">
<c:forEach items="${proto }" var="proto">
<tr>
<td align="center">${proto.game }</td>
<td align="center">${proto.type }</td>
<td align="center">${proto.round }</td><!-- 회차 : round 타입 : 승부식 ,승무패 -->
<td align="center"><img border="0" src="/toto/images/gameview.gif" onclick="TagProto('${proto.type}','${proto.round}')"/></td>
<td align="center"><fmt:formatDate value="${proto.end_date}" pattern="yyyy년MM월dd일 HH:mm"/></td>
<td align="center"><a href="/toto/proto/gameBuy.to?type=${proto.type }&round=${proto.round}"><img border="0" src="/toto/images/buygame.gif"/></a></td>
</tr>
</c:forEach>
</c:if>
</table>

<h2 class="h2" id="p3">
	<img src="/toto/images/toto.gif"/>
</h2>

<table border="1" align="center" >
<tr bgcolor="#E7E7E7">
<td align="center">종목</td>
<td align="center">리그</td>
<td align="center">게임명</td>
<td align="center">회차</td>
<td align="center">대상경기</td>
<td align="center">회차마감일시</td>
<td align="center">총발매금액</td>
<td align="center">1등 총 적중예상금액</td>
<td align="center">게임구매</td>
</tr>
<c:if test="${empty toto}">
<tr><td colspan="9" style="text-align: center;">구매가능 경기가 없습니다.</td></tr>
</c:if>
<c:if test="${not empty toto}">
<c:forEach items="${toto}" var="toto" varStatus="var">
<tr>
<td align="center" width="50">${toto.game }</td>
<td align="center" width="60">${toto.league }</td>
<td align="center" width="60">${toto.type }</td>
<td align="center" width="50">${toto.round }</td>
<td align="center" width="70"><img border="0" src="/toto/images/gameview.gif" onclick="TagToto('${toto.type}','${toto.round}','${toto.league}')"/></td>
<td align="center" width="180"><fmt:formatDate value="${toto.end_date}" pattern="yyyy년MM월dd일 HH:mm"/></td>
<td align="center" width="90">
	<c:if test="${var.count ==1 }">
		<fmt:formatNumber value="${dto.sumX}" type="number"/>원
	</c:if>
	<c:if test="${var.count ==2 }">
		<fmt:formatNumber value="${dto.sumY}" type="number"/>원
	</c:if>
	<c:if test="${var.count ==3 }">
		<fmt:formatNumber value="${dto.sumZ}" type="number"/>원
	</c:if>
	<c:if test="${var.count ==4 }">
		<fmt:formatNumber value="${dto.sumV}" type="number"/>원
	</c:if>
	<c:if test="${var.count ==5 }">
		<fmt:formatNumber value="${dto.sumW}" type="number"/>원
	</c:if>
</td>
<td align="center" width="150">
	<c:if test="${var.count ==1 }">
		<fmt:formatNumber value="${dto.sumX/4}" type="number"/>원
	</c:if>
	<c:if test="${var.count ==2 }">
		<fmt:formatNumber value="${dto.sumY/4}" type="number"/>원
	</c:if>
	<c:if test="${var.count ==3 }">
		<fmt:formatNumber value="${dto.sumZ/4}" type="number"/>원
	</c:if>
	<c:if test="${var.count ==4 }">
		<fmt:formatNumber value="${dto.sumV/4}" type="number"/>원
	</c:if>
	<c:if test="${var.count ==5 }">
		<fmt:formatNumber value="${dto.sumW/4}" type="number"/>원
	</c:if>
</td>
<td align="center" width="80"><a href="/toto/proto/gameBuy.to?type=${toto.type }&round=${toto.round}&league=${toto.league}"><img border="0" src="/toto/images/buygame.gif"/></a></td>
</tr>
</c:forEach>
</c:if>
</table> <br/><br/><br/><br/>
<table align="center">
<tr>
<td align="center">
<!-- <input type="button" value="마감게임보기" onclick="location.href='/toto/buygame/endGame.to'"> -->
<a href="/toto/buygame/endGame.to"><img border="0" src="/toto/images/title/closeGame.gif"/></a>
</td>
</tr>
</table>
</div>
</body>
</html>