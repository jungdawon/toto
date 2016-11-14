<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/teaminfomation/teamMenu.jsp" %>
<br />
<br />
<br />
<html>
<head>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 230px;
	width: 1150px;}
  }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>경기정보입력</title>
</head>
<body>
<div id=text>
<br />
<br />
<br />
<br />
<table align="center" width="800" border="0">
	<tr align="left">
		<td>
			<font size="4">경기 일정</font>	&nbsp;&nbsp;
			<img src="/toto/game/image/register.gif" />
		</td>
	</tr>
	<tr>
		<td><img src="/toto/admin/image/line.png" width="800"/></td>
	</tr>
</table>
<br />



<center>
	<div id="gInputForm">
		<jsp:include page="/game/gameInputForm.to" flush="false"/>
	</div>
</center>
<br />
<form method="post" action="/toto/game/gameInputPro.to">
<table align="center" border="1">
	<input type="hidden" name="league" value="${dto.league }">
	<c:if test="${dto.league == null }">
		<tr>
		<td colspan="2">※리그를 선택해주세요 </td>
		</tr>
	</c:if>
	<c:if test="${dto.league == 'K리그' }">
		<tr>
			<td bgcolor="#FAED7D" align="center">홈팀</td>
			<td>
				<select name="home">
					<option value="">선택</option>
					<option value="전북">전북</option>	
					<option value="수원">수원</option>		
					<option value="전남">전남</option>
					<option value="서울">서울</option>
					<option value="포항">포항</option>
					<option value="성남">성남</option>
					<option value="인천">인천</option>
					<option value="제주">제주</option>
					<option value="광주">광주</option>
					<option value="울산">울산</option>
					<option value="부산">부산</option>
					<option value="대전">대전</option>
				</select>
			</td>
			<td bgcolor="#FAED7D" align="center">어웨이팀</td>
			<td>
				<select name="away">
					<option value="">선택</option>
					<option value="전북">전북</option>	
					<option value="수원">수원</option>		
					<option value="전남">전남</option>
					<option value="서울">서울</option>
					<option value="포항">포항</option>
					<option value="성남">성남</option>
					<option value="인천">인천</option>
					<option value="제주">제주</option>
					<option value="광주">광주</option>
					<option value="울산">울산</option>
					<option value="부산">부산</option>
					<option value="대전">대전</option>
				</select>
			</td>
		</tr>
	</c:if>

<c:if test="${dto.league == 'KBO' }">
	<tr>
		<td bgcolor="#FAED7D" align="center">홈팀</td>
		<td>
			<select name="home">
				<option value="">선택</option>
				<option value="삼성">삼성</option>	
				<option value="NC">NC</option>		
				<option value="두산">두산</option>
				<option value="넥센">넥센</option>
				<option value="한화">한화</option>
				<option value="KIA">KIA</option>
				<option value="SK">SK</option>
				<option value="롯데">롯데</option>
				<option value="LG">LG</option>
				<option value="KT">KT</option>
			</select>
		</td>
		<td bgcolor="#FAED7D" align="center">어웨이팀</td>
		<td>
			<select name="away">
				<option value="">선택</option>
				<option value="삼성">삼성</option>	
				<option value="NC">NC</option>		
				<option value="두산">두산</option>
				<option value="넥센">넥센</option>
				<option value="한화">한화</option>
				<option value="KIA">KIA</option>
				<option value="SK">SK</option>
				<option value="롯데">롯데</option>
				<option value="LG">LG</option>
				<option value="KT">KT</option>
			</select>
		</td>
	</tr>
</c:if>

<c:if test="${dto.league == 'KBL' }">
	<tr>
		<td bgcolor="#FAED7D" align="center">홈팀</td>
		<td>
			<select name="home">
				<option value="">선택</option>
				<option value="울산모비스">울산모비스</option>	
				<option value="서울SK">서울SK</option>		
				<option value="원주동부">원주동부</option>
				<option value="부산KT">부산KT</option>
				<option value="안양KGC">안양KGC</option>
				<option value="고양오리온스">고양오리온스</option>
				<option value="창원LG">창원LG</option>
				<option value="인천전자랜드">인천전자랜드</option>
				<option value="서울삼성">서울삼성</option>
				<option value="전주KCC">전주KCC</option>
			</select>
		</td>
		<td bgcolor="#FAED7D" align="center">어웨이팀</td>
		<td>
			<select name="away">
				<option value="">선택</option>
				<option value="울산모비스">울산모비스</option>	
				<option value="서울SK">서울SK</option>		
				<option value="원주동부">원주동부</option>
				<option value="부산KT">부산KT</option>
				<option value="안양KGC">안양KGC</option>
				<option value="고양오리온스">고양오리온스</option>
				<option value="창원LG">창원LG</option>
				<option value="인천전자랜드">인천전자랜드</option>
				<option value="서울삼성">서울삼성</option>
				<option value="전주KCC">전주KCC</option>
			</select>
		</td>
	</tr>
</c:if>

<tr>
	<td bgcolor="#FAED7D" align="center">경기날짜</td>
	<td colspan="3"><input type="text" name="dat" value="">ex)20150505</td>
</tr>

<tr>
	<td bgcolor="#FAED7D" align="center">경기시간</td>
	<td colspan="3">
		<select name="hh">
			<option value="">선택</option>
			<option value="01">01</option>
			<option value="02">02</option>
			<option value="03">03</option>
			<option value="04">04</option>
			<option value="05">05</option>
			<option value="06">06</option>
			<option value="07">07</option>
			<option value="08">08</option>
			<option value="09">09</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
			<option value="22">22</option>
			<option value="23">23</option>
			<option value="24">24</option>
		</select>시&nbsp;
		<select name="min">
		<option value="">선택</option>
			<option value="00">00</option>
			<option value="15">10</option>
			<option value="30">20</option>
			<option value="15">30</option>
			<option value="30">40</option>
			<option value="30">50</option>
		</select>분
	</td>
</tr>

<tr>
	<td bgcolor="#FAED7D" align="center">경기상황</td>
	<td colspan="3">
		<select name="flag">
			<option value="">선택</option>
			<option value="경기전">경기전</option>
			<option value="경기종료">경기종료</option>
		</select>
	</td>
</tr>

<tr>
	<td bgcolor="#FAED7D" align="center">득점</td>
	<td >홈 점수&nbsp;
		<input type="text" name="homept" size="1">
	</td>
	<td colspan="2" >어웨이 점수&nbsp;
		<input type="text" name="awaypt" size="1">
	</td>
</tr>

<tr>
	<td bgcolor="#FAED7D" align="center">전적</td>
	<td>홈&nbsp;
		<select name="homesc">
			<option value="">선택</option>
			<option value="승">승</option>
			<option value="무">무</option>
			<option value="패">패</option>
		</select>
	</td>
	<td colspan="2">어웨이&nbsp;
		<select name="awaysc">
			<option value="">선택</option>
			<option value="승">승</option>
			<option value="무">무</option>
			<option value="패">패</option>
		</select>
	</td>
</tr>

<tr>
	<td bgcolor="#FAED7D" align="center">배당률</td>
	<td colspan="3">
		&nbsp;&nbsp;승배당률&nbsp;
		<input type="text" name="win_rate" value="0.0">
	
		&nbsp;&nbsp;무배당률&nbsp;
		<input type="text" name="draw_rate" value="0.0">
	
		&nbsp;&nbsp;패배당률&nbsp;
		<input type="text" name="lose_rate" value="0.0">
	</td>
</tr>

<tr>
	<td align="center" colspan="10">
	<input type="submit" value="확 인">&nbsp;&nbsp;
	<input type="button" value="취 소" onclick="history.go(-1);">
</tr>

</table>
</form>
</div>
</body>
</html>