<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/game/subMenu.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if> --%>
<br />
<br />
<br />
<style type="text/css">
	#t1 {
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
<img src="/toto/teaminfomation/image/tit_basketball_01.gif" />&nbsp;&nbsp;
<img src="/toto/teaminfomation/image/btn_teaminfo.gif" />&nbsp;&nbsp;
<img src="/toto/teaminfomation/image/tit_txtSoccer.gif" /><br /><br />
<font  size="5"color="#FF7012">KBO 리그순위 15시즌</font>
</td></tr>
</table>
<br />
 <table border=1 width=80% id="t1">
  
 <tr align=center bgcolor="#E7E7E7">
	 <td rowspan=2>순위</td>
	 <td rowspan=2>팀명</td>
	 <td rowspan=2>경기수</td>
	 <td rowspan=2>승점</td>
	 <td rowspan=2>승</td>
	 <td rowspan=2>무</td>
	 <td rowspan=2>패</td>
	 <td colspan=2>득점</td>
	 <td colspan=2>실점</td> 
	
 </tr>
 <tr align=center bgcolor="#E7E7E7"> 
	 <td>전체</td>
	 <td>평균</td>
	 <td>전체</td>
	 <td>평균</td> 
 <c:forEach var="teamscorelist" items="${teamscorelist}" varStatus="var">
 </tr>
	<tr align=center>
	<td><font color="#FF7012">${var.count}</font></td>
	<td style="text-decoration: underline;"><a style="color: #5AAEFF;" href="/toto/teaminfomation/teamcontentbase.to?teamname=${teamscorelist.home}&snum=${6}&league=KBO">${teamscorelist.home}</a></td>
	<td>${teamscorelist.win+teamscorelist.lose+teamscorelist.draw}</td>
	<td>${teamscorelist.win*3+teamscorelist.draw}</td>
	<td>${teamscorelist.win}</td>
	<td>${teamscorelist.draw}</td>
	<td>${teamscorelist.lose}</td>
	<td>${teamscorelist.awaypt+teamscorelist.homept}</td>
	<td><fmt:formatNumber value="${(teamscorelist.homept+teamscorelist.awaypt)/(teamscorelist.win+teamscorelist.lose+teamscorelist.draw)}" pattern="0.00" /></td>
	<td>${teamscorelist.hlpt+teamscorelist.alpt}</td>
	<td><fmt:formatNumber value="${(teamscorelist.alpt+teamscorelist.hlpt)/(teamscorelist.win+teamscorelist.lose+teamscorelist.draw)}" pattern="0.00" /></td>

	
</tr>
</c:forEach>

 </table>
 <br />
<table align="center" width="750">
<tr><td><img src="/toto/teaminfomation/image/bottom.gif" /></td></tr>
</table>	
 
 </div>