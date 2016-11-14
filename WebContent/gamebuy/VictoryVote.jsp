<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/gamebuy/victoryMenu.jsp" %>
<br />
<br />
<br />
<style type="text/css">
	#vote_2 {
		position: relative;
		left: 7%;
		
	}
	#vote_3 {
		position: relative;
		left: 7%;
		
	}
	#vote_4 {
		position: relative;
		left: 7%;
		
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
	<table border="1" align="center" width="700" id="vote_2">
		<tr align="left">
			<td colspan="5">���߸� ����</td>
		</tr>
		<tr>
			<td rowspan="5" colspan="1"><img src="/toto/gamebuy/soccer.jpg" width="100"/></td>
		</tr>
		<tr>
			<td>�� �߸űݾ� : <fmt:formatNumber value="${vote.price}" type="number" />��</td>
			<td>��ü ��ǥ�� : <fmt:formatNumber value="${VoteCount}" type="number" /></td>
		</tr>
		<tr>
			<td>�߸űⰣ :
				<fmt:formatDate value="${bgdto.start_date}" pattern="yyyy�� MM�� dd��"/> ~ 
				<fmt:formatDate value="${bgdto.end_date}" pattern="yyyy�� MM�� dd��"/>
			</td>
			<td>1�� ���� ����� : <fmt:formatNumber value="${(vote.price / 2) * 0.5}" type="number" />��</td>
		</tr>
		<tr>
			<td>ȯ��(ȯ��)�Ⱓ :
				<fmt:formatDate value="${bgdto.result_date}" pattern="yyyy�� MM�� dd��"/> ~
				${fn:substring(result,0,4) + 1}��${fn:substring(result,4,6)}��${fn:substring(result,6,8)}��
				
			</td>
			<td>���߰�� ��ǥ�� :<fmt:formatDate value="${bgdto.result_date}" pattern="yyyy�� MM�� dd��"/></td>
		</tr>
	</table>
	<br />
	
	<table border="1" align="center" width="700" id="vote_3">
		<tr align="left">
			<td colspan="5">����ǥ ��Ȳ</td>
		</tr>
		<tr bgcolor="#DAD9FF" align="center">
			<td>���</td>
			<td>����Ͻ�</td>
			<td>Ȩ��</td>
			<td>��ǥ</td>
			<td>������</td>
		</tr>
		
	<c:set var="match_number" value="${1}" />
	
	<c:forEach var="victoryList" items="${victoryList}">
		<tr align="center">
			<td>${match_number}���</td>
			<td>
				<fmt:formatDate value="${victoryList.reg_date}" pattern="yyyy��MM��dd�� HH��mm��" />
			</td>
			<td>${victoryList.home}</td>
			<td>
				<c:set var="matchnum" value="${1}" />
				<c:if test="${match_number eq 1}" >
					<c:forTokens var="match" items="${vote.match_1}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp; :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp; :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 2}" >
					<c:forTokens var="match" items="${vote.match_2}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 3}" >
					<c:forTokens var="match" items="${vote.match_3}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 4}" >
					<c:forTokens var="match" items="${vote.match_4}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 5}" >
					<c:forTokens var="match" items="${vote.match_5}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 6}" >
					<c:forTokens var="match" items="${vote.match_6}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 7}" >
					<c:forTokens var="match" items="${vote.match_7}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 8}" >
					<c:forTokens var="match" items="${vote.match_8}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 9}" >
					<c:forTokens var="match" items="${vote.match_9}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 10}" >
					<c:forTokens var="match" items="${vote.match_10}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 11}" >
					<c:forTokens var="match" items="${vote.match_11}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 12}" >
					<c:forTokens var="match" items="${vote.match_12}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 13}" >
					<c:forTokens var="match" items="${vote.match_13}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				<c:if test="${match_number eq 14}" >
					<c:forTokens var="match" items="${vote.match_14}" delims="," varStatus="i" >
					     <c:if test="${matchnum eq 1}"><img src="/toto/game/image/win.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 2}"><img src="/toto/game/image/draw.gif">&nbsp;  :&nbsp;</c:if>
					     <c:if test="${matchnum eq 3}"><img src="/toto/game/image/lose.gif">&nbsp;  :&nbsp;</c:if>
					     [&nbsp;${match}&nbsp;]
					     <br />
					     <c:set var="matchnum" value="${matchnum + 1}" /> 
					</c:forTokens>
				</c:if>
				
			</td>
			<td>${victoryList.away}</td>
		</tr>
		<c:set var="match_number" value="${match_number + 1}" />
	</c:forEach>
	</table>
	<br />
	<br />
	<table align="center" width="700" id="vote_4">
		<tr align="left">
			<td>
				�ش���� �߸������ �� ��2����, Ÿ ���� �� �����ҿ� Ư�̻����� �ִ� ����Դϴ�.<br /> 
				      ���� �� ����ü Ȩ������ ���� Ȯ���Ͻñ� �ٶ��ϴ� <br />
				- ��⺰ ��ǥ��Ȳ�� �����Ͻø� ������ǥ��[����]�� �ڵ����� ǥ��˴ϴ�. <br />
				- ��ǥ��Ȳ�� 00�� 00�� 00�� 00�� 00�� �����Դϴ�.
			<td>
		</tr>
	</table>
</div>