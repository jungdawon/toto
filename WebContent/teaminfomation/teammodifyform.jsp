<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/game/subMenu.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<br />
<center>
<font size="6" color="#5F00FF">팀정보 수정</font>
</center>
<br />
<center>
<form method="post" action="/toto/teaminfomation/teammodifypro.to?league=${league}" enctype="multipart/form-data">
<input type="hidden" name="num" value="${teammodify.num}">
<input type="hidden" name="teamname" value="${teammodify.teamname}">
	<table align="center">
<tr>
	<td>연고지<input type="text"  size="25" maxlength="40" name="hometown" id="hometown" value="${teammodify.hometown}"><br /><br />
	홈구장<input type="text"  size="25" maxlength="40" name="homeground" id="homeground" value="${teammodify.homeground}"><br /><br />
	감 독&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="25" maxlength="40"name="coach"	id="coach" value="${teammodify.coach}"><br /><br />
	성 적&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="25" maxlength="40"name="grade" id="grade" value="${teammodify.grade}"><br /><br />
	홈페이지<input type="text" size="23" maxlength="40"name="homepage" id="homepage" value="${teammodify.homepage}"><br /><br />
	로 고<input type="file" name="logo" id="logo" value="${teammodify.logo}"></td>
     <tr align="center">
 	<td colspan="2">
	</td>
	</tr>
	</tr>
</table>
<input type="submit" value="수정">
</form>    
</center>