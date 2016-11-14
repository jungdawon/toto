<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />

<a href="/toto/board1/list.to?local=Notice">��������</a>
<a href="/toto/board1/list.to?local=free">�����Խ���</a>
<a href="/toto/board1/list.to?local=advice">����</a>



<center><b>�۸��(��ü ��:${count})</b>
<c:if test="${memId==null}">
�α����ؾ� �۾��Ⱑ ������ 
<li><a href="/toto/member/loginForm.jsp">�α���</a></li>
</c:if>
<!--<c:if test="${kId ne null}"> 
	<div class="row" align="right">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                	<c:if test="${kId eq 'admin' && local eq 'Notice'}" >
                		<li><a href="/jsp/semi/board/write.kh?pageNum=${pageNum}&local=${local}">�۾���</a></li>
                	</c:if>
                	<c:if test="${local ne 'Notice'}" >
                   	 <li><a href="/jsp/semi/board/write.kh?pageNum=${pageNum}&local=${local}">�۾���</a></li>
                   	 <li><a href="/jsp/semi/board/mylist.kh?pageNum=${pageNum}">�� �ۼ���</a></li>
					</c:if>
                </ol>
            </div>
	</div>	
</c:if>
-->

<c:if test="${memId!=null}">
<li><a href="/toto/board1/write.to?pageNum=${pageNum}&local=${local}">�۾���</a></li>
<li><a href="/toto/board1/mylist.to?pageNum=${pageNum}">���ۺ���</a></li>
</c:if>
<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
      �Խ��ǿ� ����� ���� �����ϴ�.
    </td>
  </tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="950" cellpadding="0" cellspacing="0" align="center"> 
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
  
               <c:if test="${startPage > 10}" >
	                  <a href="search.to?pageNum=${startPage - 10}&local=${local}">&laquo;</a>
   				 </c:if>
   				 
                 <c:forEach begin="${startPage}" end="${endPage}" var="i" >
                 	<c:if test="${pageNum eq i}" >
	            <a href="search.to?pageNum=${i}&local=${local}&search=${search}&searchvalue=${searchvalue}">${i}</a>
                    </c:if>
                    <c:if test="${pageNum ne i}" >
	                 	<a href="search.to?pageNum=${i}&local=${local}&search=${search}&searchvalue=${searchvalue}">${i}</a>
                    </c:if>
				</c:forEach>  
				
				<c:if test="${endPage < pageCount }" >
    				<a href="search.to?pageNum=${startPage + 10}&local=${local}">&raquo;</a>	
   				</c:if>	
     
</c:if>
<br />
<br />
<br />

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
