<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />
<table align="center">
	<tr >
		<td align="left" >
		<font size="4">
			<a href="/toto/gamebuy/soccerVictory.to?turn2=1">���� ����</a>&nbsp;&nbsp;&nbsp;
			<a href="/toto/gamebuy/soccerVictoryVote.to">��ǥ��Ȳ</a>&nbsp;&nbsp;&nbsp;
			<a href="#">aaa</a>&nbsp;&nbsp;&nbsp;			
		</font>
		</td>
	</tr>
</table>
<table border="1" align="center" width="700">
	<tr align="left">
		<td colspan="5">���߸� ����</td>
	</tr>
	<tr>
		<td rowspan="5" colspan="1"><img src="/toto/gamebuy/soccer.jpg" width="100"/></td>
	</tr>
	<tr>
		<td>�� �߸űݾ� :</td>
		<td>��ü ��ǥ�� :</td>
	</tr>
	<tr>
		<td>�߸űⰣ :</td>
		<td>1�� ���� ����� :</td>
	</tr>
	<tr>
		<td>ȯ��(ȯ��)�Ⱓ :</td>
		<td>���߰�� ��ǥ�� :</td>
	</tr>
	<tr>
		<td>��ȸ���̿��� :</td>
		<td></td>
	</tr>
</table>
<br />
<c:set var="match_number" value="${1}" />

<table border="1" align="center" width="700">
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
	
<c:forEach var="victoryList" items="${victoryList}">
	<tr align="center">
		<td>${match_number}���</td>
		<td>${victoryList.reg_date}</td>
		<td>${victoryList.home}</td>
		<td>
			<c:if test="${match_number eq 1}" >
				��<c:out value="[${fn:substring(vote.match_1,0,1)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_1,2,3)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_1,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 2}" >
				��<c:out value="[${fn:substring(vote.match_2,0,1)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_2,2,3)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_2,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 3}" >
				��<c:out value="[${fn:substring(vote.match_3,0,1)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_3,2,3)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_3,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 4}" >
				��<c:out value="[${fn:substring(vote.match_4,0,1)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_4,2,3)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_4,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 5}" >
				��<c:out value="[${fn:substring(vote.match_5,0,1)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_5,2,3)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_5,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 6}" >
				��<c:out value="[${fn:substring(vote.match_6,0,1)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_6,2,3)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_6,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 7}" >
				��<c:out value="[${fn:substring(vote.match_7,0,1)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_7,2,3)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_7,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 8}" >
				��<c:out value="[${fn:substring(vote.match_8,0,1)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_8,2,3)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_8,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 9}" >
				��<c:out value="[${fn:substring(vote.match_9,0,1)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_9,2,3)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_9,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 10}" >
				��<c:out value="[${fn:substring(vote.match_10,0,1)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_10,2,3)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_10,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 11}" >
				��<c:out value="[${fn:substring(vote.match_11,0,1)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_11,2,3)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_11,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 12}" >
				��<c:out value="[${fn:substring(vote.match_12,0,1)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_12,2,3)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_12,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 13}" >
				��<c:out value="[${fn:substring(vote.match_13,0,1)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_13,2,3)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_13,4,5)}]"/>
			</c:if>
			<c:if test="${match_number eq 14}" >
				��<c:out value="[${fn:substring(vote.match_14,0,1)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_14,2,3)}]"/><br />
				��<c:out value="[${fn:substring(vote.match_14,4,5)}]"/>
			</c:if>
		</td>
		<td>${victoryList.away}</td>
	</tr>
	<c:set var="match_number" value="${match_number + 1}" />
</c:forEach>
</table>
<br />
<br />
<table align="center" width="700" >
	<tr align="left">
		<td>
			�ش���� �߸������ �� ��2����, Ÿ ���� �� �����ҿ� Ư�̻����� �ִ� ����Դϴ�.<br /> 
			      ���� �� ����ü Ȩ������ ���� Ȯ���Ͻñ� �ٶ��ϴ� <br />
			- ��⺰ ��ǥ��Ȳ�� �����Ͻø� ������ǥ��[����]�� �ڵ����� ǥ��˴ϴ�. <br />
			- ��ǥ��Ȳ�� 00�� 00�� 00�� 00�� 00�� �����Դϴ�.
		<td>
	</tr>
</table> 