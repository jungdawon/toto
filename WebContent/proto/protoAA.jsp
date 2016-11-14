<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/admin/resultMenu.jsp" %>
<br />
<br />
<br />
<br />
<br />
<style type="text/css">
	#vresult_1 {
		position: relative;
		left: 7%;
		
	}

</style>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left:120px;
	width: 1150px;}
</style>

<div id="text" >


<form method="post" name="protoAA">
<table align="center" border="0" >
<tr align="center"><td><h2>프로토 결과등록</h2></td></tr>
<tr>
	<td>
	<table border="1">
		<tr align="center" bgcolor="#E7E7E7">
		<td width=200>종목</td>
		<td width=100>회차</td>
		<td width=150>마감일시</td>
		<td width=100>비고</td>
		</tr>
		<c:if test="${chk == 0 }">
		<tr><td colspan="4">등록할 게임이 없습니다.</td></tr>
		</c:if>
		<c:forEach var="AA" items="${AA }">
		<tr align="center">
		<td style="color:#00C6ED">프로토</td>
		<td>${AA.round}회차</td>
		<td style="color:red"><fmt:formatDate value="${AA.end_date}" pattern="yyyy.MM.dd HH:mm"/></td>
		<td>
		<c:if test="${AA.flag == '발매마감' }">
		<a href="/toto/proto/protoAAPro.to?turn=${AA.round}&type=${AA.type}"><img border="0" src="/toto/admin/image/register.gif"/></a>
		</c:if>
		<c:if test="${AA.flag == '결과발표' }">
		입력완료
		</c:if>
		</td>
		</tr>
		</c:forEach>
	</table>
	</td>
</tr>
</table>
</form>
</div>