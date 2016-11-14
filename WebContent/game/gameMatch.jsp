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
		if(arg == "K리그"){
			num = new Array("전북","수원","전남","서울","포항","성남","인천","제주","광주","울산","부산","대전");
			vnum = new Array("전북","수원","전남","서울","포항","성남","인천","제주","광주","울산","부산","대전");
			num2 = new Array("수원","전북","전남","서울","포항","성남","인천","제주","광주","울산","부산","대전");
			vnum2 = new Array("수원","전북","전남","서울","포항","성남","인천","제주","광주","울산","부산","대전");
		}else if(arg == "KBO"){
			num = new Array("한화","롯데","넥센","NC","두산","SK","KIA","삼성","LG","KT");
			vnum = new Array("한화","롯데","넥센","NC","두산","SK","KIA","삼성","LG","KT");
			num2 = new Array("롯데","한화","넥센","NC","두산","SK","KIA","삼성","LG","KT");
			vnum2 = new Array("롯데","한화","넥센","NC","두산","SK","KIA","삼성","LG","KT");
		}else if(arg == "KBL"){
			num = new Array("고양오리온스","부산KT","원주동부","서울SK","울산모비스","전주KCC","창원LG","인천전자랜드","안양KGC","서울삼성");
			vnum = new Array("고양오리온스","부산KT","원주동부","서울SK","울산모비스","전주KCC","창원LG","인천전자랜드","안양KGC","서울삼성");
			num2 = new Array("고양오리온스","부산KT","원주동부","서울SK","울산모비스","전주KCC","창원LG","인천전자랜드","안양KGC","서울삼성");
			vnum2 = new Array("고양오리온스","부산KT","원주동부","서울SK","울산모비스","전주KCC","창원LG","인천전자랜드","안양KGC","서울삼성");
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
		if(arg == "K리그"){
			num = new Array("${home}","전북","수원","전남","서울","포항","성남","인천","제주","광주","울산","부산","대전");
			vnum = new Array("${home}","전북","수원","전남","서울","포항","성남","인천","제주","광주","울산","부산","대전");
			num2 = new Array("${away}","수원","전북","전남","서울","포항","성남","인천","제주","광주","울산","부산","대전");
			vnum2 = new Array("${away}","수원","전북","전남","서울","포항","성남","인천","제주","광주","울산","부산","대전");
		}else if(arg == "KBO"){
			num = new Array("${home}","한화","롯데","넥센","NC","두산","SK","KIA","삼성","LG","KT");
			vnum = new Array("${home}","한화","롯데","넥센","NC","두산","SK","KIA","삼성","LG","KT");
			num2 = new Array("${away}","롯데","한화","넥센","NC","두산","SK","KIA","삼성","LG","KT");
			vnum2 = new Array("${away}","롯데","한화","넥센","NC","두산","SK","KIA","삼성","LG","KT");
		}else if(arg == "KBL"){
			num = new Array("${home}","고양오리온스","부산KT","원주동부","서울SK","울산모비스","전주KCC","창원LG","인천전자랜드","안양KGC","서울삼성");
			vnum = new Array("${home}","고양오리온스","부산KT","원주동부","서울SK","울산모비스","전주KCC","창원LG","인천전자랜드","안양KGC","서울삼성");
			num2 = new Array("${away}","고양오리온스","부산KT","원주동부","서울SK","울산모비스","전주KCC","창원LG","인천전자랜드","안양KGC","서울삼성");
			vnum2 = new Array("${away}","고양오리온스","부산KT","원주동부","서울SK","울산모비스","전주KCC","창원LG","인천전자랜드","안양KGC","서울삼성");
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
			<c:if test="${league eq 'K리그'}" >
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
	<input type="hidden" name="flag" value="경기종료" />
	<table align="center">
		<tr>
			<td>맞대결팀 선택 :</td>
			<td>
				<select name="league" id="ctg" onchange="chk(this.value);">
					<c:if test="${league ne null}">
						<option value="${league}">${league}</option>
					</c:if>
					<option value="K리그">K리그</option>
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
<!-- 초기화 -->
<c:set var="TotalHomeWin"   value="${0}"/>	<c:set var="TotalAwayWin"   value="${0}"/>	<c:set var="MatchHomeWin"  value="${0}"/>	
<c:set var="TotalHomeDraw"  value="${0}"/>	<c:set var="TotalAwayDraw"  value="${0}"/>	<c:set var="MatchHomeDraw" value="${0}"/>
<c:set var="TotalHomeLose"  value="${0}"/>	<c:set var="TotalAwayLose"  value="${0}"/>	<c:set var="MatchHomeLose" value="${0}"/>
<c:set var="EachHomeWin_A"  value="${0}"/>	<c:set var="EachHomeWin_B"  value="${0}"/>	<c:set var="MatchAwayWin"  value="${0}"/>
<c:set var="EachHomeDraw_A" value="${0}"/>	<c:set var="EachHomeDraw_B" value="${0}"/>	<c:set var="MatchAwayDraw" value="${0}"/>
<c:set var="EachHomeLose_A" value="${0}"/>	<c:set var="EachHomeLose_B" value="${0}"/>	<c:set var="MatchAwayLose" value="${0}"/>
<c:set var="EachAwayWin_A"  value="${0}"/>	<c:set var="EachAwayWin_B"  value="${0}"/>
<c:set var="EachAwayDraw_A" value="${0}"/>	<c:set var="EachAwayDraw_B" value="${0}"/>
<c:set var="EachAwayLose_A" value="${0}"/>	<c:set var="EachAwayLose_B" value="${0}"/>


<!-- 맞대결 해당팀 정보만 -->
<c:forEach var="MatchList" items="${MatchList}" >
	<!-- 맞대결 A팀 홈일때 승리 -->
	<c:if test="${MatchList.home eq home}" >
		<c:if test="${MatchList.homesc eq '승'}" >
			<c:set var="MatchHomeWin" value="${MatchHomeWin + 1}" />
		</c:if>
	</c:if>
	<!-- 맞대결 A팀 원정일때 승리 -->
	<c:if test="${MatchList.away eq home}" >
		<c:if test="${MatchList.awaysc eq '승'}" >
			<c:set var="MatchHomeWin" value="${MatchHomeWin + 1}" />
		</c:if>
	</c:if>
	<!-- 맞대결 A팀 홈일때 무승부 -->
	<c:if test="${MatchList.home eq home}" >
		<c:if test="${MatchList.homesc eq '무'}" >
			<c:set var="MatchHomeDraw" value="${MatchHomeDraw + 1}" />
		</c:if>
	</c:if>
	<!-- 맞대결 A팀 원정일때 무승부 -->
	<c:if test="${MatchList.away eq home}" >
		<c:if test="${MatchList.awaysc eq '무'}" >
			<c:set var="MatchHomeDraw" value="${MatchHomeDraw + 1}" />
		</c:if>
	</c:if>
	<!-- 맞대결 A팀 홈일때 패배 -->
	<c:if test="${MatchList.home eq home}" >
		<c:if test="${MatchList.homesc eq '패'}" >
			<c:set var="MatchHomeLose" value="${MatchHomeLose + 1}" />
		</c:if>
	</c:if>
	<!-- 맞대결 A팀 원정일때 패배 -->
	<c:if test="${MatchList.away eq home}" >
		<c:if test="${MatchList.awaysc eq '패'}" >
			<c:set var="MatchHomeLose" value="${MatchHomeLose + 1}" />
		</c:if>
	</c:if>

<!--  ---------------------------- -->	
	<!-- 맞대결 B팀 홈일때 승리 -->
	<c:if test="${MatchList.home eq away}" >
		<c:if test="${MatchList.homesc eq '승'}" >
			<c:set var="MatchAwayWin" value="${MatchAwayWin + 1}" />
		</c:if>
	</c:if>
	<!-- 맞대결 B팀 원정일때 승리 -->
	<c:if test="${MatchList.away eq away}" >
		<c:if test="${MatchList.awaysc eq '승'}" >
			<c:set var="MatchAwayWin" value="${MatchAwayWin + 1}" />
		</c:if>
	</c:if>
	<!-- 맞대결 B팀 홈일때 무승부 -->
	<c:if test="${MatchList.home eq away}" >
		<c:if test="${MatchList.homesc eq '무'}" >
			<c:set var="MatchAwayDraw" value="${MatchAwayDraw + 1}" />
		</c:if>
	</c:if>
	<!-- 맞대결 B팀 원정일때 무승부 -->
	<c:if test="${MatchList.away eq away}" >
		<c:if test="${MatchList.awaysc eq '무'}" >
			<c:set var="MatchAwayDraw" value="${MatchAwayDraw + 1}" />
		</c:if>
	</c:if>
	<!-- 맞대결 B팀 홈일때 패배 -->
	<c:if test="${MatchList.home eq away}" >
		<c:if test="${MatchList.homesc eq '패'}" >
			<c:set var="MatchAwayLose" value="${MatchAwayLose + 1}" />
		</c:if>
	</c:if>
	<!-- 맞대결 B팀 원정일때 패배 -->
	<c:if test="${MatchList.away eq away}" >
		<c:if test="${MatchList.awaysc eq '패'}" >
			<c:set var="MatchAwayLose" value="${MatchAwayLose + 1}" />
		</c:if>
	</c:if>
</c:forEach>

<!-- 맞대결 전체팀 정보 -->
<c:forEach var="AllMatchList" items="${AllMatchList}">
	<!-- A팀 전체 성적(승) -->
	<c:if test="${(AllMatchList.home eq home && AllMatchList.homesc eq '승') ||
				  (AllMatchList.away eq home && AllMatchList.awaysc eq '승')}">
			<c:set var="TotalHomeWin" value="${TotalHomeWin+1}"/>
			<!-- A팀 홈 성적(승) -->
			<c:if test="${AllMatchList.home eq home && AllMatchList.homesc eq '승'}">
				<c:set var="EachHomeWin_A" value="${EachHomeWin_A + 1}" />
			</c:if>
			<!-- A팀 원정 성적(승) -->
			<c:if test="${AllMatchList.away eq home && AllMatchList.awaysc eq '승'}">
				<c:set var="EachAwayWin_A" value="${EachAwayWin_A + 1}" />
			</c:if>
	</c:if>
	<!-- A팀 전체 성적(무) -->
	<c:if test="${(AllMatchList.home eq home && AllMatchList.homesc eq '무') ||
				  (AllMatchList.away eq home && AllMatchList.awaysc eq '무')}">
			<c:set var="TotalHomeDraw" value="${TotalHomeDraw+1}"/>
			<!-- A팀 홈 성적(무) -->
			<c:if test="${AllMatchList.home eq home && AllMatchList.homesc eq '무'}">
				<c:set var="EachHomeDraw_A" value="${EachHomeDraw_A + 1}" />
			</c:if>
			<!-- A팀 원정 성적(무) -->
			<c:if test="${AllMatchList.away eq home && AllMatchList.awaysc eq '무'}">
				<c:set var="EachAwayDraw_A" value="${EachAwayDraw_A + 1}" />
			</c:if>
	</c:if>
	<!-- A팀 전체 성적(패) -->
	<c:if test="${(AllMatchList.home eq home && AllMatchList.homesc eq '패') ||
				  (AllMatchList.away eq home && AllMatchList.awaysc eq '패')}">
			<c:set var="TotalHomeLose" value="${TotalHomeLose+1}"/>
			<!-- A팀 홈 성적(패) -->
			<c:if test="${AllMatchList.home eq home && AllMatchList.homesc eq '패'}">
				<c:set var="EachHomeLose_A" value="${EachHomeLose_A + 1}" />
			</c:if>
			<!-- A팀 원정 성적(패) -->
			<c:if test="${AllMatchList.away eq home && AllMatchList.awaysc eq '패'}">
				<c:set var="EachAwayLose_A" value="${EachAwayLose_A + 1}" />
			</c:if>
	</c:if>
	
	<!-- B팀 전체 성적(승) -->
	<c:if test="${(AllMatchList.home eq away && AllMatchList.homesc eq '승') ||
				  (AllMatchList.away eq away && AllMatchList.awaysc eq '승')}">
			<c:set var="TotalAwayWin" value="${TotalAwayWin+1}"/>
			<!-- B팀 홈 성적(승) -->
			<c:if test="${AllMatchList.home eq away && AllMatchList.homesc eq '승'}">
				<c:set var="EachHomeWin_B" value="${EachHomeWin_B + 1}" />
			</c:if>
			<!-- B팀 원정 성적(승) -->
			<c:if test="${AllMatchList.away eq away && AllMatchList.awaysc eq '승'}">
				<c:set var="EachAwayWin_B" value="${EachAwayWin_B + 1}" />
			</c:if>
	</c:if>
	<!-- B팀 전체 성적(무) -->
	<c:if test="${(AllMatchList.home eq away && AllMatchList.homesc eq '무') ||
				  (AllMatchList.away eq away && AllMatchList.awaysc eq '무')}">
			<c:set var="TotalAwayDraw" value="${TotalAwayDraw+1}"/>
			<!-- B팀 홈 성적(무) -->
			<c:if test="${AllMatchList.home eq away && AllMatchList.homesc eq '무'}">
				<c:set var="EachHomeDraw_B" value="${EachHomeDraw_B + 1}" />
			</c:if>
			<!-- B팀 원정 성적(무) -->
			<c:if test="${AllMatchList.away eq away && AllMatchList.awaysc eq '무'}">
				<c:set var="EachAwayDraw_B" value="${EachAwayDraw_B + 1}" />
			</c:if>
	</c:if>
	<!-- B팀 전체 성적(패) -->
	<c:if test="${(AllMatchList.home eq away && AllMatchList.homesc eq '패') ||
				  (AllMatchList.away eq away && AllMatchList.awaysc eq '패')}">
			<c:set var="TotalAwayLose" value="${TotalAwayLose+1}"/>
			<!-- B팀 홈 성적(패) -->
			<c:if test="${AllMatchList.home eq away && AllMatchList.homesc eq '패'}">
				<c:set var="EachHomeLose_B" value="${EachHomeLose_B + 1}" />
			</c:if>
			<!-- B팀 원정 성적(패) -->
			<c:if test="${AllMatchList.away eq away && AllMatchList.awaysc eq '패'}">
				<c:set var="EachAwayLose_B" value="${EachAwayLose_B + 1}" />
			</c:if>
	</c:if>
	
</c:forEach>


<c:forEach var="RecentlyMatch" items="${RecentlyMatch}" >
	<c:if test="${RecentlyMatch.home eq home}" >
		<c:set var="HomeName" value="홈" />
		<c:set var="HomePlay" value="${RecentlyMatch.homesc}" />
		<c:set var="HomeWinPoint" value="${RecentlyMatch.homept}" />
		<c:set var="HomelosePoint" value="${RecentlyMatch.awaypt}" />
	</c:if>
	<c:if test="${RecentlyMatch.away eq home}" >
		<c:set var="HomeName" value="원정" />
		<c:set var="HomePlay" value="${RecentlyMatch.awaysc}" />
		<c:set var="HomeWinPoint" value="${RecentlyMatch.awaypt}" />
		<c:set var="HomelosePoint" value="${RecentlyMatch.homept}" />
	</c:if>
	
	<c:if test="${RecentlyMatch.home eq away}" >
		<c:set var="AwayName" value="홈" />
		<c:set var="AwayPlay" value="${RecentlyMatch.homesc}" />
		<c:set var="AwayWinPoint" value="${RecentlyMatch.homept}" />
		<c:set var="AwaylosePoint" value="${RecentlyMatch.awaypt}" />
	</c:if>
	<c:if test="${RecentlyMatch.away eq away}" >
		<c:set var="AwayName" value="원정" />
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
			<c:if test="${home eq '울산'}"><img src="/toto/game/logo/Ulsan.jpg" /></c:if>		
			<c:if test="${home eq '수원'}"><img src="/toto/game/logo/Suwon.jpg" /></c:if>		
			<c:if test="${home eq '성남'}"><img src="/toto/game/logo/Seongnam.jpg" /></c:if>		
			<c:if test="${home eq '부산'}"><img src="/toto/game/logo/Busan.jpg" /></c:if>		
			<c:if test="${home eq '대전'}"><img src="/toto/game/logo/Daejeon.jpg" /></c:if>		
			<c:if test="${home eq '광주'}"><img src="/toto/game/logo/Gwangju.jpg" /></c:if>		
			<c:if test="${home eq '서울'}"><img src="/toto/game/logo/Seoul.jpg"   /></c:if>		
			<c:if test="${home eq '인천'}"><img src="/toto/game/logo/Incheon.jpg" /></c:if>		
			<c:if test="${home eq '전남'}"><img src="/toto/game/logo/Jeonnam.jpg" /></c:if>		
			<c:if test="${home eq '전북'}"><img src="/toto/game/logo/Jeonbuk.jpg" /></c:if>		
			<c:if test="${home eq '제주'}"><img src="/toto/game/logo/Jeju.jpg" 	  /></c:if>		
			<c:if test="${home eq '포항'}"><img src="/toto/game/logo/Pohang.jpg"  /></c:if>
			<c:if test="${home eq '삼성'}"><img src="/toto/game/logo/samsung.jpg"  /></c:if>
			<c:if test="${home eq '넥센'}"><img src="/toto/game/logo/nexen.jpg"  /></c:if>
			<c:if test="${home eq '두산'}"><img src="/toto/game/logo/doosan.jpg"  /></c:if>
			<c:if test="${home eq 'NC'}"><img src="/toto/game/logo/nc.jpg"  /></c:if>
			<c:if test="${home eq '한화'}"><img src="/toto/game/logo/hanwhae.jpg"  /></c:if>
			<c:if test="${home eq 'KIA'}"><img src="/toto/game/logo/tigers.jpg"  /></c:if>
			<c:if test="${home eq 'SK'}"><img src="/toto/game/logo/sk.jpg"  /></c:if>
			<c:if test="${home eq '롯데'}"><img src="/toto/game/logo/giants.jpg"  /></c:if>
			<c:if test="${home eq 'LG'}"><img src="/toto/game/logo/lg.jpg"  /></c:if>
			<c:if test="${home eq 'KT'}"><img src="/toto/game/logo/kt.jpg"  /></c:if>
			<c:if test="${home eq '고양오리온스'}"><img src="/toto/game/logo/Goyang.jpg"  /></c:if>
			<c:if test="${home eq '부산KT'}"><img src="/toto/game/logo/BusanKt.jpg"  /></c:if>
			<c:if test="${home eq '원주동부'}"><img src="/toto/game/logo/Wonju.jpg"  /></c:if>
			<c:if test="${home eq '서울SK'}"><img src="/toto/game/logo/SeoulSk.jpg"  /></c:if>
			<c:if test="${home eq '울산모비스'}"><img src="/toto/game/logo/UlsanDongbu.jpg"  /></c:if>
			<c:if test="${home eq '전주KCC'}"><img src="/toto/game/logo/Jeonju.jpg"  /></c:if>
			<c:if test="${home eq '창원LG'}"><img src="/toto/game/logo/Changwon.jpg"  /></c:if>
			<c:if test="${home eq '인천전자랜드'}"><img src="/toto/game/logo/Incheon.jpg"  /></c:if>
			<c:if test="${home eq '안양KGC'}"><img src="/toto/game/logo/Anyang.jpg"  /></c:if>
			<c:if test="${home eq '서울삼성'}"><img src="/toto/game/logo/SeoulSamsung.jpg"  /></c:if>
			
			
		</td>
		<td colspan="1">${home}</td>
		<td colspan="1" bgcolor="#E7E7E7">팀명<br />[리그순위]</td>
		<td colspan="1">${away}</td>
		<td colspan="1">
			<c:if test="${away eq '울산'}"><img src="/toto/game/logo/Ulsan.jpg" /></c:if>		
			<c:if test="${away eq '수원'}"><img src="/toto/game/logo/Suwon.jpg" /></c:if>		
			<c:if test="${away eq '성남'}"><img src="/toto/game/logo/Seongnam.jpg" /></c:if>		
			<c:if test="${away eq '부산'}"><img src="/toto/game/logo/Busan.jpg" /></c:if>		
			<c:if test="${away eq '대전'}"><img src="/toto/game/logo/Daejeon.jpg" /></c:if>		
			<c:if test="${away eq '광주'}"><img src="/toto/game/logo/Gwangju.jpg" /></c:if>		
			<c:if test="${away eq '서울'}"><img src="/toto/game/logo/Seoul.jpg" /></c:if>		
			<c:if test="${away eq '인천'}"><img src="/toto/game/logo/Incheon.jpg" /></c:if>		
			<c:if test="${away eq '전남'}"><img src="/toto/game/logo/Jeonnam.jpg" /></c:if>		
			<c:if test="${away eq '전북'}"><img src="/toto/game/logo/Jeonbuk.jpg" /></c:if>		
			<c:if test="${away eq '제주'}"><img src="/toto/game/logo/Jeju.jpg" /></c:if>		
			<c:if test="${away eq '포항'}"><img src="/toto/game/logo/Pohang.jpg" /></c:if>
			<c:if test="${away eq '삼성'}"><img src="/toto/game/logo/samsung.jpg"  /></c:if>
			<c:if test="${away eq '넥센'}"><img src="/toto/game/logo/nexen.jpg"  /></c:if>
			<c:if test="${away eq '두산'}"><img src="/toto/game/logo/doosan.jpg"  /></c:if>
			<c:if test="${away eq 'NC'}"><img src="/toto/game/logo/nc.jpg"  /></c:if>
			<c:if test="${away eq '한화'}"><img src="/toto/game/logo/hanwhae.jpg"  /></c:if>
			<c:if test="${away eq 'KIA'}"><img src="/toto/game/logo/tigers.jpg"  /></c:if>
			<c:if test="${away eq 'SK'}"><img src="/toto/game/logo/sk.jpg"  /></c:if>
			<c:if test="${away eq '롯데'}"><img src="/toto/game/logo/giants.jpg"  /></c:if>
			<c:if test="${away eq 'LG'}"><img src="/toto/game/logo/lg.jpg"  /></c:if>
			<c:if test="${away eq 'KT'}"><img src="/toto/game/logo/kt.jpg"  /></c:if>
			<c:if test="${away eq '고양오리온스'}"><img src="/toto/game/logo/Goyang.jpg"  /></c:if>
			<c:if test="${away eq '부산KT'}"><img src="/toto/game/logo/BusanKt.jpg"  /></c:if>
			<c:if test="${away eq '원주동부'}"><img src="/toto/game/logo/Wonju.jpg"  /></c:if>
			<c:if test="${away eq '서울SK'}"><img src="/toto/game/logo/SeoulSk.jpg"  /></c:if>
			<c:if test="${away eq '울산모비스'}"><img src="/toto/game/logo/UlsanDongbu.jpg"  /></c:if>
			<c:if test="${away eq '전주KCC'}"><img src="/toto/game/logo/Jeonju.jpg"  /></c:if>
			<c:if test="${away eq '창원LG'}"><img src="/toto/game/logo/Changwon.jpg"  /></c:if>
			<c:if test="${away eq '인천전자랜드'}"><img src="/toto/game/logo/Incheon.jpg"  /></c:if>
			<c:if test="${away eq '안양KGC'}"><img src="/toto/game/logo/Anyang.jpg"  /></c:if>
			<c:if test="${away eq '서울삼성'}"><img src="/toto/game/logo/SeoulSamsung.jpg"  /></c:if>
		</td>
	</tr>
	<tr align="center">
		<td colspan="2">전체&nbsp;&nbsp;${TotalHomeWin}승&nbsp;&nbsp;${TotalHomeDraw}무&nbsp;&nbsp;${TotalHomeLose}패<br />
		홈 :&nbsp;&nbsp;${EachHomeWin_A}승&nbsp;&nbsp;${EachHomeDraw_A}무&nbsp;&nbsp;${EachHomeLose_A}패&nbsp;&nbsp;||&nbsp;&nbsp;
		원정 :&nbsp;&nbsp;${EachAwayWin_A}승&nbsp;&nbsp;${EachAwayDraw_A}무&nbsp;&nbsp;${EachAwayLose_A}패
		</td>
		<td colspan="1" bgcolor="#E7E7E7">15'시즌성적</td>
		<td colspan="2">전체&nbsp;&nbsp;${TotalAwayWin}승&nbsp;&nbsp;${TotalAwayDraw}무&nbsp;&nbsp;${TotalAwayLose}패<br />
		홈 :&nbsp;&nbsp;${EachHomeWin_B}승&nbsp;&nbsp;${EachHomeDraw_B}무&nbsp;&nbsp;${EachHomeLose_B}패&nbsp;&nbsp;||&nbsp;&nbsp;
		원정 :&nbsp;&nbsp;${EachAwayWin_B}승&nbsp;&nbsp;${EachAwayDraw_B}무&nbsp;&nbsp;${EachAwayLose_B}패
		
		</td>
	</tr>
	<c:set var="MatchHomePoint" value="${(MatchHomeWin * 3) + (MatchHomeDraw * 1)}" />
	<c:set var="MatchAwayPoint" value="${(MatchAwayWin * 3) + (MatchAwayDraw * 1)}" />
	<tr align="center">
		<td colspan="2">${MatchHomeWin}승${MatchHomeDraw}무${MatchHomeLose}패[승점 : ${MatchHomePoint}]</td>
		<td colspan="1" bgcolor="#E7E7E7">맞대결 전적 / 승점</td>
		<td colspan="2">${MatchAwayWin}승${MatchAwayDraw}무${MatchAwayLose}패[승점 : ${MatchAwayPoint}]</td>
	</tr>
	<tr align="center">
		<td colspan="2">${HomeName}${HomePlay}${HomeWinPoint} : ${HomelosePoint} </td>
		<td colspan="1" bgcolor="#E7E7E7">최근 맞대결 전적</td>
		<td colspan="2">${AwayName}${AwayPlay}${AwayWinPoint} : ${AwaylosePoint} </td>
	</tr>
</table>

<br />
<br />
<center>
● 맞대결 상세전적
</center>
<!-- 맞대결 상세 전적 -->
<table border="1" width="800" align="center">
	<tr align="center" bgcolor="#E7E7E7">
		<td colspan="3">${home}</td>
		<td colspan="1"><img border="0" src="/toto/game/image/vs.gif"/></td>
		<td colspan="3">${away}</td>
	</tr>
	<tr align="center">
		<td bgcolor="#E7E7E7">결과</td>
		<td bgcolor="#E7E7E7">득점</td>
		<td bgcolor="#E7E7E7">홈/원정</td>
		<td bgcolor="#E7E7E7">일자</td>
		<td bgcolor="#E7E7E7">홈/원정</td>
		<td bgcolor="#E7E7E7">득점</td>
		<td bgcolor="#E7E7E7">결과</td>
	</tr>
	<c:forEach var="MatchList_5" items="${MatchList_5}" >
		<tr align="center">
			<!-- 경기 결과 구하기 -->
			<td>
				<c:if test="${MatchList_5.home eq home}" >
					<c:if test="${MatchList_5.homesc eq '승'}" >
						<img border="0" src="/toto/game/image/win.gif"/>
					</c:if>
					<c:if test="${MatchList_5.homesc eq '무'}" >
						<img border="0" src="/toto/game/image/draw.gif"/>
					</c:if>
					<c:if test="${MatchList_5.homesc eq '패'}" >
						<img border="0" src="/toto/game/image/lose.gif"/>
					</c:if>
				</c:if>
				<c:if test="${MatchList_5.away eq home}" >
					<c:if test="${MatchList_5.awaysc eq '승'}" >
						<img border="0" src="/toto/game/image/win.gif"/>
					</c:if>
					<c:if test="${MatchList_5.awaysc eq '무'}" >
						<img border="0" src="/toto/game/image/draw.gif"/>
					</c:if>
					<c:if test="${MatchList_5.awaysc eq '패'}" >
						<img border="0" src="/toto/game/image/lose.gif"/>
					</c:if>
				</c:if>
			</td>
			<!-- 득점 구하기 -->
			<td>
				<c:if test="${MatchList_5.home eq home}" >
					<c:out value="${MatchList_5.homept}" />
				</c:if>
				<c:if test="${MatchList_5.away eq home}" >
					<c:out value="${MatchList_5.awaypt}" />		
				</c:if>
			</td>
			<!-- 홈/원정 구하기 -->
			<td>
				<c:if test="${MatchList_5.home eq home}" >
					<c:out value="홈" />
				</c:if>
				<c:if test="${MatchList_5.away eq home}" >
					<c:out value="원정" />
				</c:if>
			</td>
			<!-- 경기 일정 구하기 -->
			<td>
				<fmt:formatDate value="${MatchList_5.reg_date}" pattern="yyyy년MM월dd일 HH시 mm분"/>
			</td>
			<!-- 홈/원정 구하기 -->
			<td>
				<c:if test="${MatchList_5.home eq away}" >
					<c:out value="홈" />
				</c:if>
				<c:if test="${MatchList_5.away eq away}" >
					<c:out value="원정" />
				</c:if>
			</td>
			<!-- 득점 구하기 -->
			<td>
				<c:if test="${MatchList_5.home eq away}" >
					<c:out value="${MatchList_5.homept}" />
				</c:if>
				<c:if test="${MatchList_5.away eq away}" >
					<c:out value="${MatchList_5.awaypt}" />		
				</c:if>
			</td>
			<!-- 경기 결과 구하기 -->
			<td>
				<c:if test="${MatchList_5.home eq away}" >
					<c:if test="${MatchList_5.homesc eq '승'}" >
						<img border="0" src="/toto/game/image/win.gif"/>
					</c:if>
					<c:if test="${MatchList_5.homesc eq '무'}" >
						<img border="0" src="/toto/game/image/draw.gif"/>
					</c:if>
					<c:if test="${MatchList_5.homesc eq '패'}" >
						<img border="0" src="/toto/game/image/lose.gif"/>
					</c:if>
				</c:if>
				<c:if test="${MatchList_5.away eq away}" >
					<c:if test="${MatchList_5.awaysc eq '승'}" >
						<img border="0" src="/toto/game/image/win.gif"/>
					</c:if>
					<c:if test="${MatchList_5.awaysc eq '무'}" >
						<img border="0" src="/toto/game/image/draw.gif"/>
					</c:if>
					<c:if test="${MatchList_5.awaysc eq '패'}" >
						<img border="0" src="/toto/game/image/lose.gif"/>
					</c:if>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
</div>
