<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<center>

<div id="teamlist">
 <form name="teamchoice" method="post" action="/toto/teaminfomation/teamcontent.to">
	<input type="hidden" name="snum" value="6">
	<select name="league">
		
		<option value="K리그">K리그 클래식</option>
	</select>&nbsp;&nbsp;
		
	팀선택
	<select name="teamname">
		<c:if test="${team!=null}">
		<option value="${team}">${team}</option>
		</c:if>
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
	<c:if test="${var!=null}">
	<input type="hidden" name="var" value="${var}">
	</c:if>
 <a href="javascript:document.teamchoice.submit();"><img border="0" src="/toto/game/image/submit.gif"/></a>
 		
 		
 		
</form>
 		
</div>
</center>
 