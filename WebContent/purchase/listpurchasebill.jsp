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
			<td  width="100">���</td>
			<td  width="350" style="border: 1px solid black;">Ȩ�� <img border="0" src="/toto/game/image/vs.gif"/> ������</td>
		</tr>
		<c:set var="number" value="${1}" />
		<c:forEach var="gameList" items="${gameList}">
			<tr align="center" style="height:25px;">
				<td style="border-top: 1px solid white;border-bottom: 1px solid white;border-left: 1px solid white;"></td>
				<td  >${number}���</td>
				<td  >${gameList.home}<img border="0" src="/toto/game/image/vs.gif"/>${gameList.away}</td>
				<c:set var="number" value="${number + 1}" />
			</tr>
		</c:forEach>
	</table>
	
	<table border="1" align="left" width="150">
		<tr align="center" style="background:black; color:#F6F6F6;height:25px;" >
			<td width="150" >���ų���</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td  >
				��&nbsp;<c:if test="${fn:substring(vpdto.match_1,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_1,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>

				��&nbsp;<c:if test="${fn:substring(vpdto.match_1,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_1,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>

				��&nbsp;<c:if test="${fn:substring(vpdto.match_1,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_1,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				��&nbsp;<c:if test="${fn:substring(vpdto.match_2,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_2,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_2,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_2,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_2,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_2,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				��&nbsp;<c:if test="${fn:substring(vpdto.match_3,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_3,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_3,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_3,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_3,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_3,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				��&nbsp;<c:if test="${fn:substring(vpdto.match_4,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_4,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_4,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_4,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_4,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_4,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				��&nbsp;<c:if test="${fn:substring(vpdto.match_5,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_5,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_5,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_5,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_5,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_5,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				��&nbsp;<c:if test="${fn:substring(vpdto.match_6,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_6,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_6,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_6,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_6,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_6,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				��&nbsp;<c:if test="${fn:substring(vpdto.match_7,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_7,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_7,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_7,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_7,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_7,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				��&nbsp;<c:if test="${fn:substring(vpdto.match_8,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_8,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_8,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_8,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_8,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_8,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				��&nbsp;<c:if test="${fn:substring(vpdto.match_9,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_9,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_9,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_9,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														     
				��&nbsp;<c:if test="${fn:substring(vpdto.match_9,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_9,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				��&nbsp;<c:if test="${fn:substring(vpdto.match_10,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_10,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				��&nbsp;<c:if test="${fn:substring(vpdto.match_10,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_10,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				��&nbsp;<c:if test="${fn:substring(vpdto.match_10,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_10,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				��&nbsp;<c:if test="${fn:substring(vpdto.match_11,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_11,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				��&nbsp;<c:if test="${fn:substring(vpdto.match_11,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_11,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				��&nbsp;<c:if test="${fn:substring(vpdto.match_11,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_11,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				��&nbsp;<c:if test="${fn:substring(vpdto.match_12,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_12,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				��&nbsp;<c:if test="${fn:substring(vpdto.match_12,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_12,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				��&nbsp;<c:if test="${fn:substring(vpdto.match_12,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_12,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				��&nbsp;<c:if test="${fn:substring(vpdto.match_13,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_13,0,1) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				��&nbsp;<c:if test="${fn:substring(vpdto.match_13,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_13,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				��&nbsp;<c:if test="${fn:substring(vpdto.match_13,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_13,4,5) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
			</td>
		</tr>
		<tr align="center" style="height:25px;">
			<td>
				��&nbsp;<c:if test="${fn:substring(vpdto.match_14,0,1) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_14,0,1) ne '1'}" ><input type="checkbox"  disabled="true" /></c:if>
														      
				��&nbsp;<c:if test="${fn:substring(vpdto.match_14,2,3) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
				<c:if test="${fn:substring(vpdto.match_14,2,3) ne '1'}" ><input type="checkbox"  disabled="true"/></c:if>
														      
				��&nbsp;<c:if test="${fn:substring(vpdto.match_14,4,5) eq '1'}" ><input type="checkbox" checked="true" disabled="true"/></c:if>
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
					<font color="#FFFFFF">* ���űݾ� :</font>
					<font color="#f60"><fmt:formatNumber value="${vpdto.price}" type="number" /></font><font color="#FFFFFF">��</font>
				</td>
				<td>
					<font color="#FFFFFF">* �Ѵ����ݾ� :</font>
					<font color="#f60"><fmt:formatNumber value="${gvddto.price}" type="number" /></font><font color="#FFFFFF">��</font>
				</td>
				<td>
					<font color="#FFFFFF">* 1�� ����ݾ� :</font>
					<font color="#f60"><fmt:formatNumber value="${(gvddto.price / 2) * 0.5}" type="number" /></font><font color="#FFFFFF">��</font>
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
			<td width="60">����ȣ</td>
			<td width="130">�����Ͻ�</td>
			<td width="50">��ȸ��</td>
			<td width="190">Ȩ�� <img border="0" src="/toto/game/image/vs.gif"/> ������</td>
			<td width="240" colspan="3">����</td>
		</tr>
		<c:if test="${game1.league ne null}" >
			<c:set var="number" value="${number + 1}" />
			<tr align="center">
				<td>${game1.num}</td>	
				<td><fmt:formatDate value="${game1.reg_date}" pattern="yyyy.MM.dd HH:mm"/></td>
				<td>${game1.league}</td> 
				<td>${game1.home}<img border="0" src="/toto/game/image/vs.gif"/>${game1.away}</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr1 eq '��'}" >�� &nbsp;&nbsp;${game1.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr1 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr1 eq '��'}" >�� &nbsp;&nbsp;${game1.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr1 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr1 eq '��'}" >�� &nbsp;&nbsp;${game1.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr1 ne '��'}" >-</c:if>
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
					<c:if test="${protodto.betr2 eq '��'}" >�� &nbsp;&nbsp;${game2.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr2 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr2 eq '��'}" >�� &nbsp;&nbsp;${game2.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr2 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr2 eq '��'}" >�� &nbsp;&nbsp;${game2.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr2 ne '��'}" >-</c:if>
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
					<c:if test="${protodto.betr3 eq '��'}" >�� &nbsp;&nbsp;${game3.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr3 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr3 eq '��'}" >�� &nbsp;&nbsp;${game3.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr3 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr3 eq '��'}" >�� &nbsp;&nbsp;${game3.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr3 ne '��'}" >-</c:if>
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
					<c:if test="${protodto.betr4 eq '��'}" >�� &nbsp;&nbsp;${game4.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr4 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr4 eq '��'}" >�� &nbsp;&nbsp;${game4.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr4 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr4 eq '��'}" >�� &nbsp;&nbsp;${game4.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr4 ne '��'}" >-</c:if>
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
					<c:if test="${protodto.betr5 eq '��'}" >�� &nbsp;&nbsp;${game5.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr5 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr5 eq '��'}" >�� &nbsp;&nbsp;${game5.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr5 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr5 eq '��'}" >�� &nbsp;&nbsp;${game5.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr5 ne '��'}" >-</c:if>
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
					<c:if test="${protodto.betr6 eq '��'}" >�� &nbsp;&nbsp;${game6.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr6 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr6 eq '��'}" >�� &nbsp;&nbsp;${game6.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr6 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr6 eq '��'}" >�� &nbsp;&nbsp;${game6.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr6 ne '��'}" >-</c:if>
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
					<c:if test="${protodto.betr7 eq '��'}" >�� &nbsp;&nbsp;${game7.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr7 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr7 eq '��'}" >�� &nbsp;&nbsp;${game7.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr7 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr7 eq '��'}" >�� &nbsp;&nbsp;${game7.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr7 ne '��'}" >-</c:if>
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
					<c:if test="${protodto.betr8 eq '��'}" >�� &nbsp;&nbsp;${game8.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr8 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr8 eq '��'}" >�� &nbsp;&nbsp;${game8.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr8 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr8 eq '��'}" >�� &nbsp;&nbsp;${game8.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr8 ne '��'}" >-</c:if>
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
					<c:if test="${protodto.betr9 eq '��'}" >�� &nbsp;&nbsp;${game9.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr9 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr9 eq '��'}" >�� &nbsp;&nbsp;${game9.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr9 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr9 eq '��'}" >�� &nbsp;&nbsp;${game9.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr9 ne '��'}" >-</c:if>
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
					<c:if test="${protodto.betr10 eq '��'}" >�� &nbsp;&nbsp;${game10.win_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr10 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr10 eq '��'}" >�� &nbsp;&nbsp;${game10.draw_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr10 ne '��'}" >-</c:if>
				</td>
				<td colspan="1" td width="80">
					<c:if test="${protodto.betr10 eq '��'}" >�� &nbsp;&nbsp;${game10.lose_rate}&nbsp;&nbsp;<input type="checkbox" checked="true" disabled="true"/></c:if>
					<c:if test="${protodto.betr10 ne '��'}" >-</c:if>
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
		<td><font color="#FFFFFF">${protodto.exrate}��</font></td>
		<td><font color="#FFFFFF"><fmt:formatNumber value="${protodto.bet}" type="number" />��</font></td>
		<td><font color="#FFFFFF"><fmt:formatNumber value="${protodto.exprofits}" type="number" />��</font></td>
	</tr>
	<tr align="center" bgcolor="282828">
		<td colspan="4">
		<font color="#FFFFFF">* �ѱ��űݾ� : </font>
		<font color="#f60"><fmt:formatNumber value="${protodto.bet}" type="number" /></font><font color="#FFFFFF">��</font></td>
	</tr>
</table>

<br />
<table align="center" width="670" >
	<tr align="center">
		<td><a href="/toto/purchase/listPurchase.to"><img src="/toto/purchase/image/list.gif" /></a></td>
	</tr>
</table>
</c:if>
