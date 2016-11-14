<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="/board1/subMenu.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if> --%>
<br />
<br />
<br />
<style type="text/css">
	#bo1 {
		position: relative;
		left: 5%;
		
	}
	#bo2 {
		position: relative;
		left: 5%;
		
	}

</style>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>
<div id="text">
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
<center><b>글목록(전체 글:${count})</b>
<c:if test="${memId==null && local ne 'Notice'}"><br />
로그인해야 글쓰기가 가능합니다.
<li><a href="/toto/member/loginForm.to">로그인</a></li>
</c:if>

<c:if test="${memId eq 'admin' && local eq 'Notice'}" >
	<li><a href="/toto/board1/write.to?pageNum=${pageNum}&local=${local}">글쓰기</a></li>
</c:if>

<c:if test="${local ne 'Notice' && sessionScope.memId ne null}"> 
	<li><a href="/toto/board1/write.to?pageNum=${pageNum}&local=${local}">글쓰기</a></li>
</c:if>

<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0" id="bo1">
  <tr>
    <td align="center">
      게시판에 저장된 글이 없습니다.
    </td>
  </tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="950" cellpadding="0" cellspacing="0" align="center" id="bo2"> 
    <tr height="30" bgcolor="#E7E7E7"> 
      <td align="center"  width="50"  >번 호</td>
      <td align="center"  width="500" >제   목</td>
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td> 
      <td align="center"  width="50" >조 회</td> 
        </tr>
        

   <c:forEach var="brdlist" items="${brdlist}">
   <tr height="30">
    <td align="center"  width="50" >
	  <c:out value="${number}"/>
	  <c:set var="number" value="${number - 1}"/>
	</td>


	<td align="center"  width="500">
	<a href="/toto/board1/content.to?num=${brdlist.num}&pageNum=${currentPage}&local=${local}">${brdlist.subject}</a>
	</td>
    <td align="center"  width="100"> ${brdlist.writer}
	</td>
    <td align="center"  width="150">${brdlist.reg}
	</td>
    <td align="center"  width="50">${brdlist.readcount}</td>
 
  </tr>
  </c:forEach>
</table>
</c:if>

<c:if test="${count > 0}" >
	<c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"  />
    <c:set var="pageBlock" value="${ 10 }"/>
    <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
    <c:set var="startPage" value="${result * 10 + 1}" />
    <c:set var="endPage" value="${ startPage + pageBlock - 1 }"/>
    <c:if test="${endPage > pageCount}">
    		<c:set var="endPage" value="${pageCount}"/>
   	</c:if> 
  
<!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                
                 <c:if test="${startPage > 10}" >
	                  <li><a href="list.to?pageNum=${startPage - 10}&local=${local}">&laquo;</a></li>
   				 </c:if>
   				 
                 <c:forEach begin="${startPage}" end="${endPage}" var="i" >
                 	<c:if test="${pageNum eq i}" >
	                 	<li class="active"><a href="list.to?pageNum=${i}&local=${local}">${i}</a></li>
                    </c:if>
                    <c:if test="${pageNum ne i}" >
	                 	<li><a href="list.to?pageNum=${i}&local=${local}">${i}</a></li>
                    </c:if>
				</c:forEach>  
				
				<c:if test="${endPage < pageCount }" >
    				<li><a href="list.to?pageNum=${startPage + 10}&local=${local}">&raquo;</a></li>	
   				</c:if>	
                </ul>
            </div>
        </div>
     
</c:if>
<br />
<br />
<br />

<form action="/toto/board1/search.to" method="post">
<input type="hidden" name="local" value="${local}" /> 
<select name="search">
<option value="writer">작성자</option>
<option value="subject">제목</option>
<option value="content">내용</option>
</select>
<input type="text" name="searchvalue" />
<input type="submit" value="검색"/>
</form>
</center>
</div>
