<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@include file="/board1/subMenu1.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if> --%>
<br />
<br />
<br />
<style type="text/css">
	#my1 {
		position: relative;
		left: 5%;
		
	}
	#my2 {
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
<center>
<c:if test="${memId==null}">
�α����ؾ� �۾��Ⱑ ������ 
<li><a href="/toto/member/loginForm.jsp">�α���</a></li>
</c:if>
<%-- <c:if test="${gubun eq 'indivi2'}">
<c:if test="${memId!=null}">
<li><a href="/toto/board1/write.to?pageNum=${pageNum}&local=${local}">�۾���</a></li>
</c:if>
</c:if> --%>
<c:if test="${gubun eq 'indivi2'}">
<c:if test="${count2 == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0" id="my1">
  <tr>
    <td align="center">
      �Խ��ǿ� ����� ���� �����ϴ�.
    </td>
  </tr>
</table>
</c:if>
</c:if>

<c:if test="${gubun eq 'indivi2'}">
<b>(��ü ��:${count2})</b>
<table border="1" width="950" cellpadding="0" cellspacing="0" align="center" id="my2"> 
    <tr height="30"> 
      <td align="center"  width="50"  >�� ȣ</td>
      <td align="center"  width="500" >��   ��</td>
      <td align="center"  width="100" >�ۼ���</td>
      <td align="center"  width="150" >�ۼ���</td> 
      <td align="center"  width="50" >�� ȸ</td> 
        </tr>
        
	
   <c:forEach var="brdlist" items="${brdlist}">
   <tr height="30">
    <td align="center"  width="50" >
	  <c:out value="${number2}"/>
	  <c:set var="number2" value="${number2 - 1}"/>
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

<c:if test="${gubun eq 'indivi2'}">
<c:if test="${count2 > 0}" >
	<c:set var="pageCount" value="${count2 / pageSize + ( count2 % pageSize == 0 ? 0 : 1)}"  />
    <c:set var="pageBlock" value="${ 10 }"/>
    <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
    <c:set var="startPage" value="${result * 10 + 1}" />
    <c:set var="endPage" value="${ startPage + pageBlock - 1 }"/>
    <c:if test="${endPage > pageCount}">
    		<c:set var="endPage" value="${pageCount}"/>
   	</c:if> 
 <table align="center" id="gl2">
<tr>
	<td>
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
	                  <li><a href="mylist.to?pageNum=${startPage - 10}&gubun=indivi2&local=${local}">&laquo;</a></li>
   				 </c:if>
   				 
                 <c:forEach begin="${startPage}" end="${endPage}" var="i" >
                 	<c:if test="${pageNum eq i}" >
	                 	<li class="active"><a href="mylist.to?pageNum=${i}&gubun=indivi2&local=${local}">${i}</a></li>
                    </c:if>
                    <c:if test="${pageNum ne i}" >
	                 	<li><a href="mylist.to?pageNum=${i}&gubun=indivi2&local=${local}">${i}</a></li>
                    </c:if>
				</c:forEach>  
				
				<c:if test="${endPage < pageCount }" >
    				<li><a href="mylist.to?pageNum=${startPage + 10}&gubun=indivi2&local=${local}">&raquo;</a></li>	
   				</c:if>	
                </ul>
            </div>
        </div>	                
</td>
</tr>
</table>
</c:if>
</c:if>

</center>
<center>
<c:if test="${memId==null}">
�α����ؾ� �۾��Ⱑ ������ 
<li><a href="/toto/member/loginForm.jsp">�α���</a></li>
</c:if>
<%-- <c:if test="${gubun eq 'indivi'}">
<c:if test="${memId!=null}">
<li><a href="/toto/board1/write.to?pageNum=${pageNum}&local=${local}">�۾���</a></li>
</c:if>
</c:if> --%>
<c:if test="${gubun eq 'indivi'}">
<c:if test="${count3 == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0" id="my1">
  <tr>
    <td align="center">
      �Խ��ǿ� ����� ���� �����ϴ�.
    </td>
  </tr>
</table>
</c:if>
</c:if>
<c:if test="${gubun eq 'indivi'}">
<b>(��ü ��:${count3})</b>
<table border="1" width="950" cellpadding="0" cellspacing="0" align="center" id="my2"> 
    <tr height="30"> 
      <td align="center"  width="50"  >�� ȣ</td>
      <td align="center"  width="500" >��   ��</td>
      <td align="center"  width="100" >�ۼ���</td>
      <td align="center"  width="150" >�ۼ���</td> 
      <td align="center"  width="50" >�� ȸ</td> 
        </tr>
        
	
   <c:forEach var="brdlist" items="${brdlist}">
   <tr height="30">
    <td align="center"  width="50" >
	  <c:out value="${number3}"/>
	  <c:set var="number3" value="${number3 - 1}"/>
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

<c:if test="${gubun eq 'indivi'}">
<c:if test="${count3 > 0}" >
	<c:set var="pageCount" value="${count3 / pageSize + ( count3 % pageSize == 0 ? 0 : 1)}"  />
    <c:set var="pageBlock" value="${ 10 }"/>
    <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
    <c:set var="startPage" value="${result * 10 + 1}" />
    <c:set var="endPage" value="${ startPage + pageBlock - 1 }"/>
    <c:if test="${endPage > pageCount}">
    		<c:set var="endPage" value="${pageCount}"/>
   	</c:if> 
<table align="center" id="gl2">
<tr>
	<td>
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
	                  <li><a href="mylist.to?pageNum=${startPage - 10}&gubun=indivi&local=${local}">&laquo;</a></li>
   				 </c:if>
   				 
                 <c:forEach begin="${startPage}" end="${endPage}" var="i" >
                 	<c:if test="${pageNum eq i}" >
	                 	<li class="active"><a href="mylist.to?pageNum=${i}&gubun=indivi&local=${local}">${i}</a></li>
                    </c:if>
                    <c:if test="${pageNum ne i}" >
	                 	<li><a href="mylist.to?pageNum=${i}&gubun=indivi&local=${local}">${i}</a></li>
                    </c:if>
				</c:forEach>  
				
				<c:if test="${endPage < pageCount }" >
    				<li><a href="mylist.to?pageNum=${startPage + 10}&gubun=indivi&local=${local}">&raquo;</a></li>	
   				</c:if>	
                </ul>
            </div>
        </div>	                
</td>
</tr>
</table>   
</c:if>
</c:if>


<c:if test="${gubun eq 'all'}">
<b>(��ü ��:${count})</b>
<table border="1" width="950" cellpadding="0" cellspacing="0" align="center" id="my2"> 
    <tr height="30"> 
      <td align="center"  width="50"  >�� ȣ</td>
      <td align="center"  width="500" >��   ��</td>
      <td align="center"  width="100" >�ۼ���</td>
      <td align="center"  width="150" >�ۼ���</td> 
      <td align="center"  width="50" >�� ȸ</td> 
        </tr>
        
	
   <c:forEach var="brdlist" items="${brdlist}">
   <tr height="30">
    <td align="center"  width="50" >
	  <c:out value="${number}"/>
	  <c:set var="number" value="${number - 1}"/>
	</td>


	<td align="center"  width="500">
	<a href="/toto/board1/content.to?num=${brdlist.num}&pageNum=${currentPage}&local=${brdlist.local}&gubun=all">${brdlist.subject}</a>
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
<c:if test="${gubun eq 'all'}">
<c:if test="${count > 0}" >
	<c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"  />
    <c:set var="pageBlock" value="${ 10 }"/>
    <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
    <c:set var="startPage" value="${result * 10 + 1}" />
    <c:set var="endPage" value="${ startPage + pageBlock - 1 }"/>
    <c:if test="${endPage > pageCount}">
    		<c:set var="endPage" value="${pageCount}"/>
   	</c:if> 
  
<table align="center" id="gl2">
<tr>
	<td>
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
	                  <li><a href="mylist.to?pageNum=${startPage - 10}&gubun=all">&laquo;</a></li>
   				 </c:if>
   				 
                 <c:forEach begin="${startPage}" end="${endPage}" var="i" >
                 	<c:if test="${pageNum eq i}" >
	                 	<li class="active"><a href="mylist.to?pageNum=${i}&gubun=all">${i}</a></li>
                    </c:if>
                    <c:if test="${pageNum ne i}" >
	                 	<li><a href="mylist.to?pageNum=${i}&gubun=all">${i}</a></li>
                    </c:if>
				</c:forEach>  
				
				<c:if test="${endPage < pageCount }" >
    				<li><a href="mylist.to?pageNum=${startPage + 10}&gubun=all">&raquo;</a></li>	
   				</c:if>	
                </ul>
            </div>
        </div>	                
</td>
</tr>
</table>  
</c:if>
</c:if>


<form action="/toto/board1/search.to" method="post">
<input type="hidden" name="local" value="${local}" />
<select name="search">
<option value="writer">�ۼ���</option>
<option value="subject">����</option>
<option value="content">����</option>
</select>
<input type="text" name="searchvalue" />
<input type="submit" value="�˻�"/>
</form>
</center>
</div>
