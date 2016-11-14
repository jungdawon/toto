<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />

<form  nama="SoccerMatch" action="/toto/gamebuy/soccerMatchPro.to" method="post">
<input type="hidden" name="num" value="124" />
<table border="1" align="center">
	<tr align="center">
		<td>
			서울:수원
		</td>
	</tr>
	<tr align="center">
		<td>
			<input type="checkbox" name="matchpoint" value="0:0" />0:0
			<input type="checkbox" name="matchpoint" value="0:1" />0:1
			<input type="checkbox" name="matchpoint" value="0:2" />0:2
			<input type="checkbox" name="matchpoint" value="0:3" />0:3
			<input type="checkbox" name="matchpoint" value="0:4" />0:4
			<input type="checkbox" name="matchpoint" value="0:5" />0:5			
		</td>
	</tr>
	<tr align="center">
		<td>
			<input type="checkbox" name="matchpoint" value="1:0" />1:0
			<input type="checkbox" name="matchpoint" value="1:1" />1:1
			<input type="checkbox" name="matchpoint" value="1:2" />1:2
			<input type="checkbox" name="matchpoint" value="1:3" />1:3
			<input type="checkbox" name="matchpoint" value="1:4" />1:4
			<input type="checkbox" name="matchpoint" value="1:5" />1:5			
		</td>
	</tr>
	<tr align="center">
		<td>
			<input type="checkbox" name="matchpoint" value="2:0" />2:0
			<input type="checkbox" name="matchpoint" value="2:1" />2:1
			<input type="checkbox" name="matchpoint" value="2:2" />2:2
			<input type="checkbox" name="matchpoint" value="2:3" />2:3
			<input type="checkbox" name="matchpoint" value="2:4" />2:4
			<input type="checkbox" name="matchpoint" value="2:5" />2:5			
		</td>
	</tr>
	<tr align="center">
		<td>
			<input type="checkbox" name="matchpoint" value="3:0" />3:0
			<input type="checkbox" name="matchpoint" value="3:1" />3:1
			<input type="checkbox" name="matchpoint" value="3:2" />3:2
			<input type="checkbox" name="matchpoint" value="3:3" />3:3
			<input type="checkbox" name="matchpoint" value="3:4" />3:4
			<input type="checkbox" name="matchpoint" value="3:5" />3:5			
		</td>
	</tr>
	<tr align="center">
		<td>
			<input type="checkbox" name="matchpoint" value="4:0" />4:0
			<input type="checkbox" name="matchpoint" value="4:1" />4:1
			<input type="checkbox" name="matchpoint" value="4:2" />4:2
			<input type="checkbox" name="matchpoint" value="4:3" />4:3
			<input type="checkbox" name="matchpoint" value="4:4" />4:4
			<input type="checkbox" name="matchpoint" value="4:5" />4:5			
		</td>
	</tr>
	<tr align="center">
		<td>
			<input type="checkbox" name="matchpoint" value="5:0" />5:0
			<input type="checkbox" name="matchpoint" value="5:1" />5:1
			<input type="checkbox" name="matchpoint" value="5:2" />5:2
			<input type="checkbox" name="matchpoint" value="5:3" />5:3
			<input type="checkbox" name="matchpoint" value="5:4" />5:4
			<input type="checkbox" name="matchpoint" value="5:5" />5:5			
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="전송" />
		</td>
	</tr>
</table>


</form>