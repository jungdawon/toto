<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="teamlistmid">
 <form method="post" action="/toto/teaminfomation/teamcontentbase.to?league=KBO" name="choice">
 	<input type="hidden" name="teamname" value="${teamname}">
 	<table  width=95%>
 		<tr align="right"><td>
 			<select name="snum">
		<option value="6">최근5경기</option>	
		<option value="11">최근10경기</option>		
	</select>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript:document.choice.submit();"><img border="0" src="/toto/game/image/submit.gif"/></a>
 		</td></tr>
 	</table>
 		
 		
 		
 		
</form>
 		
</div>


 