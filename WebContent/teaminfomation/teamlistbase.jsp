<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<center>

<div id="teamlist">
 <form name="teamchoice" method="post" action="/toto/teaminfomation/teamcontentbase.to">
	<input type="hidden" name="snum" value="6">
	<select name="league">
		
		<option value="KBO">ÇÁ·Î¾ß±¸</option>
	</select>&nbsp;&nbsp;
		
	ÆÀ¼±ÅÃ
	<select name="teamname">
		<c:if test="${team!=null}">
		<option value="${team}">${team}</option>
		</c:if>
		<option value="»ï¼º">»ï¼º</option>	
		<option value="³Ø¼¾">³Ø¼¾</option>		
		<option value="NC">NC</option>
		<option value="µÎ»ê">µÎ»ê</option>
		<option value="ÇÑÈ­">ÇÑÈ­</option>
		<option value="SK">SK</option>
		<option value="KIA">KIA</option>
		<option value="·Ôµ¥">·Ôµ¥</option>
		<option value="LG">LG</option>
		<option value="KT">KT</option>
	</select>
	<c:if test="${var!=null}">
	<input type="hidden" name="var" value="${var}">
	</c:if>
<a href="javascript:document.teamchoice.submit();"><img border="0" src="/toto/game/image/submit.gif"/></a>
 		
 		
 		
</form>
 		
</div>
</center>
 