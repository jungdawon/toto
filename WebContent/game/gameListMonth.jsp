<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/game/subMenu.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
<title>��/���� �������Ȯ��</title>
<style type="text/css">
	#gl1 {
		position: relative;
		top: 5%;
		
	}
	#gl2 {
		position: relative;
		top: 5%;
		
	}

</style>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>
</head>
<body>
<div id="text">
<center>
<div id="gameListForm">
	<jsp:include page="/game/gameListForm.to" flush="false"/>
</div>
</center>
<table align="center" border="1" id="gl1">
	<tr bgcolor="#E7E7E7"> 
		<td align="center">����ȣ</td>
		<td align="center">��¥</td>
		<td align="center">�ð�</td>
		<td align="center">Ȩ�� vs ������</td>
		<td align="center">�����</td>
		<td align="center">�����Ȳ</td>
		<td align="center">�´������</td>
		<td align="center">���</td>
	</tr>
	<c:if test="${empty mon}">
	<tr><td colspan="9" align="center">�˻��� ��Ⱑ �����ϴ�.</td></tr>
	</c:if>
	<c:if test="${not empty mon}">
	<c:forEach items="${mon}" var="mon">
	<tr onmouseover='this.style.backgroundColor="#FAED7D";' onmouseout='this.style.backgroundColor="white";'>
		<td width="80" align="center">${mon.num }</td>
		<td width="60" align="center"><fmt:formatDate value="${mon.reg_date}" pattern="MM.dd"/></td>
		<td width="60" align="center"><fmt:formatDate value="${mon.reg_date}" pattern="HH:mm"/></td>
		<td width="180" align="center">${mon.home } vs ${mon.away }</td>
		<td width="80" align="center">${mon.homept } : ${mon.awaypt }</td>
		<td width="80" align="center">${mon.flag }</td>
		<td width="90" align="center">
		<a href="/toto/game/gameMatchPro.to?league=${mon.league }&home=${mon.home }&away=${mon.away }&flag=${mon.flag}">
		<img border="0" src="/toto/game/image/btns_power.gif"/></a>
		</td>
		<td align="center" width="110">
		<c:if test="${sessionScope.memId == 'admin'}">
			<input type="button" value="����" onclick="location.href='/toto/game/modifyForm.to?num=${mon.num}'">&nbsp;
<%-- 			<input type="button" value="����" onclick="location.href='/toto/game/deletePro.to?num=${mon.num}'">
 --%>		</c:if>
		</td>
	</tr>
	</c:forEach>
	</c:if>
	

</table>
<table align="center" id="gl2">
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
	                  <li><a href="gameListMonth.to?pageNum=${startPage - 10}&league=${dto.league}&yy=${dto.yy}&mm=${dto.mm}&team=${dto.team}">&laquo;</a></li>
   				 </c:if>
   				 
                 <c:forEach begin="${startPage}" end="${endPage}" var="i" >
                 	<c:if test="${pageNum eq i}" >
	                 	<li class="active"><a href="gameListMonth.to?pageNum=${i}&league=${dto.league}&yy=${dto.yy}&mm=${dto.mm}&team=${dto.team}">${i}</a></li>
                    </c:if>
                    <c:if test="${pageNum ne i}" >
	                 	<li><a href="gameListMonth.to?pageNum=${i}&league=${dto.league}&yy=${dto.yy}&mm=${dto.mm}&team=${dto.team}">${i}</a></li>
                    </c:if>
				</c:forEach>  
				
				<c:if test="${endPage < pageCount }" >
    				<li><a href="gameListMonth.to?pageNum=${startPage + 10}&league=${dto.league}&yy=${dto.yy}&mm=${dto.mm}&team=${dto.team}">&raquo;</a></li>	
   				</c:if>	
                </ul>
            </div>
        </div>     
</c:if>
</td>
</tr>
</table>
</body>
</html>
</div>