<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ include file="/game/subMenu.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<br />
<br />
<br />

<br />

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function chk(arg){
		var f = document.infopro;
		var opt = $("#ctg_nm option").length;
		if(arg == "K����"){
			num = new Array("����","����","����","����","����","����","��õ","����","����","���","�λ�","����");
			vnum = new Array("����","����","����","����","����","����","��õ","����","����","���","�λ�","����");
			num2 = new Array("����","����","����","����","����","����","��õ","����","����","���","�λ�","����");
			vnum2 = new Array("����","����","����","����","����","����","��õ","����","����","���","�λ�","����");
		}else if(arg == "KBO"){
			num = new Array("��ȭ","�Ե�","�ؼ�","NC","�λ�","SK","KIA","�Ｚ","LG","KT");
			vnum = new Array("��ȭ","�Ե�","�ؼ�","NC","�λ�","SK","KIA","�Ｚ","LG","KT");
			num2 = new Array("�Ե�","��ȭ","�ؼ�","NC","�λ�","SK","KIA","�Ｚ","LG","KT");
			vnum2 = new Array("�Ե�","��ȭ","�ؼ�","NC","�λ�","SK","KIA","�Ｚ","LG","KT");
		}else if(arg == "KBL"){
			num = new Array("�������½�","�λ�KT","���ֵ���","����SK","�����","����KCC","â��LG","��õ���ڷ���","�Ⱦ�KGC","����Ｚ");
			vnum = new Array("�������½�","�λ�KT","���ֵ���","����SK","�����","����KCC","â��LG","��õ���ڷ���","�Ⱦ�KGC","����Ｚ");
			num2 = new Array("�������½�","�λ�KT","���ֵ���","����SK","�����","����KCC","â��LG","��õ���ڷ���","�Ⱦ�KGC","����Ｚ");
			vnum2 = new Array("�������½�","�λ�KT","���ֵ���","����SK","�����","����KCC","â��LG","��õ���ڷ���","�Ⱦ�KGC","����Ｚ");
		}
		for(var i=0; i<opt; i++){
			f.home.options[0] = null;
			f.away.options[0] = null;
		}
		for(k=0; k < num.length; k++){
			f.home.options[k] = new Option(num[k],vnum[k]);
			f.away.options[k] = new Option(num2[k],vnum2[k]);
		}
	}
	
	window.onload = function chk2(){
		var f = document.infopro;
		var arg = document.forms['infopro'].league.value; 
		var opt = $("#ctg_nm option").length;
		if(arg == "K����"){
			num = new Array("${home}","����","����","����","����","����","����","��õ","����","����","���","�λ�","����");
			vnum = new Array("${home}","����","����","����","����","����","����","��õ","����","����","���","�λ�","����");
			num2 = new Array("${away}","����","����","����","����","����","����","��õ","����","����","���","�λ�","����");
			vnum2 = new Array("${away}","����","����","����","����","����","����","��õ","����","����","���","�λ�","����");
		}else if(arg == "KBO"){
			num = new Array("${home}","��ȭ","�Ե�","�ؼ�","NC","�λ�","SK","KIA","�Ｚ","LG","KT");
			vnum = new Array("${home}","��ȭ","�Ե�","�ؼ�","NC","�λ�","SK","KIA","�Ｚ","LG","KT");
			num2 = new Array("${away}","�Ե�","��ȭ","�ؼ�","NC","�λ�","SK","KIA","�Ｚ","LG","KT");
			vnum2 = new Array("${away}","�Ե�","��ȭ","�ؼ�","NC","�λ�","SK","KIA","�Ｚ","LG","KT");
		}else if(arg == "KBL"){
			num = new Array("${home}","�������½�","�λ�KT","���ֵ���","����SK","�����","����KCC","â��LG","��õ���ڷ���","�Ⱦ�KGC","����Ｚ");
			vnum = new Array("${home}","�������½�","�λ�KT","���ֵ���","����SK","�����","����KCC","â��LG","��õ���ڷ���","�Ⱦ�KGC","����Ｚ");
			num2 = new Array("${away}","�������½�","�λ�KT","���ֵ���","����SK","�����","����KCC","â��LG","��õ���ڷ���","�Ⱦ�KGC","����Ｚ");
			vnum2 = new Array("${away}","�������½�","�λ�KT","���ֵ���","����SK","�����","����KCC","â��LG","��õ���ڷ���","�Ⱦ�KGC","����Ｚ");
		}
		for(var i=0; i<opt; i++){
			f.home.options[0] = null;
			f.away.options[0] = null;
		}
		for(k=0; k < num.length; k++){
			f.home.options[k] = new Option(num[k],vnum[k]);
			f.away.options[k] = new Option(num2[k],vnum2[k]);
		}
	}
</script>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>
<div id="text">

<table border="0" align="center" width="500">
	<tr align="left">
		<td>
			<c:if test="${league eq 'K����'}" >
				<img src="/toto/game/image/s_title.gif" />
			</c:if>
			<c:if test="${league eq 'KBO'}" >
				<img src="/toto/game/image/o_title.gif" />
			</c:if>
			<c:if test="${league eq 'KBL'}" >
				<img src="/toto/game/image/l_title.gif" />
			</c:if>
			&nbsp;&nbsp;
			<img src="/toto/game/image/match.gif" />&nbsp;&nbsp;
			<img src="/toto/game/image/text.gif" />
		</td>
	</tr>
</table>

<br />

<form method="post" name="infopro" action="/toto/game/gameMatchPro.to">
	<input type="hidden" name="flag" value="�������" />
	<table align="center">
		<tr>
			<td>�´���� ���� :</td>
			<td>
				<select name="league" id="ctg" onchange="chk(this.value);">
					<c:if test="${league ne null}">
						<option value="${league}">${league}</option>
					</c:if>
					<option value="K����">K����</option>
					<option value="KBO">KBO</option>
					<option value="KBL">KBL</option>
				</select>
					<select name="home" id="ctg_nm">
		
					</select>
					<img border="0" src="/toto/game/image/vs.gif"/>
					<select name="away">

					</select>
			</td>
			<td>&nbsp;&nbsp;&nbsp;<a href="javascript:document.infopro.submit();"><img border="0" src="/toto/game/image/submit.gif"/></a></td>
		</tr>
			
	</table>
</form>
<!-- �ʱ�ȭ -->
<c:set var="TotalHomeWin"   value="${0}"/>	<c:set var="TotalAwayWin"   value="${0}"/>	<c:set var="MatchHomeWin"  value="${0}"/>	
<c:set var="TotalHomeDraw"  value="${0}"/>	<c:set var="TotalAwayDraw"  value="${0}"/>	<c:set var="MatchHomeDraw" value="${0}"/>
<c:set var="TotalHomeLose"  value="${0}"/>	<c:set var="TotalAwayLose"  value="${0}"/>	<c:set var="MatchHomeLose" value="${0}"/>
<c:set var="EachHomeWin_A"  value="${0}"/>	<c:set var="EachHomeWin_B"  value="${0}"/>	<c:set var="MatchAwayWin"  value="${0}"/>
<c:set var="EachHomeDraw_A" value="${0}"/>	<c:set var="EachHomeDraw_B" value="${0}"/>	<c:set var="MatchAwayDraw" value="${0}"/>
<c:set var="EachHomeLose_A" value="${0}"/>	<c:set var="EachHomeLose_B" value="${0}"/>	<c:set var="MatchAwayLose" value="${0}"/>
<c:set var="EachAwayWin_A"  value="${0}"/>	<c:set var="EachAwayWin_B"  value="${0}"/>
<c:set var="EachAwayDraw_A" value="${0}"/>	<c:set var="EachAwayDraw_B" value="${0}"/>
<c:set var="EachAwayLose_A" value="${0}"/>	<c:set var="EachAwayLose_B" value="${0}"/>


<!-- �´�� �ش��� ������ -->
<c:forEach var="MatchList" items="${MatchList}" >
	<!-- �´�� A�� Ȩ�϶� �¸� -->
	<c:if test="${MatchList.home eq home}" >
		<c:if test="${MatchList.homesc eq '��'}" >
			<c:set var="MatchHomeWin" value="${MatchHomeWin + 1}" />
		</c:if>
	</c:if>
	<!-- �´�� A�� �����϶� �¸� -->
	<c:if test="${MatchList.away eq home}" >
		<c:if test="${MatchList.awaysc eq '��'}" >
			<c:set var="MatchHomeWin" value="${MatchHomeWin + 1}" />
		</c:if>
	</c:if>
	<!-- �´�� A�� Ȩ�϶� ���º� -->
	<c:if test="${MatchList.home eq home}" >
		<c:if test="${MatchList.homesc eq '��'}" >
			<c:set var="MatchHomeDraw" value="${MatchHomeDraw + 1}" />
		</c:if>
	</c:if>
	<!-- �´�� A�� �����϶� ���º� -->
	<c:if test="${MatchList.away eq home}" >
		<c:if test="${MatchList.awaysc eq '��'}" >
			<c:set var="MatchHomeDraw" value="${MatchHomeDraw + 1}" />
		</c:if>
	</c:if>
	<!-- �´�� A�� Ȩ�϶� �й� -->
	<c:if test="${MatchList.home eq home}" >
		<c:if test="${MatchList.homesc eq '��'}" >
			<c:set var="MatchHomeLose" value="${MatchHomeLose + 1}" />
		</c:if>
	</c:if>
	<!-- �´�� A�� �����϶� �й� -->
	<c:if test="${MatchList.away eq home}" >
		<c:if test="${MatchList.awaysc eq '��'}" >
			<c:set var="MatchHomeLose" value="${MatchHomeLose + 1}" />
		</c:if>
	</c:if>

<!--  ---------------------------- -->	
	<!-- �´�� B�� Ȩ�϶� �¸� -->
	<c:if test="${MatchList.home eq away}" >
		<c:if test="${MatchList.homesc eq '��'}" >
			<c:set var="MatchAwayWin" value="${MatchAwayWin + 1}" />
		</c:if>
	</c:if>
	<!-- �´�� B�� �����϶� �¸� -->
	<c:if test="${MatchList.away eq away}" >
		<c:if test="${MatchList.awaysc eq '��'}" >
			<c:set var="MatchAwayWin" value="${MatchAwayWin + 1}" />
		</c:if>
	</c:if>
	<!-- �´�� B�� Ȩ�϶� ���º� -->
	<c:if test="${MatchList.home eq away}" >
		<c:if test="${MatchList.homesc eq '��'}" >
			<c:set var="MatchAwayDraw" value="${MatchAwayDraw + 1}" />
		</c:if>
	</c:if>
	<!-- �´�� B�� �����϶� ���º� -->
	<c:if test="${MatchList.away eq away}" >
		<c:if test="${MatchList.awaysc eq '��'}" >
			<c:set var="MatchAwayDraw" value="${MatchAwayDraw + 1}" />
		</c:if>
	</c:if>
	<!-- �´�� B�� Ȩ�϶� �й� -->
	<c:if test="${MatchList.home eq away}" >
		<c:if test="${MatchList.homesc eq '��'}" >
			<c:set var="MatchAwayLose" value="${MatchAwayLose + 1}" />
		</c:if>
	</c:if>
	<!-- �´�� B�� �����϶� �й� -->
	<c:if test="${MatchList.away eq away}" >
		<c:if test="${MatchList.awaysc eq '��'}" >
			<c:set var="MatchAwayLose" value="${MatchAwayLose + 1}" />
		</c:if>
	</c:if>
</c:forEach>

<!-- �´�� ��ü�� ���� -->
<c:forEach var="AllMatchList" items="${AllMatchList}">
	<!-- A�� ��ü ����(��) -->
	<c:if test="${(AllMatchList.home eq home && AllMatchList.homesc eq '��') ||
				  (AllMatchList.away eq home && AllMatchList.awaysc eq '��')}">
			<c:set var="TotalHomeWin" value="${TotalHomeWin+1}"/>
			<!-- A�� Ȩ ����(��) -->
			<c:if test="${AllMatchList.home eq home && AllMatchList.homesc eq '��'}">
				<c:set var="EachHomeWin_A" value="${EachHomeWin_A + 1}" />
			</c:if>
			<!-- A�� ���� ����(��) -->
			<c:if test="${AllMatchList.away eq home && AllMatchList.awaysc eq '��'}">
				<c:set var="EachAwayWin_A" value="${EachAwayWin_A + 1}" />
			</c:if>
	</c:if>
	<!-- A�� ��ü ����(��) -->
	<c:if test="${(AllMatchList.home eq home && AllMatchList.homesc eq '��') ||
				  (AllMatchList.away eq home && AllMatchList.awaysc eq '��')}">
			<c:set var="TotalHomeDraw" value="${TotalHomeDraw+1}"/>
			<!-- A�� Ȩ ����(��) -->
			<c:if test="${AllMatchList.home eq home && AllMatchList.homesc eq '��'}">
				<c:set var="EachHomeDraw_A" value="${EachHomeDraw_A + 1}" />
			</c:if>
			<!-- A�� ���� ����(��) -->
			<c:if test="${AllMatchList.away eq home && AllMatchList.awaysc eq '��'}">
				<c:set var="EachAwayDraw_A" value="${EachAwayDraw_A + 1}" />
			</c:if>
	</c:if>
	<!-- A�� ��ü ����(��) -->
	<c:if test="${(AllMatchList.home eq home && AllMatchList.homesc eq '��') ||
				  (AllMatchList.away eq home && AllMatchList.awaysc eq '��')}">
			<c:set var="TotalHomeLose" value="${TotalHomeLose+1}"/>
			<!-- A�� Ȩ ����(��) -->
			<c:if test="${AllMatchList.home eq home && AllMatchList.homesc eq '��'}">
				<c:set var="EachHomeLose_A" value="${EachHomeLose_A + 1}" />
			</c:if>
			<!-- A�� ���� ����(��) -->
			<c:if test="${AllMatchList.away eq home && AllMatchList.awaysc eq '��'}">
				<c:set var="EachAwayLose_A" value="${EachAwayLose_A + 1}" />
			</c:if>
	</c:if>
	
	<!-- B�� ��ü ����(��) -->
	<c:if test="${(AllMatchList.home eq away && AllMatchList.homesc eq '��') ||
				  (AllMatchList.away eq away && AllMatchList.awaysc eq '��')}">
			<c:set var="TotalAwayWin" value="${TotalAwayWin+1}"/>
			<!-- B�� Ȩ ����(��) -->
			<c:if test="${AllMatchList.home eq away && AllMatchList.homesc eq '��'}">
				<c:set var="EachHomeWin_B" value="${EachHomeWin_B + 1}" />
			</c:if>
			<!-- B�� ���� ����(��) -->
			<c:if test="${AllMatchList.away eq away && AllMatchList.awaysc eq '��'}">
				<c:set var="EachAwayWin_B" value="${EachAwayWin_B + 1}" />
			</c:if>
	</c:if>
	<!-- B�� ��ü ����(��) -->
	<c:if test="${(AllMatchList.home eq away && AllMatchList.homesc eq '��') ||
				  (AllMatchList.away eq away && AllMatchList.awaysc eq '��')}">
			<c:set var="TotalAwayDraw" value="${TotalAwayDraw+1}"/>
			<!-- B�� Ȩ ����(��) -->
			<c:if test="${AllMatchList.home eq away && AllMatchList.homesc eq '��'}">
				<c:set var="EachHomeDraw_B" value="${EachHomeDraw_B + 1}" />
			</c:if>
			<!-- B�� ���� ����(��) -->
			<c:if test="${AllMatchList.away eq away && AllMatchList.awaysc eq '��'}">
				<c:set var="EachAwayDraw_B" value="${EachAwayDraw_B + 1}" />
			</c:if>
	</c:if>
	<!-- B�� ��ü ����(��) -->
	<c:if test="${(AllMatchList.home eq away && AllMatchList.homesc eq '��') ||
				  (AllMatchList.away eq away && AllMatchList.awaysc eq '��')}">
			<c:set var="TotalAwayLose" value="${TotalAwayLose+1}"/>
			<!-- B�� Ȩ ����(��) -->
			<c:if test="${AllMatchList.home eq away && AllMatchList.homesc eq '��'}">
				<c:set var="EachHomeLose_B" value="${EachHomeLose_B + 1}" />
			</c:if>
			<!-- B�� ���� ����(��) -->
			<c:if test="${AllMatchList.away eq away && AllMatchList.awaysc eq '��'}">
				<c:set var="EachAwayLose_B" value="${EachAwayLose_B + 1}" />
			</c:if>
	</c:if>
	
</c:forEach>


<c:forEach var="RecentlyMatch" items="${RecentlyMatch}" >
	<c:if test="${RecentlyMatch.home eq home}" >
		<c:set var="HomeName" value="Ȩ" />
		<c:set var="HomePlay" value="${RecentlyMatch.homesc}" />
		<c:set var="HomeWinPoint" value="${RecentlyMatch.homept}" />
		<c:set var="HomelosePoint" value="${RecentlyMatch.awaypt}" />
	</c:if>
	<c:if test="${RecentlyMatch.away eq home}" >
		<c:set var="HomeName" value="����" />
		<c:set var="HomePlay" value="${RecentlyMatch.awaysc}" />
		<c:set var="HomeWinPoint" value="${RecentlyMatch.awaypt}" />
		<c:set var="HomelosePoint" value="${RecentlyMatch.homept}" />
	</c:if>
	
	<c:if test="${RecentlyMatch.home eq away}" >
		<c:set var="AwayName" value="Ȩ" />
		<c:set var="AwayPlay" value="${RecentlyMatch.homesc}" />
		<c:set var="AwayWinPoint" value="${RecentlyMatch.homept}" />
		<c:set var="AwaylosePoint" value="${RecentlyMatch.awaypt}" />
	</c:if>
	<c:if test="${RecentlyMatch.away eq away}" >
		<c:set var="AwayName" value="����" />
		<c:set var="AwayPlay" value="${RecentlyMatch.awaysc}" />
		<c:set var="AwayWinPoint" value="${RecentlyMatch.awaypt}" />
		<c:set var="AwaylosePoint" value="${RecentlyMatch.homept}" />
	</c:if>
	
</c:forEach>

<table border="1" width="800" align="center">
	<tr align="center" bgcolor="#E7E7E7">
		<td colspan="5"><img border="0" src="/toto/game/image/GameMatchTitle.gif"/></td>
	</tr>
	<tr align="center">
		<td colspan="1" >
			<c:if test="${home eq '���'}"><img src="/toto/game/logo/Ulsan.jpg" /></c:if>		
			<c:if test="${home eq '����'}"><img src="/toto/game/logo/Suwon.jpg" /></c:if>		
			<c:if test="${home eq '����'}"><img src="/toto/game/logo/Seongnam.jpg" /></c:if>		
			<c:if test="${home eq '�λ�'}"><img src="/toto/game/logo/Busan.jpg" /></c:if>		
			<c:if test="${home eq '����'}"><img src="/toto/game/logo/Daejeon.jpg" /></c:if>		
			<c:if test="${home eq '����'}"><img src="/toto/game/logo/Gwangju.jpg" /></c:if>		
			<c:if test="${home eq '����'}"><img src="/toto/game/logo/Seoul.jpg"   /></c:if>		
			<c:if test="${home eq '��õ'}"><img src="/toto/game/logo/Incheon.jpg" /></c:if>		
			<c:if test="${home eq '����'}"><img src="/toto/game/logo/Jeonnam.jpg" /></c:if>		
			<c:if test="${home eq '����'}"><img src="/toto/game/logo/Jeonbuk.jpg" /></c:if>		
			<c:if test="${home eq '����'}"><img src="/toto/game/logo/Jeju.jpg" 	  /></c:if>		
			<c:if test="${home eq '����'}"><img src="/toto/game/logo/Pohang.jpg"  /></c:if>
			<c:if test="${home eq '�Ｚ'}"><img src="/toto/game/logo/samsung.jpg"  /></c:if>
			<c:if test="${home eq '�ؼ�'}"><img src="/toto/game/logo/nexen.jpg"  /></c:if>
			<c:if test="${home eq '�λ�'}"><img src="/toto/game/logo/doosan.jpg"  /></c:if>
			<c:if test="${home eq 'NC'}"><img src="/toto/game/logo/nc.jpg"  /></c:if>
			<c:if test="${home eq '��ȭ'}"><img src="/toto/game/logo/hanwhae.jpg"  /></c:if>
			<c:if test="${home eq 'KIA'}"><img src="/toto/game/logo/tigers.jpg"  /></c:if>
			<c:if test="${home eq 'SK'}"><img src="/toto/game/logo/sk.jpg"  /></c:if>
			<c:if test="${home eq '�Ե�'}"><img src="/toto/game/logo/giants.jpg"  /></c:if>
			<c:if test="${home eq 'LG'}"><img src="/toto/game/logo/lg.jpg"  /></c:if>
			<c:if test="${home eq 'KT'}"><img src="/toto/game/logo/kt.jpg"  /></c:if>
			<c:if test="${home eq '�������½�'}"><img src="/toto/game/logo/Goyang.jpg"  /></c:if>
			<c:if test="${home eq '�λ�KT'}"><img src="/toto/game/logo/BusanKt.jpg"  /></c:if>
			<c:if test="${home eq '���ֵ���'}"><img src="/toto/game/logo/Wonju.jpg"  /></c:if>
			<c:if test="${home eq '����SK'}"><img src="/toto/game/logo/SeoulSk.jpg"  /></c:if>
			<c:if test="${home eq '�����'}"><img src="/toto/game/logo/UlsanDongbu.jpg"  /></c:if>
			<c:if test="${home eq '����KCC'}"><img src="/toto/game/logo/Jeonju.jpg"  /></c:if>
			<c:if test="${home eq 'â��LG'}"><img src="/toto/game/logo/Changwon.jpg"  /></c:if>
			<c:if test="${home eq '��õ���ڷ���'}"><img src="/toto/game/logo/Incheon.jpg"  /></c:if>
			<c:if test="${home eq '�Ⱦ�KGC'}"><img src="/toto/game/logo/Anyang.jpg"  /></c:if>
			<c:if test="${home eq '����Ｚ'}"><img src="/toto/game/logo/SeoulSamsung.jpg"  /></c:if>
			
			
		</td>
		<td colspan="1">${home}</td>
		<td colspan="1" bgcolor="#E7E7E7">����<br />[���׼���]</td>
		<td colspan="1">${away}</td>
		<td colspan="1">
			<c:if test="${away eq '���'}"><img src="/toto/game/logo/Ulsan.jpg" /></c:if>		
			<c:if test="${away eq '����'}"><img src="/toto/game/logo/Suwon.jpg" /></c:if>		
			<c:if test="${away eq '����'}"><img src="/toto/game/logo/Seongnam.jpg" /></c:if>		
			<c:if test="${away eq '�λ�'}"><img src="/toto/game/logo/Busan.jpg" /></c:if>		
			<c:if test="${away eq '����'}"><img src="/toto/game/logo/Daejeon.jpg" /></c:if>		
			<c:if test="${away eq '����'}"><img src="/toto/game/logo/Gwangju.jpg" /></c:if>		
			<c:if test="${away eq '����'}"><img src="/toto/game/logo/Seoul.jpg" /></c:if>		
			<c:if test="${away eq '��õ'}"><img src="/toto/game/logo/Incheon.jpg" /></c:if>		
			<c:if test="${away eq '����'}"><img src="/toto/game/logo/Jeonnam.jpg" /></c:if>		
			<c:if test="${away eq '����'}"><img src="/toto/game/logo/Jeonbuk.jpg" /></c:if>		
			<c:if test="${away eq '����'}"><img src="/toto/game/logo/Jeju.jpg" /></c:if>		
			<c:if test="${away eq '����'}"><img src="/toto/game/logo/Pohang.jpg" /></c:if>
			<c:if test="${away eq '�Ｚ'}"><img src="/toto/game/logo/samsung.jpg"  /></c:if>
			<c:if test="${away eq '�ؼ�'}"><img src="/toto/game/logo/nexen.jpg"  /></c:if>
			<c:if test="${away eq '�λ�'}"><img src="/toto/game/logo/doosan.jpg"  /></c:if>
			<c:if test="${away eq 'NC'}"><img src="/toto/game/logo/nc.jpg"  /></c:if>
			<c:if test="${away eq '��ȭ'}"><img src="/toto/game/logo/hanwhae.jpg"  /></c:if>
			<c:if test="${away eq 'KIA'}"><img src="/toto/game/logo/tigers.jpg"  /></c:if>
			<c:if test="${away eq 'SK'}"><img src="/toto/game/logo/sk.jpg"  /></c:if>
			<c:if test="${away eq '�Ե�'}"><img src="/toto/game/logo/giants.jpg"  /></c:if>
			<c:if test="${away eq 'LG'}"><img src="/toto/game/logo/lg.jpg"  /></c:if>
			<c:if test="${away eq 'KT'}"><img src="/toto/game/logo/kt.jpg"  /></c:if>
			<c:if test="${away eq '�������½�'}"><img src="/toto/game/logo/Goyang.jpg"  /></c:if>
			<c:if test="${away eq '�λ�KT'}"><img src="/toto/game/logo/BusanKt.jpg"  /></c:if>
			<c:if test="${away eq '���ֵ���'}"><img src="/toto/game/logo/Wonju.jpg"  /></c:if>
			<c:if test="${away eq '����SK'}"><img src="/toto/game/logo/SeoulSk.jpg"  /></c:if>
			<c:if test="${away eq '�����'}"><img src="/toto/game/logo/UlsanDongbu.jpg"  /></c:if>
			<c:if test="${away eq '����KCC'}"><img src="/toto/game/logo/Jeonju.jpg"  /></c:if>
			<c:if test="${away eq 'â��LG'}"><img src="/toto/game/logo/Changwon.jpg"  /></c:if>
			<c:if test="${away eq '��õ���ڷ���'}"><img src="/toto/game/logo/Incheon.jpg"  /></c:if>
			<c:if test="${away eq '�Ⱦ�KGC'}"><img src="/toto/game/logo/Anyang.jpg"  /></c:if>
			<c:if test="${away eq '����Ｚ'}"><img src="/toto/game/logo/SeoulSamsung.jpg"  /></c:if>
		</td>
	</tr>
	<tr align="center">
		<td colspan="2">��ü&nbsp;&nbsp;${TotalHomeWin}��&nbsp;&nbsp;${TotalHomeDraw}��&nbsp;&nbsp;${TotalHomeLose}��<br />
		Ȩ :&nbsp;&nbsp;${EachHomeWin_A}��&nbsp;&nbsp;${EachHomeDraw_A}��&nbsp;&nbsp;${EachHomeLose_A}��&nbsp;&nbsp;||&nbsp;&nbsp;
		���� :&nbsp;&nbsp;${EachAwayWin_A}��&nbsp;&nbsp;${EachAwayDraw_A}��&nbsp;&nbsp;${EachAwayLose_A}��
		</td>
		<td colspan="1" bgcolor="#E7E7E7">15'������</td>
		<td colspan="2">��ü&nbsp;&nbsp;${TotalAwayWin}��&nbsp;&nbsp;${TotalAwayDraw}��&nbsp;&nbsp;${TotalAwayLose}��<br />
		Ȩ :&nbsp;&nbsp;${EachHomeWin_B}��&nbsp;&nbsp;${EachHomeDraw_B}��&nbsp;&nbsp;${EachHomeLose_B}��&nbsp;&nbsp;||&nbsp;&nbsp;
		���� :&nbsp;&nbsp;${EachAwayWin_B}��&nbsp;&nbsp;${EachAwayDraw_B}��&nbsp;&nbsp;${EachAwayLose_B}��
		
		</td>
	</tr>
	<c:set var="MatchHomePoint" value="${(MatchHomeWin * 3) + (MatchHomeDraw * 1)}" />
	<c:set var="MatchAwayPoint" value="${(MatchAwayWin * 3) + (MatchAwayDraw * 1)}" />
	<tr align="center">
		<td colspan="2">${MatchHomeWin}��${MatchHomeDraw}��${MatchHomeLose}��[���� : ${MatchHomePoint}]</td>
		<td colspan="1" bgcolor="#E7E7E7">�´�� ���� / ����</td>
		<td colspan="2">${MatchAwayWin}��${MatchAwayDraw}��${MatchAwayLose}��[���� : ${MatchAwayPoint}]</td>
	</tr>
	<tr align="center">
		<td colspan="2">${HomeName}${HomePlay}${HomeWinPoint} : ${HomelosePoint} </td>
		<td colspan="1" bgcolor="#E7E7E7">�ֱ� �´�� ����</td>
		<td colspan="2">${AwayName}${AwayPlay}${AwayWinPoint} : ${AwaylosePoint} </td>
	</tr>
</table>

<br />
<br />
<center>
�� �´�� ������
</center>
<!-- �´�� �� ���� -->
<table border="1" width="800" align="center">
	<tr align="center" bgcolor="#E7E7E7">
		<td colspan="3">${home}</td>
		<td colspan="1"><img border="0" src="/toto/game/image/vs.gif"/></td>
		<td colspan="3">${away}</td>
	</tr>
	<tr align="center">
		<td bgcolor="#E7E7E7">���</td>
		<td bgcolor="#E7E7E7">����</td>
		<td bgcolor="#E7E7E7">Ȩ/����</td>
		<td bgcolor="#E7E7E7">����</td>
		<td bgcolor="#E7E7E7">Ȩ/����</td>
		<td bgcolor="#E7E7E7">����</td>
		<td bgcolor="#E7E7E7">���</td>
	</tr>
	<c:forEach var="MatchList_5" items="${MatchList_5}" >
		<tr align="center">
			<!-- ��� ��� ���ϱ� -->
			<td>
				<c:if test="${MatchList_5.home eq home}" >
					<c:if test="${MatchList_5.homesc eq '��'}" >
						<img border="0" src="/toto/game/image/win.gif"/>
					</c:if>
					<c:if test="${MatchList_5.homesc eq '��'}" >
						<img border="0" src="/toto/game/image/draw.gif"/>
					</c:if>
					<c:if test="${MatchList_5.homesc eq '��'}" >
						<img border="0" src="/toto/game/image/lose.gif"/>
					</c:if>
				</c:if>
				<c:if test="${MatchList_5.away eq home}" >
					<c:if test="${MatchList_5.awaysc eq '��'}" >
						<img border="0" src="/toto/game/image/win.gif"/>
					</c:if>
					<c:if test="${MatchList_5.awaysc eq '��'}" >
						<img border="0" src="/toto/game/image/draw.gif"/>
					</c:if>
					<c:if test="${MatchList_5.awaysc eq '��'}" >
						<img border="0" src="/toto/game/image/lose.gif"/>
					</c:if>
				</c:if>
			</td>
			<!-- ���� ���ϱ� -->
			<td>
				<c:if test="${MatchList_5.home eq home}" >
					<c:out value="${MatchList_5.homept}" />
				</c:if>
				<c:if test="${MatchList_5.away eq home}" >
					<c:out value="${MatchList_5.awaypt}" />		
				</c:if>
			</td>
			<!-- Ȩ/���� ���ϱ� -->
			<td>
				<c:if test="${MatchList_5.home eq home}" >
					<c:out value="Ȩ" />
				</c:if>
				<c:if test="${MatchList_5.away eq home}" >
					<c:out value="����" />
				</c:if>
			</td>
			<!-- ��� ���� ���ϱ� -->
			<td>
				<fmt:formatDate value="${MatchList_5.reg_date}" pattern="yyyy��MM��dd�� HH�� mm��"/>
			</td>
			<!-- Ȩ/���� ���ϱ� -->
			<td>
				<c:if test="${MatchList_5.home eq away}" >
					<c:out value="Ȩ" />
				</c:if>
				<c:if test="${MatchList_5.away eq away}" >
					<c:out value="����" />
				</c:if>
			</td>
			<!-- ���� ���ϱ� -->
			<td>
				<c:if test="${MatchList_5.home eq away}" >
					<c:out value="${MatchList_5.homept}" />
				</c:if>
				<c:if test="${MatchList_5.away eq away}" >
					<c:out value="${MatchList_5.awaypt}" />		
				</c:if>
			</td>
			<!-- ��� ��� ���ϱ� -->
			<td>
				<c:if test="${MatchList_5.home eq away}" >
					<c:if test="${MatchList_5.homesc eq '��'}" >
						<img border="0" src="/toto/game/image/win.gif"/>
					</c:if>
					<c:if test="${MatchList_5.homesc eq '��'}" >
						<img border="0" src="/toto/game/image/draw.gif"/>
					</c:if>
					<c:if test="${MatchList_5.homesc eq '��'}" >
						<img border="0" src="/toto/game/image/lose.gif"/>
					</c:if>
				</c:if>
				<c:if test="${MatchList_5.away eq away}" >
					<c:if test="${MatchList_5.awaysc eq '��'}" >
						<img border="0" src="/toto/game/image/win.gif"/>
					</c:if>
					<c:if test="${MatchList_5.awaysc eq '��'}" >
						<img border="0" src="/toto/game/image/draw.gif"/>
					</c:if>
					<c:if test="${MatchList_5.awaysc eq '��'}" >
						<img border="0" src="/toto/game/image/lose.gif"/>
					</c:if>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
</div>
