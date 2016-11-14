<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<center>

<div id="teamlist">
 <form name="teamchoice" method="post" action="/toto/teaminfomation/teamcontentbasket.to">
	<input type="hidden" name="snum" value="6">
	<select name="league">
		
		<option value="KBL">프로농구</option>
	</select>&nbsp;&nbsp;
		
	팀선택
	<select name="teamname">
		<c:if test="${team!=null}">
		<option value="${team}">${team}</option>
		</c:if>
		<option value="울산모비스">울산모비스</option>	
		<option value="원주동부">원주동부</option>		
		<option value="서울SK">서울SK</option>
		<option value="창원LG">창원LG</option>
		<option value="고양오리온스">고양오리온스</option>
		<option value="인천전자랜드">인천전자랜드</option>
		<option value="부산KT">부산KT</option>
		<option value="안양KGC">안양KGC</option>
		<option value="전주KCC">전주KCC</option>
		<option value="서울삼성">서울삼성</option>
	</select>
	<c:if test="${var!=null}">
	<input type="hidden" name="var" value="${var}">
	</c:if>
 	<a href="javascript:document.teamchoice.submit();"><img border="0" src="/toto/game/image/submit.gif"/></a>
 		
 		
</form>
 		
</div>
</center>
 