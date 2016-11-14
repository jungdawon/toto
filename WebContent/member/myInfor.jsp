<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${top ne null}" >
		<jsp:include page="${top}"/>
</c:if>
<br />
<br />
<br />
<link href="../notice.board/style.css" rel="stylesheet" type="text/css">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보보기</title>
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
<center><h1>회원정보</h1></center>
<form method="post" name="userinput" action="/toto/member/myInforForm.to" >
<table align="center" width="550" border="0">
	<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
	<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
	<tr height="30">
<td width="150" >아이디</td>
<td>
${my.id }
</td>
</tr>

<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="30">
<td>이름</td>
<td>${my.name }
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>

<tr height="30">
<td>휴대전화</td>
<td>${my.phone1 }&nbsp;-&nbsp;
${my.phone2 }&nbsp;-&nbsp;
${my.phone3 }
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="30">
<td>E-mail</td>
<td>
${my.mail1 }&nbsp;@&nbsp;
${my.mail2 }
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
    <tr height="30"> 
      <td width="200">주소</td>
      <td width="400"> 
${my.zip1}&nbsp;-&nbsp;
${my.zip2 }
<br>
도로명 :
${my.address1 }<br>
지번명 :
${my.address2 }

</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="30">
<td>은행명</td>
<td>${my.bank }
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<td>계좌번호</td>
<td>${my.account }</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="30">
<td>예치금</td>
<td>${my.cash }
</td>
</tr>
<tr height="1"><td bgcolor="#D4F4FA" colspan="6"></td></tr>
<tr height="2"><td bgcolor="#C2E2E8" colspan="6"></td></tr>
</table>

<br>


<center>
       <input style="background-color: '#C2E2E8';" type="submit" name="modify" value="정보수정" >&nbsp;&nbsp;
       <input style="background-color: '#C2E2E8';" type="button" value="회원탈퇴" onclick="javascript:window.location='/toto/member/deleteForm.to'">&nbsp;&nbsp;
       <input style="background-color: '#C2E2E8';" type="button" value="메인으로" onclick="javascript:window.location='/toto/top/main.to'">   
</center>
</form>


</div>  
</body>
</html>
