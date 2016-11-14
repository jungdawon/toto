<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/game/subMenu.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if> --%>
<br />
<br />
<br />
<style type="text/css">
	#te1 {
		position: relative;
		left: 17%;
		
	}
	#te2 {
		position: relative;
		left: 17%;
		
	}
	#te3 {
		position: relative;
		left: 17%;
		
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
<table align="center"  width="750">
<tr><td>
<img src="/toto/teaminfomation/image/tit_soccer_01.gif" />&nbsp;&nbsp;
<img src="/toto/teaminfomation/image/btn_teaminfo.gif" />&nbsp;&nbsp;
<img src="/toto/teaminfomation/image/tit_txtSoccer.gif" />
</td></tr>
</table>
<br />
<c:if test="${topteamlist ne null}" >
		<jsp:include page="${topteamlist}"/>
</c:if>
<table align="center"  width="750">
<tr><td>
<c:forEach var="teamlist" items="${teamlist}">
 <font size="6" color="#FF007F">${teamlist.teamname}</font>
</c:forEach>
</td></tr>
</table>

<c:if test="${sessionScope.memId ne null && sessionScope.memId eq 'admin'}">
 <center>
 <input type="button" value="글수정" onclick="document.location.href='/toto/teaminfomation/teammodifyform.to?teamname=${teamname}&league=${league}'">
 <input type="button" value="글삭제" onclick="document.location.href='/toto/teaminfomation/teamdelete.to?teamname=${teamname}'">
</center>
</c:if>
<c:set var="team" value="${team}"/>
<table border=1 width=80% height=30% id="te1">
<c:forEach var="teamlist" items="${teamlist}">
<tr align=center>
<td width=30%>
     <img src="/toto/up/${teamlist.logo}" width="300" height="170" >
</td>
<td align=center bgcolor="#F8FFFF">
<font color="#FF7012">연고지:</font> ${teamlist.hometown}<br /><br />
<font color="#FF7012">홈구장:</font> ${teamlist.homeground}<br /><br />
<font color="#FF7012">감독:</font> ${teamlist.coach}
</td>
<td width=40% align=center bgcolor="#F8FFFF">
<font color="#FF7012">현재 순위:</font> ${dto.var}위<br /><br />
<font color="#FF7012">주요성적:</font> ${teamlist.grade}<br/><br/>
<font color="#FF7012">공식 홈페이지:</font><a href="${teamlist.homepage}">${teamlist.homepage}</a>
</td>
</tr>
</c:forEach>
</table>


	<table border=1 width=80% id="te2">
	 <tr align=center bgcolor="#E7E7E7">
	 <td rowspan=2>순위</td>
	 <td rowspan=2>홈/원정</td>
	 <td rowspan=2>경기수</td>
	 <td colspan=3>성적</td>
	 <td rowspan=2>승점</td>
	 <td rowspan=2>승률</td>
	 <td colspan=2>득점</td>
	 <td colspan=2>실점</td>
	 </tr>
	 
	 <tr align=center bgcolor="#E7E7E7">
	 <td>승</td>
		 <td>무</td>
		 <td>패</td>
		 <td>전체</td>
		 <td>평균</td>
		 <td>전체</td>
		 <td>평균</td> 
	 </tr>
	 
	 <tr border=1 align=center>
		 <td  rowspan=3><font color="red">${dto.var}위</font></td>
		 <td>전체</td>	 
		 <td>${dto.hwin+dto.hdraw+dto.hlose+dto.awin+dto.adraw+dto.alose}</td>
		 <td>${dto.hwin+dto.awin}</td>
		 <td>${dto.hdraw+dto.adraw}</td>
		 <td>${dto.hlose+dto.alose}</td>
		 <td>${(dto.hwin*3)+dto.hdraw+(dto.awin*3)+dto.adraw}</td>
		 <td><fmt:formatNumber value="${(dto.hwin+dto.awin)/(dto.hwin+dto.hdraw+dto.hlose+dto.awin+dto.adraw+dto.alose)*100}" pattern="0.0" /></td>
		 <td>${dto.homept+dto.awaypt}</td>
		 <td><fmt:formatNumber value="${(dto.homept+dto.awaypt)/(dto.hwin+dto.hdraw+dto.hlose+dto.awin+dto.adraw+dto.alose)}" pattern="0.00" /></td>
		 <td>${dto.hlpt+dto.alpt}</td>
		 <td><fmt:formatNumber value="${(dto.hlpt+dto.alpt)/(dto.hwin+dto.hdraw+dto.hlose+dto.awin+dto.adraw+dto.alose)}" pattern="0.00" /></td>
	 </tr>

	 <tr border=1 align=center>
		 <td>홈</td>
		 <td>${dto.hwin+dto.hdraw+dto.hlose}</td>
		 <td>${dto.hwin}</td>
		 <td>${dto.hdraw}</td>
		 <td>${dto.hlose}</td>
		 <td>${(dto.hwin*3)+dto.hdraw}</td>
		 <td><fmt:formatNumber value="${dto.hwin/(dto.hwin+dto.hdraw+dto.hlose)*100}" pattern="0.00" /></td>
		 <td>${dto.homept}</td>
		 <td><fmt:formatNumber value="${dto.homept/(dto.hwin+dto.hdraw+dto.hlose)}" pattern="0.00" /></td>
		 <td>${dto.hlpt}</td>
		 <td><fmt:formatNumber value="${dto.hlpt/(dto.hwin+dto.hdraw+dto.hlose)}" pattern="0.00" /></td>
	 </tr>
	 <tr border=1 align=center>
		 <td>원정</td>
		 <td>${dto.awin+dto.adraw+dto.alose}</td>
		 <td>${dto.awin}</td>
		 <td>${dto.adraw}</td>
		 <td>${dto.alose}</td>	 
		 <td>${(dto.awin*3)+dto.adraw}</td>
		 <td><fmt:formatNumber value="${dto.awin/(dto.awin+dto.adraw+dto.alose)*100}" pattern="0.00" /></td>
		 <td>${dto.awaypt}</td>
		 <td><fmt:formatNumber value="${dto.awaypt/(dto.awin+dto.adraw+dto.alose)}" pattern="0.00" /></td>
		 <td>${dto.alpt}</td>
		 <td><fmt:formatNumber value="${dto.alpt/(dto.awin+dto.adraw+dto.alose)}" pattern="0.00" /></td>
	 </tr>
 </table>
<br />
 <c:if test="${midteamlist ne null}" >
		<jsp:include page="${midteamlist}"/>
</c:if>

 <table border=1 width=80% id="te3">
 <tr align="center" bgcolor="#E7E7E7">
	 <td>번호</td>
	 <td>경기일자</td>
	 <td>홈/원정</td>
	 <td>팀명</td>
	 <td>결과</td>
	 <td>득점</td>
	 <td>실점</td>
 </tr>
 
 <c:forEach var="recentlist" items="${recentlist}" varStatus="a">
<tr align="center" >
	 <td rowspan=2>${a.count}경기</td>
	 <td rowspan=2><fmt:formatDate value="${recentlist.reg_date}" pattern="yyyy년MM월dd일" /></td>
	 <td bgcolor="#E6FFFF">홈</td>
	 <td bgcolor="#E6FFFF">${recentlist.home}</td>
	 <td bgcolor="#E6FFFF">
	 <c:if test="${recentlist.homesc eq '승'}" >
	 	<img border="0" src="/toto/game/image/win.gif"/>
	 </c:if>
	 <c:if test="${recentlist.homesc eq '무'}" >
	 	<img border="0" src="/toto/game/image/draw.gif"/>
	 </c:if>
	 <c:if test="${recentlist.homesc eq '패'}" >
	 	<img border="0" src="/toto/game/image/lose.gif"/>
	 </c:if>
	 </td>
	 <td bgcolor="#E6FFFF">${recentlist.homept}</td>
	 <td bgcolor="#E6FFFF">${recentlist.awaypt}</td>
</tr>
<tr align=center>
	<td>원정</td>
	<td>${recentlist.away}</td>
	<td>
	<c:if test="${recentlist.awaysc eq '승'}" >
	 	<img border="0" src="/toto/game/image/win.gif"/>
	 </c:if>
	 	<c:if test="${recentlist.awaysc eq '무'}" >
	 	<img border="0" src="/toto/game/image/draw.gif"/>
	 </c:if>
	 	<c:if test="${recentlist.awaysc eq '패'}" >
	 	<img border="0" src="/toto/game/image/lose.gif"/>
	 </c:if>

	
	</td>
	<td>${recentlist.awaypt}</td>
	<td>${recentlist.homept}</td>
</tr>

</c:forEach>


 </table>
 </div>
