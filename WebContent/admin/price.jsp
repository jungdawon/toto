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
</style>
<div id="text">
<br />
<br />

<table align="center" width="800" border="0">
	<tr align="left">
		<td>
				<font size="4">��ġ�� ���</font> &nbsp;&nbsp;
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
			<c:if test="${flag eq 0}">
				��ġ�� ��� ��û�ݾ� &nbsp;&nbsp; : &nbsp;&nbsp;
				<font color="#FF8224" >
					<c:if test="${result_cash_ing eq '' || result_cash_ing eq null}" >
						0
					</c:if>
					
					<c:if test="${result_cash_ing ne ''}" >
						<fmt:formatNumber value="${result_cash_ing}" type="number" />
					</c:if>
				</font>��
			</c:if>
			<c:if test="${flag eq 1}">
				��ġ�� ��� �ݾ� &nbsp;&nbsp; : &nbsp;&nbsp;
				<font color="#FF8224" ><fmt:formatNumber value="${result_cash}" type="number" /></font>��
			</c:if>
		</td>
		<td  width="400" style="border-left: 1px solid white;">
			<img src="/toto/member/image/money1.gif" />&nbsp;&nbsp;&nbsp;
			<c:if test="${flag eq 0}">
				��ġ�� ��� ��û �Ǽ�&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;
			<font color="#FF8224" ><fmt:formatNumber value="${result_cash_ing_count}" type="number" /></font>��
			</c:if>
			<c:if test="${flag eq 1}">
				��ġ�� ��� �Ǽ�&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;
				<font color="#FF8224" ><fmt:formatNumber value="${result_cash_count}" type="number" /></font>��
			</c:if>
			
			
			
			
		</td>
	</tr>
</table>

<br />

<table align="center">
	<tr align="center">
		<td>
			<a href="/toto/admin/price.to?flag=0">��� ��û</a> &nbsp;&nbsp;&nbsp; || &nbsp;&nbsp;&nbsp;
			<a href="/toto/admin/price.to?flag=1">��� ��û �Ϸ�</a>
		</td>
	</tr>
</table>
<br />
<table border="1" align="center" >
	<tr align="center" bgcolor="#E7E7E7">
		<td>���̵�</td>
		<td>�����</td>
		<td>���¹�ȣ</td>
		<td>��û �ݾ�</td>
		<td>��ݿ�û�ð�</td>
		<td>����</td>
		<td>�ڵ���</td>
		<td>��ġ�� �ܾ�</td>
		<td>��û ó��</td>
	</tr>
	<c:forEach var="priceList" items="${priceList}" >
		<tr align="center" onmouseover='this.style.backgroundColor="#FAED7D";' onmouseout='this.style.backgroundColor="white";'>
			<td>${priceList.id}</td>
			<td>${priceList.bank}</td>
			<td>${priceList.account}</td>
			<td><font color="#FF8224" ><fmt:formatNumber value="${priceList.cancelprice}" type="number" /></font>��</td>
			<td><fmt:formatDate value="${priceList.cancel_date}" pattern="yyyy��MM��dd�� HH�� MM��"/></td>
			<td>
				<c:if test="${priceList.flag eq 0}" >
					<c:out value="��� ��û" />
				</c:if>
				<c:if test="${priceList.flag eq 1}" >
					<c:out value="��û �Ϸ�" />
				</c:if>
			</td>
			<td>${priceList.phone1}-${priceList.phone2}-${priceList.phone3}</td>
			<td>
				<font color="#FF8224" ><fmt:formatNumber value="${priceList.cash}" type="number" /></font>��
			</td>
			<td>
				<c:if test="${priceList.flag eq 0}" >
					<a href="/toto/admin/pricePro.to?num=${priceList.num}"><img src="/toto/admin/image/money.gif" /></a>
				</c:if>
				<c:if test="${priceList.flag eq 1}" >
					<c:out value="��� �Ϸ�" />
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>

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
	                  <li><a href="price.to?flag=${flag}&pageNum=${i}">&laquo;</a></li>
   				 </c:if>
   				 
                 <c:forEach begin="${startPage}" end="${endPage}" var="i" >
                 	<c:if test="${pageNum eq i}" >
	                 	<li class="active"><a href="price.to?flag=${flag}&pageNum=${i}">${i}</a></li>
                    </c:if>
                    <c:if test="${pageNum ne i}" >
	                 	<li><a href="price.to?flag=${flag}&pageNum=${i}">${i}</a></li>
                    </c:if>
				</c:forEach>  
				
				<c:if test="${endPage < pageCount }" >
    				<li><a href="price.to?flag=${flag}&pageNum=${startPage + 10}">&raquo;</a></li>	
   				</c:if>	
                </ul>
            </div>
        </div>	                
	</td>
</tr>
</table>
</div>