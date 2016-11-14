<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />
<form name="victory" action="/toto/gamebuy/soccerVictoryResultPro.to" method="post">
<table>
<input type="text" name="turn2" value="1" />
<input type="text" name="round2" value="½Â¹«ÆÐ" />
	<tr>
	<c:forEach var="i" begin="1" end="14" step="1">
		<td>
			<select name="match_${i}">
				<option value="½Â">½Â</option>
				<option value="¹«">¹«</option>
				<option value="ÆÐ">ÆÐ</option>
			</select>
		</td>
	</c:forEach>
	</tr>
	<tr><td><input type="submit" value="Àü¼Û" /></td></tr>
</table>
</form>