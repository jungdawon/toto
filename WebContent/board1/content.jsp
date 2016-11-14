<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/board1/subMenu.jsp" %>
<%-- <c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if> --%>
<br />
<br />
<br />
<style type="text/css">
	#co1 {
		position: relative;
		left: 30%;
		
	}
	#co2 {
		position: relative;
		left: 1%;
		
	}

</style>
<script>
function checkIt(){

	//alert(document.getElementById("commentcontent").value);
	//alert(document.getElementById("commentpw").value);
	
	if(!document.getElementById("commentcontent").value){
		alert("댓글을 작성해주세요.");
		document.getElementById("commentcontent").focus();
		return false;
		}else if(!document.getElementById("commentpw").value){
		alert("비밀번호를 입력해주세요.");
		document.getElementById("commentpw").focus();
		return false;
	}
}
function checkIt1(arg){
	alert(arg.value);
	//alert(document.getElementById("ccommentcontent").value);
	//alert(document.getElementById("ccommentpw").value);
	if(!document.getElementById("ccommentcontent").value){
		alert("댓글을 작성해주세요.");
		document.getElementById("ccommentcontent").focus();
		return false;
		}else if(!document.getElementById("ccommentpw").value){
		alert("비밀번호를 입력해주세요.");
		document.getElementById("ccommentpw").focus();
		return false;
	}
}


function back(){
	history.go(-1);
}

</script>
<c:if test="${local eq 'Notice'}" >
<center>
	<font size="5" color="blue">공지사항</font>
</center>
</c:if>
<c:if test="${local eq 'free'}" >
<center>
	<font size="5" color="blue">자유게시판</font>
</center>
</c:if>
<c:if test="${local eq 'advice'}" >
<center>
	<font size="5" color="blue">QnA게시판</font>
</center>
</c:if>

<br />
<center><b>글내용 보기</b></center>
<br>

<table width=80% id="co1">
<tr>
	<th >date</th>
	<th >${contentlist.reg}</th>
	<th></th>
</tr>
<tr>
	<th >id</th>
	<th >${contentlist.writer}</th>
	<th >
<%-- 		<c:if test="${memId eq contentlist.writer && memId ne 'admin'}">
		<input type="button" value="글수정" onclick="document.location.href='/toto/board1/modifyform.to?num=${contentlist.num}&pageNum=${pageNum}'">
		<input type="button" value="글삭제" onclick="document.location.href='/toto/board1/deleteform.to?num=${contentlist.num}&pageNum=${pageNum}'"> 
		<input type="button" value="글목록" onclick=back(); >
		</c:if> --%>
<%-- 		<c:if test="${memId eq 'admin'}">
			<input type="button" value="글삭제" onclick="document.location.href='/toto/board1/admindelete.to?num=${contentlist.num}&local=${contentlist.local}'"> 
			<input type="button" value="글수정" onclick="document.location.href='/toto/board1/modifyform.to?num=${contentlist.num}&pageNum=${pageNum}'">
			<input type="button" value="글목록" onclick=back(); >
		</c:if> --%>
	</th>
</tr>
<tr>
<th >subject</th>
<th >${contentlist.subject}</th>

</tr>
<tr>
<td colspan=2 align="center">
		<c:if test="${memId eq contentlist.writer && memId ne 'admin'}">
		<input type="button" value="글수정" onclick="document.location.href='/toto/board1/modifyform.to?num=${contentlist.num}&pageNum=${pageNum}'">
		<input type="button" value="글삭제" onclick="document.location.href='/toto/board1/deleteform.to?num=${contentlist.num}&pageNum=${pageNum}'"> 
		<input type="button" value="글목록" onclick=back(); >
		</c:if> 
		<c:if test="${memId eq 'admin'}">
			<input type="button" value="글삭제" onclick="document.location.href='/toto/board1/admindelete.to?num=${contentlist.num}&local=${contentlist.local}'"> 
			<input type="button" value="글수정" onclick="document.location.href='/toto/board1/modifyform.to?num=${contentlist.num}&pageNum=${pageNum}'">
			<input type="button" value="글목록" onclick=back(); >
		</c:if> 
</td>
</tr>
</table>				
<br />
<table align="center" width=50%>
<tr>
	<td>
	<pre>${contentlist.content}</pre>
		
	</td>
</tr>
</table>			
</br>
</br>
</br>
</br>
<c:if test="${memId!=null}">
<form method="post" action="/toto/board1/commentwrite.to" onSubmit="return checkIt()">		
<table align="center">
<tr>
	<td>
	
	<textarea rows="6" cols="80" name="content" id="commentcontent"></textarea>
	</td>
</tr>
<tr>
	<td>
	비밀번호
	<input type="password" name="pw" rows="5" cols="50" id="commentpw"/>
	<input type="submit" value="댓글쓰기" >

	<input type="hidden" name="local" value="${local}" />
	<input type="hidden" name="num" value="${num}" />
	<input type="hidden" name="pageNum" value="${pageNum}" />
	<input type="hidden" name="writer" value="${memId}" />
	<input type="hidden" name="number1" value="2" />
	</td>
</tr>
</table>
</form>    		
</c:if>	

<c:set var="hhh" value="${1}" />
<TABLE align="center" width="" border=1 id="co2">
<c:forEach var="hugi" items="${cbrdlist}">
	<tr>
		<td width="600">
		
		<c:if test="${hugi.re_level > 0}">
			<c:forEach begin="1" end="${ hugi.re_level}">
				&nbsp;&nbsp;&nbsp;
			</c:forEach>
			└
			<font size="4"><b>${hugi.writer}</b></font>
		</c:if>
		
		<c:if test="${hugi.re_level < 1}">
			<font size="4"><b>${hugi.writer}</b></font>
		</c:if>
		
		<br>
		
		<c:if test="${hugi.re_level > 0}">
			<c:forEach begin="1" end="${ hugi.re_level}">
				&nbsp;&nbsp;&nbsp;&nbsp;
			</c:forEach>
		</c:if>
		
		${hugi.content}<br />
		
			<form method="post" onSubmit="return checkIt1()" 
			action="/toto/board1/commentwrite.to?keynum=${hugi.keynum}&num=${hugi.num}&pageNum=${pageNum}&local=${local}&ref=${hugi.ref}&re_step=${hugi.re_step}&re_level=${hugi.re_level}" >
			    <input type="hidden" name="number1" value="1" />
			  	<input type="hidden" name="writer" value="${memId}" />
			  	<c:if test="${hugi.re_level > 0}">
				<c:forEach begin="1" end="${ hugi.re_level}">
				&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
				</c:if>
				<c:if test="${memId!=null}">
			         내용<textarea rows="2" cols="60" name="content" id="ccommentcontent${hhh}"></textarea></br>
				<c:if test="${hugi.re_level > 0}">
				<c:forEach begin="1" end="${ hugi.re_level}">
				&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
				</c:if>
				비밀번호<input type="password" name="pw" rows="2" cols="100" id="ccommentpw"  />
			    <input type="submit" value="답글달기" />
			    </c:if>	
			</form>											
		</td>
		
		<td align="left" width="160" style="border-right:0;border-left:0;border-top:0;">${hugi.reg_date}
			<c:if test="${memId eq hugi.writer}">
				<input type="button" value="댓글수정" onclick="document.location.href='/toto/board1/commentmodifyform.to?keynum=${hugi.keynum}&num=${hugi.num}&pageNum=${pageNum}&local=${local}'">
				<input type="button" value="댓글삭제" onclick="document.location.href='/toto/board1/commentdeleteform.to?keynum=${hugi.keynum}&num=${hugi.num}&pageNum=${pageNum}&local=${local}'">
			</c:if>	
			<c:if test="${memId eq 'admin'}">
			<input type="button" value="댓글삭제" onclick="document.location.href='/toto/board1/admincommentdelete.to?keynum=${hugi.keynum}&num=${hugi.num}&pageNum=${pageNum}&local=${local}'">
			</c:if>
		</td>
	</tr>
</c:forEach>
</table>

</body>
</html>