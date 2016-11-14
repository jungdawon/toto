<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />

<script>
	function back(){
		history.go(-1);
	}
	
	function writeSave(){
		if(!document.writeform.pw.value){
			alert("비밀번호를 작성해주세요.");
			document.writeform.pw.focus();
			return false;
		}else if(!document.writeform.subject.value){
			alert("제목을 작성해주세요.");
			document.writeform.subject.focus();
			return false;
		}else if(!document.writeform.content.value){
			alert("내용을 작성해주세요.");
			document.writeform.content.focus();
			return false;
		}
	}
</script>

<center><b>글쓰기</b></center>
<br>
<form method="post" name="writeform" action="/toto/board1/writepro.to" onsubmit="return writeSave()">
	<input type="hidden" name="pageNum" value="${pageNum}" /> 
	<input type="hidden" name="local" value="${local}" />

<table border="1" align="center">

<tr>
	<td align="center">아이디</td>
	<td >${memId}
		<input type="hidden" size="40" maxlength="50" name="writer" value="${memId}" />
	</td>
</tr>

<tr>
	<td align="center" >제 목</td>
	<td>
		<input type="text" size="100" name="subject" />
	</td>
</tr>

<tr>
	<td align="center">내 용</td>
	<td>
		<textarea name="content" rows="13" cols="100"></textarea> 
	</td>
</tr>

<tr>
	<td align="center" >비밀번호</td>
	<td>
		<input type="password" size="8" maxlength="12" name="pw" /> 
	</td>
</tr>

<tr>      
	<td colspan=2  align="center"> 
		<input type="submit" value="글쓰기" />  
		<input type="reset" value="다시작성" />
		<input type="button" value="목록보기" OnClick=back(); />
	</td>
</tr>

</table>    
</form>

