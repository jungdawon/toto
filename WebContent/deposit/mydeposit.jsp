<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/agspay/payMenu.jsp" %>




<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 60px;
	width: 1150px;}
#vi1 {
		position: relative;
		left: 8%;
		
	}
</style>
<br />
<br />
<br />
<center>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="/toto/deposit/money1.gif" /><font size="5" color="red">예치금 입금내역</font>
</center>

<div id="text">
 <c:if test="${bar ne null}" >
		<jsp:include page="${bar}"/>
</c:if> 
</div>
<br />
<br />
<br />


<center>

<c:if test="${count==0}">
예치금 내역이 없습니다.
</c:if>
<c:if test="${count > 0}">
<table border="1" width="950" cellpadding="0" cellspacing="0" align="center" id="vi1"> 
    <tr height="30" bgcolor="#E7E7E7"> 
      <td align="center"  width="50"  >번 호</td>
      <td align="center"  width="300" >거래일자</td>
      <td align="center"  width="100" >시간</td>
      <td align="center"  width="150" >내역</td> 
      <td align="center"  width="150" >입금</td>
        </tr>
<c:forEach var="searchpayboardlist" items="${searchpayboardlist}">
  <tr height="30">
    <td align="center"  width="50" >
	  <c:out value="${number}"/>
	  <c:set var="number" value="${number - 1}"/>
	</td>
<td align="center" width="300"><fmt:formatDate value="${searchpayboardlist.pay_date}" pattern="yyyy년MM월dd일" /></td>
<td align="center" width="100"><fmt:formatDate value="${searchpayboardlist.pay_date}" pattern="HH:mm" /></td>
<td align="center" width="150">${searchpayboardlist.job}</td>
<td align="center" width="150"><font color="#FF8224" ><fmt:formatNumber value="${searchpayboardlist.price}" type="number" /></font>원		</td>
	
</tr>
</c:forEach>
</table>
</c:if>
<table id="vi1" align="center">
<tr>
<td>
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
	                  <li><a href="mydeposit.to?pageNum=${startPage - 10}&datebar=${datebar}">&laquo;</a></li>
   				 </c:if>
   				 
                 <c:forEach begin="${startPage}" end="${endPage}" var="i" >
                 	<c:if test="${pageNum eq i}" >
	                 	<li class="active"><a href="mydeposit.to?pageNum=${i}&datebar=${datebar}">${i}</a></li>
                    </c:if>
                    <c:if test="${pageNum ne i}" >
	                 	<li><a href="mydeposit.to?pageNum=${i}&datebar=${datebar}">${i}</a></li>
                    </c:if>
				</c:forEach>  
				
				<c:if test="${endPage < pageCount }" >
    				<li><a href="mydeposit.to?pageNum=${startPage + 10}&datebar=${datebar}">&raquo;</a></li>	
   				</c:if>	
                </ul>
            </div>
        </div>	    
     
</c:if>
</td>
</tr>
</table>
<br />
<br />
<br />
</center>

</div>