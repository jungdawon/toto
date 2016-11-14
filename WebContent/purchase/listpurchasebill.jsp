<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/top/top.jsp" %>
<br />
<br />
<br />
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 230px;
	width: 1150px;}
	#text2	{

	position: absolute;
	top: 560px;
	left: 160px;
	width: 1150px;}
</style>

<c:if test="${check eq '1'}">
<div id="text">
	<table border="1" align="left"  width="650">
		<tr align="center" style="background:black; color:#F6F6F6; height:25px;" >
			<td  width="200" style="border-top: 1px solid white;border-left: 1px solid white; background:white; color:#F6F6F6;"></td>
			<td  width="100">°æ±â</td>
			<td  width="350" style="border: 1px solid black;">È¨ÆÀ <img border="0" src="/toto/game/image/vs.gif"/> ¿øÁ¤ÆÀ</td>
		</tr>
		<c:set var="number" value="${1}" />
		<c:forEach var="gameList" items="${gameList}">
			<tr align="center" style="height:25px;">
				<td style="border-top: 1px solid white;border-bottom: 1px solid white;border-left: 1px solid white;"></td>
				<td  >${number}°æ±â</td>
				<td  >${gameList.home}<img border="0" src="/toto/game/image/vs.gif"/>${gameList.away}</td>
				<c:set var="number" value="${number + 1}" />
			</tr>
		</c:forEach>
	</table>
	
	<table border="1" align="left" width="150">
		<tr align="center" style="background:black; color:#F6F6F6;height:25px;" >
			<td width="150" >±¸¸Å³»¿ª</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td  >
				½Â&nbsp;<c:if test="${fn:substring(vpdto.match_1,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_1,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>

				¹«&nbsp;<c:if test="${fn:substring(vpdto.match_1,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_1,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>

				ÆÐ&nbsp;<c:if test="${fn:substring(vpdto.match_1,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_1,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				½Â&nbsp;<c:if test="${fn:substring(vpdto.match_2,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_2,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				¹«&nbsp;<c:if test="${fn:substring(vpdto.match_2,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_2,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				ÆÐ&nbsp;<c:if test="${fn:substring(vpdto.match_2,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_2,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				½Â&nbsp;<c:if test="${fn:substring(vpdto.match_3,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_3,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				¹«&nbsp;<c:if test="${fn:substring(vpdto.match_3,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_3,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				ÆÐ&nbsp;<c:if test="${fn:substring(vpdto.match_3,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_3,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				½Â&nbsp;<c:if test="${fn:substring(vpdto.match_4,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_4,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				¹«&nbsp;<c:if test="${fn:substring(vpdto.match_4,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_4,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				ÆÐ&nbsp;<c:if test="${fn:substring(vpdto.match_4,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_4,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				½Â&nbsp;<c:if test="${fn:substring(vpdto.match_5,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_5,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				¹«&nbsp;<c:if test="${fn:substring(vpdto.match_5,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_5,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				ÆÐ&nbsp;<c:if test="${fn:substring(vpdto.match_5,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_5,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				½Â&nbsp;<c:if test="${fn:substring(vpdto.match_6,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_6,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				¹«&nbsp;<c:if test="${fn:substring(vpdto.match_6,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_6,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				ÆÐ&nbsp;<c:if test="${fn:substring(vpdto.match_6,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_6,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				½Â&nbsp;<c:if test="${fn:substring(vpdto.match_7,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_7,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				¹«&nbsp;<c:if test="${fn:substring(vpdto.match_7,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_7,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				ÆÐ&nbsp;<c:if test="${fn:substring(vpdto.match_7,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_7,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				½Â&nbsp;<c:if test="${fn:substring(vpdto.match_8,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_8,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				¹«&nbsp;<c:if test="${fn:substring(vpdto.match_8,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_8,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				ÆÐ&nbsp;<c:if test="${fn:substring(vpdto.match_8,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_8,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				½Â&nbsp;<c:if test="${fn:substring(vpdto.match_9,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_9,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				¹«&nbsp;<c:if test="${fn:substring(vpdto.match_9,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_9,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				ÆÐ&nbsp;<c:if test="${fn:substring(vpdto.match_9,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_9,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				½Â&nbsp;<c:if test="${fn:substring(vpdto.match_10,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_10,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				¹«&nbsp;<c:if test="${fn:substring(vpdto.match_10,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_10,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				ÆÐ&nbsp;<c:if test="${fn:substring(vpdto.match_10,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_10,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				½Â&nbsp;<c:if test="${fn:substring(vpdto.match_11,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_11,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				¹«&nbsp;<c:if test="${fn:substring(vpdto.match_11,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_11,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				ÆÐ&nbsp;<c:if test="${fn:substring(vpdto.match_11,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_11,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				½Â&nbsp;<c:if test="${fn:substring(vpdto.match_12,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_12,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				¹«&nbsp;<c:if test="${fn:substring(vpdto.match_12,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_12,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				ÆÐ&nbsp;<c:if test="${fn:substring(vpdto.match_12,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_12,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				½Â&nbsp;<c:if test="${fn:substring(vpdto.match_13,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_13,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				¹«&nbsp;<c:if test="${fn:substring(vpdto.match_13,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_13,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				ÆÐ&nbsp;<c:if test="${fn:substring(vpdto.match_13,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_13,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				½Â&nbsp;<c:if test="${fn:substring(vpdto.match_14,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_14,0,1) ne '1'}" ><input type="checkbox"  disabled="true" /></c:if>
														      
				¹«&nbsp;<c:if test="${fn:substring(vpdto.match_14,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_14,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				ÆÐ&nbsp;<c:if test="${fn:substring(vpdto.match_14,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_14,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
	</table>
	</div>

	<br />
	<br />
	<div id="text2">
		<table align="center" width="610" >
			<tr align="center" bgcolor="282828" >
				<td >
					<font color="#FFFFFF">* ±¸¸Å±Ý¾× :</font>
					<font color="#f60"><fmt:formatNumber value="${vpdto.price}" type="number" /></font><font color="#FFFFFF">¿ø</font>
				</td>
				<td>
					<font color="#FFFFFF">* ÃÑ´©Àû±Ý¾× :</font>
					<font color="#f60"><fmt:formatNumber value="${gvddto.price}" type="number" /></font><font color="#FFFFFF">¿ø</font>
				</td>
				<td>
					<font color="#FFFFFF">* 1µî ¿¹»ó±Ý¾× :</font>
					<font color="#f60"><fmt:formatNumber value="${(gvddto.price / 2) * 0.5}" type="number" /></font><font color="#FFFFFF">¿ø</font>
				</td>
			</tr>
		</table>
	
	<br />
	<table align="center" width="650" >
		<tr align="center">
			<td><a href="/toto/purchase/listPurchase.to"><img src="/toto/purchase/image/list.gif" /></a></td>
		</tr>
	</table>
	</div>
	
</c:if>


<c:if test="${check eq 2}" >
	<c:set var="number" value="${0}" />
	<table border="1" align="center" >
		<tr align="center" style="background:black; color:#F6F6F6;">
			<td width="60">°æ±â¹øÈ£</td>
			<td width="130">¸¶°¨ÀÏ½Ã</td>
			<td width="50">´ëÈ¸¸í</td>
			<td width="190">È¨ÆÀ <img border="0" src="/toto/game/image/vs.gif"/> ¿øÁ¤ÆÀ</td>
			<td width="240" colspan="3">¹è´ç·ü</td>
		</tr>
		<c:if test="${game1.league ne null}" >
			<c:set var="number" value="${number + 1}" />
			<tr align="center">
				<td>${game1.num}</td>	
				<td><fmt:formatDate value="${game1.reg_date}" pattern="yyyy.MM.dd HH:mm"/></td>
				<td>${game1.league}</td> 
				<td>${game1.home}<img border="0" src="/toto/game/image/vs.gif"/>${game1.away}</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr1 eq '½Â'}" >½Â &nbsp;&nbsp;${game1.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr1 ne '½Â'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr1 eq '¹«'}" >¹« &nbsp;&nbsp;${game1.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr1 ne '¹«'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr1 eq 'ÆÐ'}" >ÆÐ &nbsp;&nbsp;${game1.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr1 ne 'ÆÐ'}" >-</c:if>
				</td>
			</tr>
</c:if>

<c:if test="${game2.league ne null}" >
<c:set var="number" value="${number + 1}" />
			<tr align="center">
				<td>${game1.num}</td>	
				<td><fmt:formatDate value="${game2.reg_date}" pattern="yyyy.MM.dd HH:mm"/></td>
				<td>${game2.league}</td> 
				<td>${game2.home}<img border="0" src="/toto/game/image/vs.gif"/>${game2.away}</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr2 eq '½Â'}" >½Â &nbsp;&nbsp;${game2.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr2 ne '½Â'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr2 eq '¹«'}" >¹« &nbsp;&nbsp;${game2.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr2 ne '¹«'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr2 eq 'ÆÐ'}" >ÆÐ &nbsp;&nbsp;${game2.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr2 ne 'ÆÐ'}" >-</c:if>
				</td>
			</tr>
</c:if>

<c:if test="${game3.league ne null}" >
<c:set var="number" value="${number + 1}" />
			<tr align="center">
				<td>${game3.num}</td>	
				<td><fmt:formatDate value="${game3.reg_date}" pattern="yyyy.MM.dd HH:mm"/></td>
				<td>${game3.league}</td> 
				<td>${game3.home}<img border="0" src="/toto/game/image/vs.gif"/>${game3.away}</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr3 eq '½Â'}" >½Â &nbsp;&nbsp;${game3.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr3 ne '½Â'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr3 eq '¹«'}" >¹« &nbsp;&nbsp;${game3.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr3 ne '¹«'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr3 eq 'ÆÐ'}" >ÆÐ &nbsp;&nbsp;${game3.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr3 ne 'ÆÐ'}" >-</c:if>
				</td>
			</tr>
</c:if>

<c:if test="${game4.league ne null}" >
<c:set var="number" value="${number + 1}" />
			<tr align="center">
				<td>${game4.num}</td>	
				<td><fmt:formatDate value="${game4.reg_date}" pattern="yyyy.MM.dd HH:mm"/></td>
				<td>${game4.league}</td> 
				<td>${game4.home}<img border="0" src="/toto/game/image/vs.gif"/>${game4.away}</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr4 eq '½Â'}" >½Â &nbsp;&nbsp;${game4.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr4 ne '½Â'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr4 eq '¹«'}" >¹« &nbsp;&nbsp;${game4.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr4 ne '¹«'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr4 eq 'ÆÐ'}" >ÆÐ &nbsp;&nbsp;${game4.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr4 ne 'ÆÐ'}" >-</c:if>
				</td>
			</tr>
</c:if>

<c:if test="${game5.league ne null}" >
<c:set var="number" value="${number + 1}" />
			<tr align="center">
				<td>${game5.num}</td>	
				<td><fmt:formatDate value="${game5.reg_date}" pattern="yyyy.MM.dd HH:mm"/></td>
				<td>${game5.league}</td> 
				<td>${game5.home}<img border="0" src="/toto/game/image/vs.gif"/>${game5.away}</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr5 eq '½Â'}" >½Â &nbsp;&nbsp;${game5.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr5 ne '½Â'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr5 eq '¹«'}" >¹« &nbsp;&nbsp;${game5.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr5 ne '¹«'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr5 eq 'ÆÐ'}" >ÆÐ &nbsp;&nbsp;${game5.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr5 ne 'ÆÐ'}" >-</c:if>
				</td>
			</tr>
</c:if>

<c:if test="${game6.league ne null}" >
<c:set var="number" value="${number + 1}" />
			<tr align="center">
				<td>${game6.num}</td>	
				<td><fmt:formatDate value="${game6.reg_date}" pattern="yyyy.MM.dd HH:mm"/></td>
				<td>${game6.league}</td> 
				<td>${game6.home}<img border="0" src="/toto/game/image/vs.gif"/>${game6.away}</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr6 eq '½Â'}" >½Â &nbsp;&nbsp;${game6.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr6 ne '½Â'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr6 eq '¹«'}" >¹« &nbsp;&nbsp;${game6.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr6 ne '¹«'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr6 eq 'ÆÐ'}" >ÆÐ &nbsp;&nbsp;${game6.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr6 ne 'ÆÐ'}" >-</c:if>
				</td>
			</tr>
</c:if>

<c:if test="${game7.league ne null}" >
<c:set var="number" value="${number + 1}" />
			<tr align="center">
				<td>${game7.num}</td>	
				<td><fmt:formatDate value="${game7.reg_date}" pattern="yyyy.MM.dd HH:mm"/></td>
				<td>${game7.league}</td> 
				<td>${game7.home}<img border="0" src="/toto/game/image/vs.gif"/>${game7.away}</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr7 eq '½Â'}" >½Â &nbsp;&nbsp;${game7.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr7 ne '½Â'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr7 eq '¹«'}" >¹« &nbsp;&nbsp;${game7.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr7 ne '¹«'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr7 eq 'ÆÐ'}" >ÆÐ &nbsp;&nbsp;${game7.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr7 ne 'ÆÐ'}" >-</c:if>
				</td>
			</tr>
</c:if>

<c:if test="${game8.league ne null}" >
<c:set var="number" value="${number + 1}" />
			<tr align="center">
				<td>${game8.num}</td>	
				<td><fmt:formatDate value="${game8.reg_date}" pattern="yyyy.MM.dd HH:mm"/></td>
				<td>${game8.league}</td> 
				<td>${game8.home}<img border="0" src="/toto/game/image/vs.gif"/>${game8.away}</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr8 eq '½Â'}" >½Â &nbsp;&nbsp;${game8.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr8 ne '½Â'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr8 eq '¹«'}" >¹« &nbsp;&nbsp;${game8.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr8 ne '¹«'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr8 eq 'ÆÐ'}" >ÆÐ &nbsp;&nbsp;${game8.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr8 ne 'ÆÐ'}" >-</c:if>
				</td>
			</tr>
</c:if>

<c:if test="${game9.league ne null}" >
<c:set var="number" value="${number + 1}" />
			<tr align="center">
				<td>${game9.num}</td>	
				<td><fmt:formatDate value="${game9.reg_date}" pattern="yyyy.MM.dd HH:mm"/></td>
				<td>${game9.league}</td> 
				<td>${game9.home}<img border="0" src="/toto/game/image/vs.gif"/>${game9.away}</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr9 eq '½Â'}" >½Â &nbsp;&nbsp;${game9.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr9 ne '½Â'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr9 eq '¹«'}" >¹« &nbsp;&nbsp;${game9.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr9 ne '¹«'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr9 eq 'ÆÐ'}" >ÆÐ &nbsp;&nbsp;${game9.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr9 ne 'ÆÐ'}" >-</c:if>
				</td>
			</tr>
</c:if>

<c:if test="${game10.league ne null}" >
<c:set var="number" value="${number + 1}" />
			<tr align="center">
				<td>${game10.num}</td>	
				<td><fmt:formatDate value="${game10.reg_date}" pattern="yyyy.MM.dd HH:mm"/></td>
				<td>${game10.league}</td> 
				<td>${game10.home}<img border="0" src="/toto/game/image/vs.gif"/>${game10.away}</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr10 eq '½Â'}" >½Â &nbsp;&nbsp;${game10.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr10 ne '½Â'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr10 eq '¹«'}" >¹« &nbsp;&nbsp;${game10.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr10 ne '¹«'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr10 eq 'ÆÐ'}" >ÆÐ &nbsp;&nbsp;${game10.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr10 ne 'ÆÐ'}" >-</c:if>
				</td>
			</tr>
</c:if>

</table>
<br />
<table align="center" width="670" >
	<tr align="center" bgcolor="282828">
		<td width="167" height="20"></td>
		<td width="167" height="20"></td>
		<td width="167" height="20"></td>
		<td width="167" height="20"></td>
	</tr>
	<tr align="center" bgcolor="282828">
		<td width="167"><img src="/toto/purchase/image/1.png" /></td>
		<td width="167"><img src="/toto/purchase/image/2.png" /></td>
		<td width="167"><img src="/toto/purchase/image/3.png" /></td>
		<td width="167"><img src="/toto/purchase/image/4.png" /></td>
	</tr>
	<tr align="center" bgcolor="282828">
		<td><font color="#FFFFFF"><c:out value="${number}" /></font></td>
		<td><font color="#FFFFFF">${protodto.exrate}¹è</font></td>
		<td><font color="#FFFFFF"><fmt:formatNumber value="${protodto.bet}" type="number" />¿ø</font></td>
		<td><font color="#FFFFFF"><fmt:formatNumber value="${protodto.exprofits}" type="number" />¿ø</font></td>
	</tr>
	<tr align="center" bgcolor="282828">
		<td colspan="4">
		<font color="#FFFFFF">* ÃÑ±¸¸Å±Ý¾× : </font>
		<font color="#f60"><fmt:formatNumber value="${protodto.bet}" type="number" /></font><font color="#FFFFFF">¿ø</font></td>
	</tr>
</table>

<br />
<table align="center" width="670" >
	<tr align="center">
		<td><a href="/toto/purchase/listPurchase.to"><img src="/toto/purchase/image/list.gif" /></a></td>
	</tr>
</table>
</c:if>
