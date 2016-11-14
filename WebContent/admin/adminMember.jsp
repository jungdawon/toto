<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${top ne null}">
	<jsp:include page="${top}" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#text	{

	position: absolute;
	top: 150px;
	left: 120px;
	width: 1150px;}
</style>
</head>
</br>
</br>
</br>
</br>
</br>
<body>
<div id="text">
	<center>
		<c:if test="${count> 0 }">
			<table align="center" border=1>
				<tr style="font-size: 15px" height="30px" bgcolor="#E7E7E7">
					<td align="center" width="80px">ID</td>
					<td align="center" width="80px">이름</td>
					<td width="90" align="center">우편번호</td>
					<td align="center" width="440">도로명 주소</td>
					<td align="center" width="130px">전화번호</td>
					<td align="center" width="160px">E-Mail</td>
					<td width="110" align="center">가입일</td>
					<td width="100" align="center">회원정보변경</td>
				</tr>

				<c:forEach var="memberlist" items="${memberlist}">
					<tr height="20px">
						<td align="center">${memberlist.id}</td>
						<td align="center">${memberlist.name}</td>
						<td align="center">${memberlist.zip1}-${memberlist.zip2}</td>
						<td align="center">${memberlist.address1}</td>
						<td align="center">
							${memberlist.phone1}-${memberlist.phone2}-${memberlist.phone3}</td>
						<td align="center">${memberlist.mail1}@${memberlist.mail2}</td>
						<td align="center">${memberlist.reg_date}</td>
						<td align="center">
						<input size="200" type=button value=삭제 onclick="location.href='/toto/admin/memberdelete.to?id=${memberlist.id}'";">
						</td>



					</tr>
				</c:forEach>
				

			</table>
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
	                  <li><a href="adminMember.to?pageNum=${startPage - 10}">&laquo;</a></li>
   				 </c:if>
   				 
                 <c:forEach begin="${startPage}" end="${endPage}" var="i" >
                 	<c:if test="${pageNum eq i}" >
	                 	<li class="active"><a href="adminMember.to?pageNum=${i}">${i}</a></li>
                    </c:if>
                    <c:if test="${pageNum ne i}" >
	                 	<li><a href="adminMember.to?pageNum=${i}">${i}</a></li>
                    </c:if>
				</c:forEach>  
				
				<c:if test="${endPage < pageCount }" >
    				<li><a href="adminMember.to?pageNum=${startPage + 10}">&raquo;</a></li>	
   				</c:if>	
                </ul>
            </div>
        </div>
     
			
			
			
			
		</c:if>
	</center>
</div>
</body>
</html>