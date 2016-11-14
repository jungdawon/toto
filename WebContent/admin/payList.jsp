<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/admin/priceMenu.jsp" %> 
<br />
<br />
<br />

<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
	 .LINE{
    border-style:dotted;  /* 점선으로 보이기 */
    color:#000000;  /* 색상: HR, FONT 등에 적용가능 */
    width: 800px;  /* 넓이 */
    height:2px;  /* 높이 */
    margin:4px;  /* 줄간격 */
  }
</style>
<div id="text">
<br />
<br />

<table align="center" width="800" border="0">
	<tr align="left">
		<td>
			<font size="4">예치금 충전</font>	&nbsp;&nbsp;
			<img src="/toto/admin/image/content.gif" />
		</td>
	</tr>
	<tr>
		<td><img src="/toto/admin/image/line.png" width="800"/></td>
	</tr>
</table>
<br />
<table border="1" bordercolor="#6CFFFF" align="center" width="800" height="50">
	<tr align="left">
		<td width="400" style="border-right: 1px solid white;">
			<img src="/toto/member/image/money1.gif" />&nbsp;&nbsp;&nbsp;
			예치금 누적금액&nbsp;&nbsp; : &nbsp;&nbsp;
			<font color="#FF8224" >
				<fmt:formatNumber value="${cash}" type="number" /></font>원
			
		</td>
		<td  width="400" style="border-left: 1px solid white;"><img src="/toto/member/image/money1.gif" />&nbsp;&nbsp;&nbsp;
			예치금 누적 건수&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;
			<font color="#FF8224" ><fmt:formatNumber value="${cash_count}" type="number" /></font>건
		</td>
	</tr>
</table>

<br />
<form>
	<table border="1" align="center" width="800">
		<tr align="center" bgcolor="#E7E7E7" height="30">
			<td>아이디</td>
			<td>이 름</td>
			<td>핸드폰</td>
			<td>거래 일자</td>
			<td>충전 방법</td>
			<td>계좌 번호</td>
			<td>은 행 명</td>
			<td>충전 금액</td>
		</tr>
		<c:forEach var="paylist" items="${paylist}" >
			<tr align="center" height="30" onmouseover='this.style.backgroundColor="#FAED7D";' onmouseout='this.style.backgroundColor="white";'>
				<td>${paylist.id}</td>
				<td>${paylist.name}</td>
				<td>${paylist.phone1}-${paylist.phone2}-${paylist.phone3}</td>
				<td>
					<fmt:formatDate value="${paylist.pay_date}" pattern="yyyy년MM월dd일"/>
				</td>
				<td>${paylist.job}</td>
				<td>${paylist.account}</td>
				<td>${paylist.bank}</td>
				<td>
					<font color="#FF8224" ><fmt:formatNumber value="${paylist.price}" type="number" /></font>원		
				</td>
			</tr>
		</c:forEach>
	</table>
</form>


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
	                  <li><a href="payList.to?pageNum=${i}">&laquo;</a></li>
   				 </c:if>
   				 
                 <c:forEach begin="${startPage}" end="${endPage}" var="i" >
                 	<c:if test="${pageNum eq i}" >
	                 	<li class="active"><a href="payList.to?pageNum=${i}">${i}</a></li>
                    </c:if>
                    <c:if test="${pageNum ne i}" >
	                 	<li><a href="payList.to?pageNum=${i}">${i}</a></li>
                    </c:if>
				</c:forEach>  
				
				<c:if test="${endPage < pageCount }" >
    				<li><a href="payList.to?pageNum=${startPage + 10}">&raquo;</a></li>	
   				</c:if>	
                </ul>
            </div>
        </div>	                
</td>
</tr>
</table>
</div>